// ─────────────────────────────────────────────────────────────────────────────
// Decorative honeycomb — a Typst port of `Honeycomb.vue` from the Aalto
// Scientific Computing Slidev theme (slidev-theme-aalto-scicomp; seen in
// https://eglerean.github.io/litrev-with-ai).
//
// Pointy-top hexagons on a seeded, deterministic grid: a `density` fraction of
// cells gets an outline, a small `accent-odds` fraction is drawn in the accent
// colour (a few of those filled), and optional `text` is placed letter-by-
// letter inside cells (rows separated by "\n"). A `fade` dissolves the comb
// toward one edge — implemented here as a per-cell alpha ramp, which is
// exactly what the SVG mask in the Vue component does.
//
// No layout()/measure() anywhere: everything is computed from the numeric
// width/height, so it is safe inside Touying slide backgrounds (see SKILL.md
// on pagination).
//
// The Vue component uses mulberry32; Typst 0.15 has no bit operations, so the
// PRNG here is a classic LCG mod 2^32. Same guarantee that matters: a given
// `seed` always renders the identical comb.
// ─────────────────────────────────────────────────────────────────────────────

#let hex-m32 = 4294967296

// honeycomb()'s `text:` parameter shadows the built-in `text` function inside
// its body — capture the element function at file scope first.
#let draw-text = text

/// One PRNG step (Knuth LCG). Thread the state through a dict field — Typst
/// `let` bindings cannot be reassigned.
#let hex-rng-step(s) = calc.rem(1664525 * s + 1013904223, hex-m32)

/// Uppercase a string. Typst has no case mapping, only `to-unicode()`
/// codepoints — so map the three Latin ranges where upper = lower − 32
/// (ASCII a–z, Latin-1 à–ö, ø–þ).
#let hex-upper(s) = {
  let out = ()
  for c in s.clusters() {
    let cp = c.to-unicode()
    if (cp >= 97 and cp <= 122) or (cp >= 224 and cp <= 246) or (cp >= 248 and cp <= 254) {
      cp = cp - 32
    }
    out.push(str.from-unicode(cp))
  }
  out.join("")
}

/// Plain text of content — headings, markup (`*emph*`, sequences), spaces —
/// or `none` when some part has no textual reading (images, math…). NB:
/// `type()` of any content is `content`; the element kind is `.func()`, and
/// containers expose their kids through `fields().at("children"/"body")`.
#let hex-plain-text(c) = {
  if c == none or type(c) != content { return none }
  let f = c.func()
  if f == heading { return hex-plain-text(c.body) }
  if f == text { return c.text }
  // `space`/`linebreak` are not exposed as variables; repr names them
  let fname = repr(f)
  if fname == "space" or fname == "linebreak" { return " " }
  let flds = c.fields()
  let keys = flds.keys()
  if keys.contains("children") {
    let out = ""
    for kid in flds.at("children") {
      let t = hex-plain-text(kid)
      if t == none { return none }
      out += t
    }
    return out
  }
  if keys.contains("body") { return hex-plain-text(flds.at("body")) }
  none
}

/// Turn a heading string into honeycomb letters: 2–3 short words become one
/// word per row (like "SCI\nCOMP"); anything else stays a single row (the
/// cells shrink to fit, same rule as the Vue component).
#let hex-letters(s) = {
  let u = hex-upper(s)
  let words = u.split(" ").filter(w => w != "")
  if words.len() >= 2 and words.len() <= 3 and words.all(w => w.len() <= 9) {
    words.join("\n")
  } else { u }
}

/// Words ignored when deriving initials from a heading.
#let hex-stopwords-lower = (
  "the", "a", "an", "of", "for", "and", "or", "to", "in", "on", "with",
  "using", "one", "your", "is", "are", "was", "were", "we", "you", "it",
  "at", "by", "from", "as", "into", "about", "not", "no", "yes",
)
// Typst has no case mapping on strings, so compare in the case we can make.
#let hex-stopwords = hex-stopwords-lower.map(w => hex-upper(w))

/// Initials of the content words of a heading ("Different tools, one
/// workflow" → "DTW"). Returns "" when nothing is left after stopwords.
#let hex-initials(s) = {
  let out = ()
  for w in s.split(" ").filter(w => w != "") {
    if not hex-stopwords.contains(hex-upper(w)) {
      out.push(hex-upper(w.clusters().at(0)))
    }
  }
  out.join("")
}

/// Greedy word-wrap of a heading into honeycomb rows that fit `width` at a
/// readable cell size. Searches the radius downwards from `radius:` to
/// `min-radius:` (0.5 pt steps) and returns the first `(lines:, radius:)`
/// whose wrap needs at most `max-rows:` rows, or `none` when even the floor
/// cannot hold the heading — the caller then degrades the text (initials)
/// instead of the geometry.
#let hex-wrap-text(s, width: 250pt, radius: 26pt, min-radius: 14pt, max-rows: 4) = {
  let words = hex-upper(s).split(" ").filter(w => w != "")
  if words.len() == 0 { return none }
  let W = width / 1pt
  let r-top = radius / 1pt
  let r-min = min-radius / 1pt
  let steps = calc.floor((r-top - r-min) / 0.5)
  for i in range(0, steps + 1) {
    let R = r-top - i * 0.5
    if R < r-min { break }
    // columns that fit the panel at this radius (same fit rule as honeycomb)
    let C = calc.floor(W * 0.9 / (R * calc.sqrt(3)) - 0.5)
    if C < 1 { continue }
    let lines = ()
    let cur = ""
    for w in words {
      if cur == "" {
        cur = w
      } else if cur.len() + 1 + w.len() <= C {
        cur = cur + " " + w
      } else {
        lines.push(cur)
        cur = w
      }
    }
    if cur != "" { lines.push(cur) }
    let longest = calc.max(0, ..lines.map(l => l.len()))
    if lines.len() <= max-rows and longest <= C {
      return (lines: lines, radius: R * 1pt)
    }
  }
  none
}

/// Vary a base seed with a string, so each section heading gets its own comb
/// layout deterministically.
#let hex-seed-for(s, base: 7) = {
  let sum = s.clusters().map(c => c.to-unicode()).fold(0, (a, b) => a + b)
  base + calc.rem(sum, 89)
}

/// The honeycomb itself. Returns a `block` of exactly `width` × `height`.
///
/// - width / height (length): panel size.
/// - radius (length): cell circumradius; shrunk automatically when `text`
///   would not fit the width.
/// - density (float): fraction of background cells drawn (0–1).
/// - accent-odds (float): fraction of drawn cells in the accent colour; 40 %
///   of those are filled instead of outlined.
/// - seed (int): PRNG seed — same seed, same comb.
/// - text (str): letters placed in cells; "\n" (or a real newline) separates
///   rows. Rendered uppercase.
/// - fade (str): "left" | "right" | "top" | "bottom" | "radial" | "window" |
///   "none" — the direction the comb dissolves *towards*. "window" inverts
///   the idea: the comb is visible ONLY inside the `fade-window:` rectangle
///   (fractions of the panel) and dissolves out over `fade-margin:` inside
///   its edges — used to keep a watermark clear of logos and text columns.
/// - ink / ink-alpha: plain-cell stroke colour and its full opacity (the fade
///   multiplies it).
/// - accent-colour: stroke (and fill) of the accent cells.
/// - letter-fill / letter-ink: cell background and glyph colour for letters;
///   letters are never faded.
#let honeycomb(
  width: 250pt,
  height: 320pt,
  radius: 26pt,
  density: 0.5,
  accent-odds: 0.08,
  seed: 42,
  text: "",
  fade: "none",
  fade-window: (x0: 0.0, x1: 1.0, y0: 0.0, y1: 1.0),
  fade-margin: 0.12,
  stroke-width: 1.5pt,
  ink: black,
  ink-alpha: 16%,
  accent-colour: rgb("#CC785C"),
  accent-fill-alpha: 85%,
  letter-fill: white,
  letter-ink: black,
) = {
  let W = width / 1pt
  let H = height / 1pt

  // ── letter rows ──────────────────────────────────────────────────────────
  let lines = if text != none and text != "" {
    text.replace("\\n", "\n").split("\n").map(l => hex-upper(l))
      .filter(l => type(l) == str)
  } else { () }

  // Shrink the cells when the longest row would not fit the width (Vue: R).
  // NB: no `return` inside this expression block — it would return from
  // honeycomb() itself, not from the block.
  let R = {
    let base = radius / 1pt
    if lines.len() == 0 { base }
    else {
      let longest = calc.max(0, ..lines.map(l => l.clusters().len()))
      if longest == 0 { base }
      else { calc.min(base, (W * 0.9) / ((longest + 0.5) * calc.sqrt(3))) }
    }
  }
  let dx = R * calc.sqrt(3)   // column pitch
  let dy = R * 1.5            // row pitch

  // ── which cells hold letters (centred block, centred per row) ───────────
  let letters = {
    let m = (:)
    if lines.len() > 0 {
      let first-row = calc.round((H / 2 - (lines.len() - 1) * dy / 2) / dy)
      for li in range(lines.len()) {
        let chars = lines.at(li).clusters()
        let row = first-row + li
        let x-off = if calc.rem(calc.abs(row), 2) == 1 { dx / 2 } else { 0 }
        let start-col = calc.round((W / 2 - x-off - (chars.len() - 1) * dx / 2) / dx)
        for ci in range(chars.len()) {
          m.insert(str(row) + "," + str(start-col + ci), chars.at(ci))
        }
      }
    }
    m
  }

  // ── cell grid + per-cell dice rolls (order matters: roll, then pick) ────
  let cells = ()
  let rng = (s: seed)
  let max-row = calc.ceil(H / dy) + 1
  let max-col = calc.ceil(W / dx) + 1
  for row in range(-1, max-row + 1) {
    let x-off = if calc.rem(calc.abs(row), 2) == 1 { dx / 2 } else { 0 }
    for col in range(-1, max-col + 1) {
      let x = col * dx + x-off
      let y = row * dy
      // no closure for the PRNG: functions capture outer variables
      // read-only, so step the state inline (plain blocks may mutate it)
      let roll = { rng.s = hex-rng-step(rng.s); rng.s / hex-m32 }
      let pick = { rng.s = hex-rng-step(rng.s); rng.s / hex-m32 }
      let ch = letters.at(str(row) + "," + str(col), default: none)
      if ch != none and ch != " " {
        cells.push((x: x, y: y, kind: "letter", char: ch))
      } else if roll < density {
        cells.push((
          x: x, y: y,
          kind: if pick < accent-odds * 0.4 { "accent-fill" }
            else if pick < accent-odds { "accent" }
            else { "plain" },
        ))
      }
    }
  }

  // ── fade → alpha ramp (what the SVG mask does in the Vue component) ─────
  let fade-alpha = (x, y) => {
    if fade == "none" { return 1.0 }
    let fx = x / W
    let fy = y / H
    let a = if fade == "left" { fx / 0.65 }
      else if fade == "right" { (1 - fx) / 0.65 }
      else if fade == "top" { fy / 0.65 }
      else if fade == "bottom" { (1 - fy) / 0.65 }
      else if fade == "radial" {
        // objectBoundingBox radial gradient: cx .5, cy .5, r .7, ramp .15→.9
        let d = calc.sqrt(
          calc.pow((fx - 0.5) / 0.7, 2) + calc.pow((fy - 0.5) / 0.7, 2))
        (d - 0.15) / 0.75
      }
      else if fade == "window" {
        // rectangular mask: visible inside fade-window, dissolved outside;
        // per-axis ramp of fade-margin inside each window edge
        let m = fade-margin
        let ax = calc.min((fx - fade-window.x0) / m, (fade-window.x1 - fx) / m)
        let ay = calc.min((fy - fade-window.y0) / m, (fade-window.y1 - fy) / m)
        calc.min(ax, ay)
      }
      else { 1.0 }
    calc.max(0.0, calc.min(1.0, a))
  }

  // ── draw ─────────────────────────────────────────────────────────────────
  let rr = R * 1pt
  let hex-w = calc.sqrt(3) * rr   // pointy-top: width √3·r, height 2·r
  // unit hexagon, bbox pinned to (0,0) — polygon() anchors its layout box at
  // the points' origin, so centred points would shift the shape up-left
  // (top vertex first, clockwise)
  let pts = ()
  for i in range(6) {
    let ang = calc.pi / 2 - calc.tau / 6 * i
    pts.push((hex-w / 2 + rr * calc.cos(ang), rr - rr * calc.sin(ang)))
  }
  block(width: width, height: height, clip: true, {
    for c in cells {
      let a = if c.kind == "letter" { 1.0 } else { fade-alpha(c.x, c.y) }
      if a < 0.02 { continue }
      let cx = c.x * 1pt
      let cy = c.y * 1pt
      // polygon() lays out at its points' bbox top-left = centre − (√3r/2, r)
      let px = cx - hex-w / 2
      let py = cy - rr
      if c.kind == "letter" {
        place(top + left, dx: px, dy: py,
          polygon(fill: letter-fill, stroke: (stroke-width * 1.4) + letter-ink, ..pts))
        place(top + left, dx: cx - rr, dy: cy - rr,
          block(width: 2 * rr, height: 2 * rr,
            align(center + horizon,
              draw-text(size: 0.8 * rr, weight: "bold", fill: letter-ink, c.char))))
      } else if c.kind == "accent-fill" {
        place(top + left, dx: px, dy: py,
          polygon(fill: accent-colour.transparentize(100% - accent-fill-alpha * a),
            stroke: none, ..pts))
      } else {
        let stroke-col = if c.kind == "accent" {
          accent-colour.transparentize(100% - 100% * a)
        } else {
          ink.transparentize(100% - ink-alpha * a)
        }
        place(top + left, dx: px, dy: py,
          polygon(fill: none, stroke: stroke-width + stroke-col, ..pts))
      }
    }
  })
}
