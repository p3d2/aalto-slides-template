// ─────────────────────────────────────────────────────────────────────────────
// Aalto slides theme — a Touying (Typst) presentation theme following the
// Aalto University visual identity (https://brand.aalto.fi).
//
// Brand source of truth: the full site (138 CMS pages) is mirrored offline in
//   reference/brand-aalto-fi/pages/      readable Markdown of every page
//   reference/brand-aalto-fi/INDEX.md    site map
//   reference/brand-aalto-fi/notes/design-tokens.md   token digest
// The machine-readable tokens are generated into theme/tokens.typ (do not edit
// that file by hand — regenerate with reference/brand-aalto-fi/refresh.sh).
//
// This is NOT a copy of Aalto's official PowerPoint template (example/blank.pdf);
// it is our own Typst deck theme built on the brand guidelines.
//
// Brand rules baked in:
//   • Inter is the typeface for everything (Bold + Regular; Arial is only an
//     Office fallback). Besley is the optional serif complement.
//   • Headlines: Inter Bold with tight tracking (brand: "tracking -25").
//   • Left-aligned, ragged-right paragraphs; sentence case; no ALL CAPS.
//   • White (or black, for "drama") as predominant background; brand colours
//     used sparingly as accents. Brand colours are designed for BLACK
//     foreground text (accessibility: ≥ 7:1 contrast with black).
//   • University colours: Blue #46A5FF, Red #FD6360, Yellow #F7E159.
//     School colours exist per school (e.g. Science orange #FF8D4F) — use a
//     school colour only for that school's material, never mixed.
//   • The logo is a registered trademark: ONLY the originals from the logo
//     generator (https://aaltologo.fi) may be used, never redrawn or altered.
//     Drop the downloaded original into assets/logo/ and pass it via
//     config-info(logo: image(...)). Black logo on light backgrounds, white
//     logo on dark backgrounds.
// ─────────────────────────────────────────────────────────────────────────────

#import "@preview/touying:0.8.0": *

// ── Brand tokens (generated) ─────────────────────────────────────────────────

#import "tokens.typ": brand-colours, neutral-colours, tint-colours, type-styles, aspects, spacing, font-sizes, line-heights, letter-spacings, school-colours as raw-school-colours
#import "logo-metrics.typ": logo-metrics
#import "honeycomb.typ": honeycomb, hex-plain-text, hex-wrap-text, hex-initials, hex-seed-for

// University brand colours (official HEX from brand.aalto.fi → brand-colours)
#let aalto-blue = brand-colours.aaltoBlue1     // #46A5FF · PMS 2925
#let aalto-red = brand-colours.aaltoRed1       // #FD6360 · PMS 1787
#let aalto-yellow = brand-colours.aaltoYellow1 // #F7E159 · PMS 106

// Dark companions of the brand colours (tokens: *2). Use them for text or
// thin lines on white when the bright brand colour would be too light.
#let aalto-blue-dark = brand-colours.aaltoBlue2     // #183856
#let aalto-red-dark = brand-colours.aaltoRed2       // #501F1E
#let aalto-yellow-dark = brand-colours.aaltoYellow2 // #6C6227

// Supportive palette: black & white + greyscales are the key colours.
// neutral.9 is pure black (the brand black); neutral.8 (#151515) is what the
// design system itself uses as "black" for dark surfaces.
#let aalto-black = neutral-colours.at("9")
#let aalto-white = neutral-colours.at("1")
#let aalto-dark = neutral-colours.at("8")   // dark slide background
#let aalto-gray = neutral-colours.at("5")   // #505050 · secondary text
#let aalto-gray-light = tint-colours.blackTint4 // #737373 · dimmed text

// School signature colours — use only for that school's material, never mixed.
#let school-colours = (
  arts: raw-school-colours.arts1,  // Arts, Design and Architecture · PMS 1235
  eng: raw-school-colours.eng1,    // Engineering · PMS 252
  elec: raw-school-colours.elec1,  // Electrical Engineering · PMS 2715
  biz: raw-school-colours.biz1,    // Business · PMS 375
  chem: raw-school-colours.chem1,  // Chemical Engineering · PMS 339
  sci: raw-school-colours.sci1,    // Science · PMS 164
)

// The dark companion of each school colour (tokens: *2) — for text on white.
#let school-colours-dark = (
  arts: raw-school-colours.arts2,
  eng: raw-school-colours.eng2,
  elec: raw-school-colours.elec2,
  biz: raw-school-colours.biz2,
  chem: raw-school-colours.chem2,
  sci: raw-school-colours.sci2,
)

// Fonts (brand: Inter for all communication; Besley as serif complement;
// Source Code Pro is the code face in the design system).
#let aalto-font = "Inter"
#let aalto-serif = "Besley"
#let aalto-mono = "Source Code Pro"

// Figure aspect ratios straight from the tokens (hd == the slide canvas).
#let aalto-aspects = aspects

// ── Type scale & density ─────────────────────────────────────────────────────
//
// The brand's own web scale (notes/design-tokens.md) puts body copy at 18 px
// and h1 at 64 px — i.e. a 1 : 3.6 ratio and only a handful of sizes, which is
// exactly the "maximum three type sizes per surface" rule. A slide canvas is
// 841.89 × 473.56 pt, and it is read from the back of a room, so we keep the
// brand's *ratios* but choose our own absolute base size.
//
// Everything in this theme is specified in `em`, so changing the base size
// rescales the whole deck. Pick a preset with `density:`, fine-tune with
// `scale:`, or set `body-size:` directly.
#let density-presets = (
  roomy: 24pt,     // "PowerPoint default" feel — everything as large as possible
  default: 20pt,   // comfortable for a teaching room / seminar
  compact: 17pt,   // text-heavy talk, more content per slide
  dense: 15pt,     // poster-like density; only for handout-style decks
)

// Relative sizes inside a slide, derived from the brand's own proportions
// (title h2 : body default ≈ 24 : 18 px on desktop, section h1 = 2× body).
#let type-ratios = (
  section: 2.0,     // `= Section` slide
  slide-title: 1.2, // `== Slide title`
  subtitle: 0.9,
  subheading: 0.85, // `=== Subheading`
  header: 0.5,      // running header / footer
  footer: 0.46,
  footnote: 0.55,
)

/// Resolve the base body size from the theme options.
#let resolve-body-size(body-size: auto, density: "default", scale: 1.0, title-size: auto) = {
  if body-size != auto { body-size }
  else if title-size != auto { title-size }   // deprecated alias, kept working
  else {
    let base = density-presets.at(
      density,
      default: 20pt,
    )
    base * scale
  }
}

/// Colours dark enough to need white text on top (the *2 companions and the
/// dark neutrals). Everything else in the brand palette is a bright accent that
/// takes black text.
#let dark-ink-colours = (
  aalto-black, aalto-dark, aalto-blue-dark, aalto-red-dark, aalto-yellow-dark,
  raw-school-colours.arts2, raw-school-colours.eng2, raw-school-colours.elec2,
  raw-school-colours.biz2, raw-school-colours.chem2, raw-school-colours.sci2,
)

/// Ink colour that stays legible on top of `colour`.
/// Brand rule: brand colours are designed for BLACK foreground text;
/// the dark companions (*2) need white.
#let ink-on(colour) = if dark-ink-colours.contains(colour) { aalto-white } else { aalto-black }

/// A readable, on-brand version of an accent colour for use *on white*
/// (the bright brand colours fail contrast as text). Uses the official tint4
/// token when we recognise the accent, else darkens it.
#let accent-on-white(accent) = {
  let known = (
    (aalto-blue, tint-colours.aaltoBlueTint4),
    (aalto-red, tint-colours.aaltoRedTint4),
    (aalto-yellow, tint-colours.aaltoYellowTint4),
    (aalto-blue-dark, aalto-blue-dark),
    (aalto-red-dark, aalto-red-dark),
    (aalto-yellow-dark, aalto-yellow-dark),
    (school-colours.sci, tint-colours.sciTint4),
    (school-colours.chem, tint-colours.chemTint4),
    (school-colours.elec, tint-colours.elecTint4),
    (school-colours.eng, tint-colours.engTint4),
    (school-colours.arts, tint-colours.artsTint4),
    (school-colours.biz, tint-colours.bizTint4),
  )
  for pair in known {
    if pair.at(0) == accent { return pair.at(1) }
  }
  accent.darken(45%)
}

/// Readable colour for `*strong*` on a slide whose background is the accent
/// (section, focus) or another non-white colour. Touying renders strong as
/// `alert` = the raw accent, which vanishes into an accent-coloured
/// background (worst case: `accent: aalto-dark` → black on black).
///   - dark background (white ink)  → the background lifted 55 %
///   - white background             → the usual `accent-on-white` alert look
///   - brand-colour background      → the dark companion of that colour
#let strong-on(bg, fg, accent) = {
  if fg == aalto-white { return bg.lighten(55%) }
  if bg == aalto-white { return accent-on-white(accent) }
  let known = (
    (aalto-blue, aalto-blue-dark), (aalto-red, aalto-red-dark),
    (aalto-yellow, aalto-yellow-dark),
    (school-colours.sci, school-colours-dark.sci),
    (school-colours.chem, school-colours-dark.chem),
    (school-colours.eng, school-colours-dark.eng),
    (school-colours.elec, school-colours-dark.elec),
    (school-colours.biz, school-colours-dark.biz),
    (school-colours.arts, school-colours-dark.arts),
  )
  for pair in known { if pair.at(0) == bg { return pair.at(1) } }
  bg.darken(45%)
}

// ── Content helpers ──────────────────────────────────────────────────────────

/// How tall the *visible* logo is, relative to the base font size, in the
/// places the theme draws it. Derived from the official PowerPoint template
/// (example/blank.pptx, 960 × 540 pt canvas): its logo is 22.7 pt tall on
/// content slides (4.2 % of the height) and 45.4 pt on the title slide (8.4 %).
/// Our 16-9 canvas is 841.89 × 473.56 pt, so the same fractions are
/// ≈ 1.05 em and ≈ 2 em at the default 20 pt base size. (Aalto's content slides
/// use the bare mark; the generator does not offer a mark-only original, so we
/// use the primary lock-up at the same overall height.)
#let logo-sizes = (content: 1.05em, title: 2em)

/// Where the corner logo sits, measured from the *page* edges (not the text
/// area) so it lands in the same spot on every slide type. Official template:
/// 3.34 % of the width from the left, 5.9 % of the height from the bottom,
/// 6.3 % from the top on the title slide. We align with our own text block
/// (2.6 em) instead of the raw Aalto margin, so the logo and the copy share an
/// edge — and the same numbers everywhere.
#let logo-margins = (x: 2.6em, bottom: 1.4em, top: 1.5em)

// The slide canvas at 16-9 (Touying's presentation size). The honeycomb
// panels are computed numerically (a seeded cell grid), so they need real
// dimensions — percentages cannot be resolved inside a background place().
#let hex-canvas = (w: 841.89pt, h: 473.56pt)

/// Page margins of content slides. The footer and `credit-line` measure from
/// the bottom of the text area, so they must track these numbers — the theme
/// applies them via `set page(margin: content-margins)`.
/// Bottom = the corner mark's band + clearance: the mark's ink bottom sits at
/// logo-margins.bottom (1.4em) and the mark is ~1.0em tall, so its top is at
/// ~2.4em. At 2.3em the body area reached *into* that band and a full page of
/// flow content (a long `answerline` fill, say) broke level with the logo —
/// 2.9em makes long cards jump to the next slide half an em earlier instead.
#let content-margins = (top: 1.9em, bottom: 2.9em, x: 2.6em)

/// Split one of our logo paths into its parts.
/// `/assets/logo/primary/aalto-fi-se-en-black-quote.pdf` →
///   (prefix: "/assets/logo/", lockup: "primary", lang: "fi-se-en",
///    colour: "black", mark: "quote")
#let logo-parts(logo) = {
  let parts = logo.split("/")
  let base = parts.at(-1)
  let stem = if base.ends-with(".pdf") { base.slice(0, base.len() - 4) } else { base }
  let toks = stem.split("-")                       // aalto, [lang…], colour, mark
  let want = if toks.contains("white") { "white" } else { "black" }
  let ci = toks.enumerate().filter(p => p.at(1) == want).at(0).at(0)
  (
    prefix: parts.slice(0, -2).join("/") + "/",
    lockup: parts.at(-2),
    lang: if ci > 1 { toks.slice(1, ci).join("-") } else { "en" },
    colour: toks.at(ci),
    mark: toks.at(-1),
  )
}

/// Build a logo path from scratch (project-root relative, see `logo-image`).
///
/// ```typst
/// aalto-logo()                                  // primary, EN, black, A"
/// aalto-logo(lockup: "mark", mark: "exclaim")   // the bare A! logomark
/// aalto-logo(lockup: "tertiary", colour: "white")
/// ```
#let aalto-logo(lockup: "primary", lang: "en", colour: "black", mark: "quote") = {
  let lxt = if lang == "en" or lockup == "mark" { "" } else { lang + "-" }
  "/assets/logo/" + lockup + "/aalto-" + lxt + colour + "-" + mark + ".pdf"
}

/// Same logo, different variant — swap any part of the name.
///
/// ```typst
/// logo-with(deck-logo, mark: "exclaim")                     // A! everywhere
/// logo-with(deck-logo, lockup: "mark", colour: "white")     // big white mark
/// ```
#let logo-with(logo, lockup: auto, lang: auto, colour: auto, mark: auto) = {
  if type(logo) != str { logo }    // pre-built image content: nothing to rewrite
  else {
    let p = logo-parts(logo)
    let lock = if lockup != auto { lockup } else { p.lockup }
    let lg = if lang != auto { lang } else { p.lang }
    let co = if colour != auto { colour } else { p.colour }
    let mk = if mark != auto { mark } else { p.mark }
    aalto-logo(lockup: lock, lang: lg, colour: co, mark: mk)
  }
}

/// Same artwork, other colour — swap the `black`/`white` token in the file
/// name. Works for any of our naming schemes (`aalto-…-black-…`,
/// `scicomp/asc-black.svg`, …); returns the path unchanged when no colour
/// token is present (e.g. a custom image).
#let logo-colour(logo, colour) = {
  if type(logo) != str { logo }
  else {
    let other = if colour == "white" { "black" } else { "white" }
    if logo.contains("-" + colour + "-") or logo.contains("-" + colour + ".") { logo }
    else if logo.contains("-" + other + "-") { logo.replace("-" + other + "-", "-" + colour + "-") }
    else if logo.contains("-" + other + ".") { logo.replace("-" + other + ".", "-" + colour + ".") }
    else { logo }
  }
}

/// The Aalto Scientific Computing hexagon logo (`assets/logo/scicomp/`,
/// fetched by `assets/logo/fetch-scicomp.py`). `colour: "black"` for light
/// backgrounds, `"white"` for dark ones. There is no separate Triton logo —
/// the ASC hexagons brand all of the team's material, Triton included.
#let scicomp-logo(colour: "black") = "/assets/logo/scicomp/asc-" + colour + ".svg"

/// The deck's logo with the theme's `mark:` option applied (auto = keep the
/// mark that the path already names). `none` when the deck has no logo. Pass a
/// slide-level `info` to let `#title-slide(logo: ..)` overrides through.
#let deck-logo(info, store) = {
  let logo = if "logo" in info { info.logo } else { none }
  let mark = store.at("mark", default: auto)
  if logo == none or mark == auto { logo } else { logo-with(logo, mark: mark) }
}

/// What the bottom-left corner shows. Aalto's own template puts the *bare
/// logomark* there (no wordmark), so that is the default: the corner is built
/// from the deck logo's colour/mark/language with `lockup:` swapped to `mark`
/// — which is only available as a derived file, see `assets/logo/make-plain.py`.
/// Set the theme's `corner:` to another lockup (`"primary"`, …) or `"keep"` to
/// use the `logo:` path exactly as written.
#let corner-logo-of(self) = {
  let logo = deck-logo(self.info, self.store)
  let lock = self.store.at("corner", default: "mark")
  // "asc"/"both" are composition modes, not lock-up names: the Aalto part of
  // the corner is the bare mark in both cases (bottom-corner does the rest)
  if lock == "asc" or lock == "both" { lock = "mark" }
  if logo == none or lock == "keep" or type(logo) != str { logo }
  else { logo-with(logo, lockup: lock) }
}

/// Render a logo original so that `height` is the *visible* (ink) height and
/// the ink box — not the PDF page box — sits at the corner you place it at.
///
/// The originals from aaltologo.fi carry the brand's clear space *inside* the
/// file (only ~59 % of the primary lock-up's page box is ink), which is why a
/// plain `image(..., height: 1.6em)` looks small and floats away from the
/// margin. `logo` should be a path string (then the theme controls the size);
/// pre-built image content is passed through untouched.
///
/// The path is opened *here*, in `theme/aalto.typ`, so write it from the
/// project root — `"/assets/logo/primary/aalto-black-quote.pdf"` (that is what
/// `./slides` and the Makefile build with: `--root .`). A relative path would
/// resolve against `theme/`, not against the deck.
///
/// `anchor: bottom` aligns the ink's bottom edge (corner logos), `anchor: top`
/// its top edge (title slide); anything else (e.g. `anchor: "middle"`) leaves
/// the box centred — used by the oversized mark on the closing slide.
#let logo-image(logo, height: logo-sizes.content, anchor: bottom) = {
  if type(logo) != str {
    logo
  } else {
    let parts = logo.split("/")
    let key = parts.at(-2) + "/" + parts.at(-1)
    let m = logo-metrics.at(key, default: none)
    if m == none {
      // Not in theme/logo-metrics.typ (a school logo nobody measured yet, or a
      // custom file). Degrade to plain box sizing — the old behaviour, a bit
      // small — instead of failing the build. Run assets/logo/measure-logos.py
      // (or `fetch-logos.py --unit <school>`) to get exact ink geometry.
      image(logo, height: height)
    } else {
      // grow the box until the ink inside it has the requested height, then
      // slide the box so the ink's own edge lands on the placement point
      let box-h = height / (1 - m.t - m.b)
      let box-w = box-h * m.ratio
      move(
        dx: -m.l * box-w,
        dy: (if anchor == bottom { m.b * box-h }
             else if anchor == top { -m.t * box-h }
             else { 0pt }),
        image(logo, height: box-h, width: box-w),
      )
    }
  }
}

/// Width of the *visible* logo for a given visible height — 0 when the logo is
/// absent or unmeasured. Used to keep footer text clear of the corner logo.
#let logo-ink-width(logo, height: logo-sizes.content) = {
  if type(logo) != str { 0em }
  else {
    let parts = logo.split("/")
    let m = logo-metrics.at(parts.at(-2) + "/" + parts.at(-1), default: none)
    if m == none { 0em }
    else {
      let box-h = height / (1 - m.t - m.b)
      box-h * m.ratio * (1 - m.l - m.r)
    }
  }
}

/// The deck logo anchored to a *page* corner, ink-aligned — meant to be
/// passed to `set page(background:)`, which (unlike the text area) spans the
/// whole page, so the margins can't move it. `where: bottom` for content /
/// section slides, `where: top` for the title slide. Empty if `logo` is none.
#let corner-logo(logo, where: bottom) = {
  if logo != none {
    if where == bottom {
      // place() offsets are absolute directions: from `bottom`, dy must be
      // negative to move up into the page
      place(bottom + left, dx: logo-margins.x, dy: -logo-margins.bottom,
        logo-image(logo, height: logo-sizes.content, anchor: bottom))
    } else {
      place(top + left, dx: logo-margins.x, dy: logo-margins.top,
        logo-image(logo, height: logo-sizes.title, anchor: top))
    }
  }
}

/// Gray out content (the "dim" state for gray-in / gray-out effects).
/// Combine with #pause, #uncover, #only or use gray-in/gray-out below.
#let dim(body) = text(fill: aalto-gray-light, body)

/// The ASC hexagons in a given ink colour (black on light slides, white on
/// dark ones) — the corner companion of the Aalto logomark.
#let corner-asc(ink) = scicomp-logo(colour: if ink == aalto-white { "white" } else { "black" })

/// True when a logo path is one of the ASC hexagons — the theme's `asc-scale:`
/// only ever applies to those, so a deck co-branding with a different
/// organisation's mark is untouched by the knob.
#let is-asc-logo(logo) = type(logo) == str and logo.contains("/scicomp/")

/// The height an ASC mark is drawn at: `asc-scale:` multiplied into the slot's
/// own height. A hexagon comb carries much less visual mass than a text lock-up
/// of the same *ink* height, so decks usually want it a touch larger
/// (`asc-scale: 1.067` is +6.7 %). Any other logo comes back unchanged.
#let asc-h(logo, h, scale: 1.0) = if is-asc-logo(logo) { h * scale } else { h }

/// Half of what `asc-scale:` adds — the amount the mark must be pushed *back*
/// against its anchor so it grows about the centre of its slot instead of
/// dragging the row's shared ink line. `bottom-corner` (anchored by its bottom)
/// adds it, the title/closing co-brand (anchored by its top) subtracts it; at
/// `asc-scale: 1.0` it is `0pt` and every placement is exactly where it was.
/// Anything that is not an ASC mark gets `0pt`.
#let asc-shift(logo, h, scale: 1.0) = {
  if is-asc-logo(logo) { (h * scale - h) / 2 } else { 0pt }
}

/// The ink colour a logo path carries ("…-white-…" → white, else black).
#let corner-ink(logo) = {
  if type(logo) == str and logo.contains("-white") { aalto-white } else { aalto-black }
}

/// Total *ink* width of the bottom-left corner composition, so the footer
/// text can clear it. `mode` is the theme's `corner:` value; anything but
/// `"asc"`/`"both"` is the plain single-logo width. `rule:` mirrors the
/// theme's `corner-rule:` (divider drawn or not).
#let corner-ink-width(logo, mode, rule: true, height: logo-sizes.content, asc-scale: 1.0) = {
  let gap = 0.55em
  let rule-w = 0.8pt
  let asc-w = logo-ink-width(corner-asc(aalto-black), height: height * asc-scale)
  if logo == none { return if mode == "asc" or mode == "both" { asc-w } else { 0em } }
  if mode == "asc" { asc-w }
  else if mode == "both" {
    let mid = if rule { gap + rule-w + gap } else { 2 * gap }
    logo-ink-width(logo, height: height) + mid + asc-w
  }
  else { logo-ink-width(logo, height: height) }
}

/// Bottom-left corner of content and section slides. The theme's `corner:`
/// option picks the composition:
///   "mark" / other lock-up names / "keep" — the Aalto logo alone (default)
///   "asc"  — the ASC hexagons alone
///   "both" — Aalto logo first, then (when the theme's `corner-rule:` is on)
///            a thin grey vertical rule, then the ASC hexagons — all sharing
///            one ink bottom line
/// `ink` is the corner ink colour; the ASC variant and the rule colour follow
/// it (light grey rule on light slides, mid grey on dark).
#let bottom-corner(logo, mode, ink: aalto-black, rule: true, asc-scale: 1.0) = {
  let h = logo-sizes.content
  let ah = h * asc-scale
  // the comb grows about the middle of the corner band, so a big `asc-scale:`
  // cannot lift it clear of (or sink it under) the Aalto mark's centre line
  let shift = (ah - h) / 2
  let asc-dy = -logo-margins.bottom + shift
  let gap = 0.55em
  let rule-w = 0.8pt
  let rule-h = 1.4em
  let rule-colour = if ink == aalto-white { luma(160) } else { aalto-gray-light }
  if mode == "asc" or (mode == "both" and logo == none) {
    place(bottom + left, dx: logo-margins.x, dy: asc-dy,
      logo-image(corner-asc(ink), height: ah, anchor: bottom))
  } else if mode == "both" {
    place(bottom + left, dx: logo-margins.x, dy: -logo-margins.bottom,
      logo-image(logo, height: h, anchor: bottom))
    let x-after = logo-margins.x + logo-ink-width(logo, height: h) + gap
    if rule {
      place(bottom + left, dx: x-after,
        dy: -(logo-margins.bottom + h / 2 - rule-h / 2),
        rect(width: rule-w, height: rule-h, fill: rule-colour))
    }
    let asc-x = x-after + (if rule { rule-w + gap } else { 0pt })
    place(bottom + left, dx: asc-x, dy: asc-dy,
      logo-image(corner-asc(ink), height: ah, anchor: bottom))
  } else if logo != none {
    place(bottom + left, dx: logo-margins.x, dy: -logo-margins.bottom,
      logo-image(logo, height: h, anchor: bottom))
  }
}

/// The title slide's co-brand row: a thin vertical rule, then the org logo,
/// *after* the Aalto lock-up — the top-left twin of `bottom-corner`'s `"both"`
/// composition. Both marks share the top ink line (`logo-margins.top`, the same
/// line the top-right placement used) and the rule is centred on the shorter of
/// the two. This is what `org-logo-where: "after"` draws, and the title slide
/// uses it automatically when `hex:` or `art:` occupies the top-right corner.
/// The Aalto logo itself is still placed by `corner-logo(.., where: top)`; this
/// only adds what comes after it, so it must be called with the SAME logo and
/// height. `logo-ink-width` measures a *path* — pass raw content and the org
/// logo lands on top of the Aalto lock-up.
#let cobrand-after(logo, org, logo-height: logo-sizes.title, org-height: logo-sizes.title, rule: true, ink: aalto-black, org-shift: 0pt) = {
  let gap = 0.55em
  let rule-w = 0.8pt
  let rule-h = 1.4em
  let rule-colour = if ink == aalto-white { luma(160) } else { aalto-gray-light }
  let x-after = logo-margins.x + logo-ink-width(logo, height: logo-height) + gap
  // the rule sits on the Aalto lock-up's middle line — the row's reference, and
  // the line `org-shift` keeps the org logo centred on
  if rule {
    place(top + left, dx: x-after,
      dy: logo-margins.top + logo-height / 2 - rule-h / 2,
      rect(width: rule-w, height: rule-h, fill: rule-colour))
  }
  place(top + left, dx: x-after + (if rule { rule-w + gap } else { 0pt }),
    dy: logo-margins.top - org-shift,
    logo-image(org, height: org-height, anchor: top))
}

/// A small gray credit / source / footnote line pinned to the bottom of a
/// content slide, *bottom-aligned with the corner logo and the footer*: the
/// text box's bottom edge — descenders included, so a "q" or "g" tail reaches
/// the line while the baseline floats just above it — lands exactly on the
/// logo's ink bottom. `where: "center" | "left" | "right"`.
///
/// ```typst
/// #credit-line[Images © 2026 ... CC BY 4.0.]
/// ```
///
/// In the slide body `place(bottom)` anchors to the *text area* (which ends
/// `content-margins.bottom` above the page), so the box is dropped by the
/// difference — positive `dy` from a bottom anchor moves down.
#let credit-line(body, where: "center", size: type-ratios.footnote * 1em, fill: aalto-gray) = {
  let dir = if where == "left" { left } else if where == "right" { right } else { center }
  place(dir + bottom, dy: content-margins.bottom - logo-margins.bottom,
    text(size: size, fill: fill, body))
}

/// Show content dimmed first, then at full strength on the next click.
#let gray-in(body) = alternatives(dim(body), body)

/// Show content at full strength first, then dimmed on the next click.
#let gray-out(body) = alternatives(body, dim(body))

/// Simple two-column layout. `ratio` accepts any grid column spec,
/// e.g. two-col(ratio: (2fr, 1fr))[text][figure].
#let two-col(left, right, ratio: (1fr, 1fr), gutter: 2em) = grid(
  columns: ratio,
  column-gutter: gutter,
  left,
  right,
)

/// Placeholder box for figures while a deck is in draft.
#let figure-placeholder(label: [figure], ratio: 16/10, fill-colour: aalto-yellow) = layout(size => rect(
  width: size.width,
  height: size.width / ratio,
  fill: fill-colour.lighten(75%),
  stroke: 1pt + fill-colour.darken(10%),
  align(center + horizon, text(fill: fill-colour.darken(55%), weight: "bold", label)),
))

// ── Slide functions ──────────────────────────────────────────────────────────

/// Default content slide: section name top-left, optional logo top-right,
/// slide title (from `== heading`) with an accent underline, footer with
/// deck title + page number.
#let slide(
  config: (:),
  repeat: auto,
  setting: body => body,
  composer: auto,
  ..bodies,
) = touying-slide-wrapper(self => {
  let header(self) = {
    set text(size: type-ratios.header * 1em, fill: aalto-gray)
    components.left-and-right(
      utils.call-or-display(self, self.store.header),
      utils.call-or-display(self, self.store.header-right),
    )
  }
  let footer-line(self) = {
    // The footer text and the page number live in the page BACKGROUND, like
    // the corner logo, so all three share one exact line: each text box's
    // bottom edge (descenders included) lands on the logo's ink bottom
    // (`logo-margins.bottom` above the page edge). In the footer *region*
    // their position would drift with content height and margins.
    let logo = corner-logo-of(self)
    let mode = self.store.at("corner", default: "mark")
    let rule = self.store.at("corner-rule", default: true)
    let inset = if logo != none or mode == "asc" or mode == "both" {
      corner-ink-width(logo, mode, rule: rule,
        asc-scale: self.store.at("asc-scale", default: 1.0)) + .8em
    } else { 0em }
    place(bottom + left, dx: logo-margins.x + inset, dy: -logo-margins.bottom, {
      set text(size: type-ratios.footer * 1em, fill: aalto-gray)
      utils.call-or-display(self, self.store.footer)
    })
    place(bottom + right, dx: -logo-margins.x, dy: -logo-margins.bottom, {
      set text(size: type-ratios.footer * 1em, fill: aalto-gray)
      utils.call-or-display(self, self.store.footer-right)
    })
  }
  let self = utils.merge-dicts(
    self,
    config-page(header: header, background: {
      let logo = corner-logo-of(self)
      bottom-corner(logo, self.store.at("corner", default: "mark"),
        ink: corner-ink(logo), rule: self.store.at("corner-rule", default: true),
        asc-scale: self.store.at("asc-scale", default: 1.0))
      footer-line(self)
    }),
    config-common(subslide-preamble: self.store.subslide-preamble),
  )
  touying-slide(
    self: self,
    config: config,
    repeat: repeat,
    setting: setting,
    composer: composer,
    ..bodies,
  )
})

/// Centered slide (basis for title/focus slides).
#let centered-slide(config: (:), setting: body => body, ..args) = touying-slide-wrapper(self => {
  touying-slide(
    self: self,
    ..args.named(),
    config: config,
    setting: body => align(center + horizon, setting(body)),
    args.pos().sum(default: none),
  )
})

/// Title slide. Reads title/subtitle/author/date/institution/logo from
/// config-info (set them as theme arguments). `dark: true` gives the black
/// background variant ("heightened sense of drama" per the brand guide).
///
/// `art:` puts an image (or any content) in a right-hand panel — a photo,
/// a diagram, a second logo — and narrows the text block so they never
/// collide. `art-width:` is the panel's share of the page width. Image
/// *paths* are opened by the theme, so write them root-absolute like
/// `logo:` paths (`"/demo/figures/x.svg"`), not relative to the section file.
#let title-slide(config: (:), dark: false, art: none, art-width: 30%, ..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let accent = self.colors.primary
  let fg = if dark { aalto-white } else { aalto-black }
  let fg2 = if dark { luma(190) } else { aalto-gray }

  // Decorative honeycomb (theme knob `hex:`): a full-height panel bleeding
  // off the top, bottom and right page edges (only the left side fades,
  // towards the text), exactly like the Slidev scicomp cover.
  let hex = self.store.at("hex", default: none)
  let art-final = art
  let hex-place = none
  if art-final == none and hex != none {
    let pw = hex.at("panel-width", default: 40%)
    let w = pw * hex-canvas.w
    hex-place = place(top + right,
      block(width: pw, height: 100%,
        honeycomb(
          width: w, height: hex-canvas.h,
          radius: hex.at("panel-radius", default: 32pt),
          density: hex.at("density", default: 0.5),
          accent-odds: hex.at("accent-odds", default: 0.08),
          seed: hex.at("seed", default: 7),
          text: if hex.at("text", default: none) == none { "" } else { hex.at("text") },
          fade: hex.at("fade", default: "left"),
          stroke-width: hex.at("stroke-width", default: 1.5pt),
          ink: fg,
          ink-alpha: if dark { 14% } else { 16% },
          accent-colour: accent,
          letter-fill: if dark { aalto-dark.lighten(10%) } else { aalto-white },
          letter-ink: fg,
        )))
  }

  // join content parts with a separator without array.join type issues
  let join(parts, sep: [ · ]) = {
    let out = none
    for p in parts {
      out = if out == none { p } else { out + sep + p }
    }
    out
  }

  let author = if "author" in info and info.author != none {
    if type(info.author) == array { join(info.author, sep: [, ]) } else { info.author }
  } else { none }

  let meta = {
    let parts = ()
    if "institution" in info and info.institution != none { parts.push(info.institution) }
    if "date" in info and info.date != none {
      parts.push(
        if type(info.date) == datetime { info.date.display("[day].[month].[year]") } else { info.date },
      )
    }
    if parts.len() > 0 { join(parts) }
  }

  let body = {
    set text(fill: fg)
    // flow from the top, starting below the corner logo (no vertical
    // centering, so the block can never overflow onto a second page)
    v(1.4em)
    line(length: 3.2em, stroke: 4pt + accent)
    v(1.0em)
    text(
      size: 2.2em,
      weight: "bold",
      tracking: -0.025em,
      if "title" in info { info.title },
    )
    if "subtitle" in info and info.subtitle != none {
      v(0.5em)
      text(size: 1.0em, fill: fg2, info.subtitle)
    }
    v(1.6em)
    if author != none { text(size: 0.7em, weight: "bold", author) }
    if meta != none {
      v(0.35em)
      text(size: 0.6em, fill: fg2, meta)
    }
  }
  // narrow the text column when a right-hand art panel is present
  if art-final != none or hex-place != none {
    body = block(width: 62%, body)
  }

  // optional right-hand panel (image path or ready-made content), vertically
  // centred, ink-aligned to the right margin like the corner logo on the left
  // (`asc-scale:` widens it when the art is one of the ASC hexagons)
  let asc-scale = self.store.at("asc-scale", default: 1.0)
  let art-place = if art-final != none {
    let inner = if type(art-final) == str { image(art-final, width: 100%) } else { art-final }
    place(horizon + right, dx: -logo-margins.x,
      block(width: if is-asc-logo(art-final) { art-width * asc-scale } else { art-width },
        inner))
  } else { none }

  // co-brand: a second logo (e.g. the ASC hexagons). `org-logo-where:` picks
  // the slot — "right" is the top-right corner at the same height and top line
  // as the Aalto lock-up; "after" puts it in the top-left row behind a thin
  // rule (see `cobrand-after`); "auto" — the default — chooses "after" exactly
  // when the corner is taken by the honeycomb panel or slide art, because the
  // co-brand would otherwise sit on top of it.
  let org = self.store.at("org-logo", default: none)
  let org-h0 = self.store.at("org-logo-height", default: logo-sizes.title)
  let org-h = asc-h(org, org-h0, scale: asc-scale)
  let org-shift = asc-shift(org, org-h0, scale: asc-scale)
  let org-where = {
    let w = self.store.at("org-logo-where", default: "auto")
    if w == "auto" {
      if hex-place != none or art-place != none { "after" } else { "right" }
    } else { w }
  }
  let org-src = if dark { logo-colour(org, "white") } else { org }
  let org-place = if org != none {
    if org-where == "after" {
      cobrand-after(deck-logo(info, self.store), org-src, logo-height: logo-sizes.title,
        org-height: org-h, rule: self.store.at("corner-rule", default: true), ink: fg,
        org-shift: org-shift)
    } else {
      place(top + right, dx: -logo-margins.x, dy: logo-margins.top - org-shift,
        logo-image(org-src, height: org-h, anchor: top))
    }
  } else { none }

  touying-slide(
    self: utils.merge-dicts(
      self,
      config-common(freeze-slide-counter: true),
      config-page(
        fill: if dark { aalto-dark } else { aalto-white },
        margin: (top: 3.2em, bottom: 3.2em, x: 2.6em),
        background: {
          hex-place   // under the logos, over the page fill
          corner-logo(deck-logo(info, self.store), where: top)
          org-place
          art-place
        },
      ),
      config,
    ),
    body,
  )
})

/// Section slide (auto-generated for every `= Section` heading):
/// brand-colour background with black text (on-brand, accessible pairing).
/// Note: the section title is NOT passed as `body` — it must be rendered
/// from the heading context via utils.display-current-heading.
///
/// The theme's `section-art:` option adds a right-hand panel (an image path
/// or content, or a function `heading => content`) to every section slide,
/// narrowing the heading column so they never collide.
#let new-section-slide(config: (:), body) = touying-slide-wrapper(self => {
  let art-src = self.store.at("section-art", default: none)
  let art = if art-src != none and type(art-src) == function {
    art-src(utils.display-current-heading(level: 1))
  } else { art-src }
  // Decorative honeycomb (theme knob `hex:`) fills the art slot when the deck
  // chose no explicit section art. The letters come from the section heading
  // (resolved at layout time via `context`, like the footer page number) and
  // the seed varies per heading, so every section gets its own comb.
  let hex = self.store.at("hex", default: none)
  let hex-mode = if hex != none { hex.at("sections", default: auto) } else { false }
  let hex-panel = none
  if art == none and hex != none and hex-mode != false {
    let ink = ink-on(self.colors.primary)
    let surface = self.colors.primary.lighten(20%)
    let seed0 = hex.at("seed", default: 7)
    hex-panel = context {
      let head = utils.current-heading(level: 1)
      let ordinal = () => query(heading.where(level: 1))
        .filter(h => h.location().page() <= here().page()).len()
      // The auto cascade: wrap the heading into rows that stay readable;
      // if even the radius floor cannot hold it, fall back to content-word
      // initials; if those run past six letters, no letters at all.
      let auto-res = () => {
        let s = hex-plain-text(head)
        if s == none or s == "" { return none }
        let wrapped = hex-wrap-text(s,
          width: hex.at("panel-width", default: 40%) * hex-canvas.w,
          radius: hex.at("panel-radius", default: 32pt),
          min-radius: hex.at("min-radius", default: 13pt),
          max-rows: hex.at("max-rows", default: 4))
        if wrapped != none {
          let t = wrapped.lines.join("\n")
          return (txt: t, radius: wrapped.radius, key: t)
        }
        let ini = hex-initials(s)
        if ini.len() >= 1 and ini.len() <= 6 {
          return (txt: ini, radius: hex.at("panel-radius", default: 32pt), key: ini)
        }
        none
      }
      let full = hex.at("panel-radius", default: 32pt)
      let res = none
      if hex-mode == "numbers" {
        let t = { let n = ordinal(); if n < 10 { "0" + str(n) } else { str(n) } }
        res = (txt: t, radius: full, key: t)
      } else if type(hex-mode) == str {
        res = (txt: hex-mode, radius: full, key: hex-mode)
      } else if type(hex-mode) == array {
        // manual, one shortened title per section, in order; sections past
        // the end of the array fall back to the auto cascade
        let t = hex-mode.at(ordinal() - 1, default: none)
        res = if t != none { (txt: t, radius: full, key: t) } else { auto-res() }
      } else if type(hex-mode) == function {
        let t = hex-mode(hex-plain-text(head))
        if t != none { res = (txt: t, radius: full, key: t) }
      } else if hex-mode == auto {
        res = auto-res()
      }
      let txt = none
      let seed = seed0
      let R = full
      if res != none {
        txt = res.txt
        R = res.radius
        seed = hex-seed-for(res.key, base: seed0)
      }
      // The comb itself always draws; only the letters may be absent.
      {
        honeycomb(
          width: hex.at("panel-width", default: 40%) * hex-canvas.w,
          height: hex-canvas.h,
          radius: R,
          text: if txt == none { "" } else { txt },
          density: hex.at("density", default: 0.6),
          accent-odds: hex.at("accent-odds", default: 0.08),
          seed: seed,
          fade: hex.at("fade", default: "left"),
          stroke-width: hex.at("stroke-width", default: 1.5pt),
          ink: ink,
          ink-alpha: 22%,
          accent-colour: ink,
          letter-fill: surface,
          letter-ink: ink,
        )
      }
    }
  }
  let has-panel = art != none or hex-panel != none
  let content = {
    // `*strong*` in a section heading must not keep Touying's alert colour
    // (the raw accent) — on an accent background it would be invisible
    show strong: it => text(
      weight: "bold",
      fill: strong-on(self.colors.primary, ink-on(self.colors.primary),
        self.colors.primary),
      it.body,
    )
    text(
      size: type-ratios.section * 1em,
      weight: "bold",
      tracking: -0.025em,
      fill: ink-on(self.colors.primary),
      utils.display-current-heading(level: 1),
    )
    if body != none { v(1em); body }
  }
  if has-panel {
    content = block(width: 62%, content)
  }
  let art-place = if art != none {
    let inner = if type(art) == str { image(art, width: 100%) } else { art }
    // `asc-scale:` grows the panel when the art is one of the ASC hexagons
    place(horizon + right, dx: -logo-margins.x,
      block(width: if is-asc-logo(art) {
        30% * self.store.at("asc-scale", default: 1.0)
      } else { 30% }, inner))
  } else if hex-panel != none {
    // full-height comb, bleeding off the top, bottom and right page edges
    place(top + right,
      block(width: hex.at("panel-width", default: 40%), height: 100%, hex-panel))
  } else { none }
  touying-slide(
    self: utils.merge-dicts(
      self,
      config-common(freeze-slide-counter: true),
      config-page(fill: self.colors.primary, margin: (top: 3.2em, bottom: 3.2em, x: 2.6em),
        background: {
          // The corner logos follow the *background*, not the logo file:
          // a dark accent (e.g. `accent: aalto-dark`) needs the white mark,
          // otherwise the corner vanishes into the slide.
          let ink = ink-on(self.colors.primary)
          let logo = corner-logo-of(self)
          if ink == aalto-white { logo = logo-colour(logo, "white") }
          bottom-corner(logo, self.store.at("corner", default: "mark"),
            ink: ink, rule: self.store.at("corner-rule", default: true),
            asc-scale: self.store.at("asc-scale", default: 1.0))
          art-place
        }),
      config,
    ),
    setting: it => align(left + horizon, it),
    content,
  )
})

/// Focus slide for a single big statement. Background defaults to the accent
/// colour (black text); pass e.g. background: aalto-black, foreground: white
/// for the dark variant.
#let focus-slide(
  config: (:),
  background: auto,
  foreground: auto,
  body,
) = touying-slide-wrapper(self => {
  let bg = if background == auto { self.colors.primary } else { background }
  let fg = if foreground == auto { ink-on(bg) } else { foreground }
  touying-slide(
    self: utils.merge-dicts(
      self,
      config-common(freeze-slide-counter: true),
      config-page(margin: 3em, fill: bg),
      config,
    ),
    setting: it => align(center + horizon, {
      show strong: it2 => text(
        weight: "bold", fill: strong-on(bg, fg, self.colors.primary), it2.body)
      text(
        fill: fg,
        size: type-ratios.section * 0.9em,
        weight: "bold",
        tracking: -0.025em,
        it,
      )
    }),
    body,
  )
})

/// "Kiitos / Thank you" closing slide, laid out like Aalto's own template
/// (blank.pptx "Thank you"): the *bare logomark* vertically centred on the
/// left, with the word and contact lines in the right column at 53 % of the
/// width. The co-brand logo (`org-logo:`) sits top-right when set.
///
/// ```typst
/// #thanks-slide[
///   Kiitos! Slides: https://example.org/deck
/// ]
/// #thanks-slide(word: [Thank you], contact: ("pedro.santos@aalto.fi", "aalto.fi"))
/// #thanks-slide(background: school-colours.sci)      // mark stays black
/// #thanks-slide(background: aalto-dark)              // mark flips to white
/// #thanks-slide(info: [Slides and code: https://example.org/deck])
/// ```
///
/// - word (content): the headline. Default [Kiitos].
/// - contact (array): short lines under the headline (email, link, handle…).
/// - info (content): an optional extra block below the contact lines — a
///   longer note, links, a QR code… — set off with a thin rule.
/// - background / foreground: defaults to white + black ink; a brand colour
///   keeps black ink (brand rule), a dark colour flips the mark to white.
/// - mark-height: size of the logomark. 8 em ≈ 34 % of the slide height —
///   present but not dominant (the official layout's 53 % reads oversized
///   with the wider A" mark).
///
/// The left-hand art follows the slide's `corner:` parameter: `auto` (default)
/// uses the theme's `corner:` mode but collapses `"both"` to the single Aalto
/// mark — the closing slide reads overloaded with the pair; `"mark"`, `"asc"`,
/// `"both"` force a composition, `none` drops the left art entirely. The
/// pair's grey rule follows the theme's `corner-rule:`.
#let thanks-slide(
  word: [Kiitos],
  contact: (),
  info: none,
  background: auto,
  foreground: auto,
  mark-height: 8em,
  corner: auto,
  config: (:),
  body: none,
) = touying-slide-wrapper(self => {
  let bg = if background == auto { aalto-white } else { background }
  let fg = if foreground == auto { ink-on(bg) } else { foreground }
  let logo = deck-logo(self.info, self.store)
  let hex = self.store.at("hex", default: none)
  let theme-mode = self.store.at("corner", default: "mark")
  let mode = if corner != auto { corner }
    else if theme-mode == "both" { "mark" }   // keep the closing slide calm
    else { theme-mode }
  let rule = self.store.at("corner-rule", default: true)
  let mark-colour = if fg == aalto-white { "white" } else { "black" }
  // the plain mark, in whichever colour reads on this background: white ink
  // means a dark background, so the logo must be white too
  let mark = if type(logo) == str and mode != "asc" {
    logo-with(logo, lockup: "mark", colour: mark-colour)
  } else { none }

  let column = block(width: 42%, {
    // as on section slides: strong must stay readable on a coloured/dark bg
    show strong: it => text(
      weight: "bold", fill: strong-on(bg, fg, self.colors.primary), it.body)
    // secondary lines: grey on white, but full-strength ink on a coloured
    // background (aalto-gray on a brand colour would fail contrast)
    let muted = if fg == aalto-white { luma(190) }
      else if bg == aalto-white { aalto-gray }
      else { fg }
    text(size: 1.4em, weight: "bold", tracking: -0.025em, fill: fg, word)
    for line in contact {
      v(0.45em)
      text(size: 0.8em, fill: muted, line)
    }
    if info != none {
      v(1.1em)
      line(length: 2.6em, stroke: 2pt + (if fg == aalto-white { luma(190) } else { fg.lighten(30%) }))
      v(0.7em)
      text(size: 0.7em, fill: muted, info)
    }
    if body != none { v(0.9em); text(size: 0.75em, fill: fg, body) }
  })

  // co-brand logo top-right, same slot as on the title slide (`asc-scale:`
  // applies when the co-brand is one of the ASC hexagons)
  let asc-scale = self.store.at("asc-scale", default: 1.0)
  let org = self.store.at("org-logo", default: none)
  let org-place = if org != none {
    let org-h0 = self.store.at("org-logo-height", default: logo-sizes.title)
    let org-h = asc-h(org, org-h0, scale: asc-scale)
    place(top + right, dx: -logo-margins.x,
      dy: logo-margins.top - asc-shift(org, org-h0, scale: asc-scale),
      logo-image(if fg == aalto-white { logo-colour(org, "white") } else { org },
        height: org-h, anchor: top))
  } else { none }

  // Everything lives in the page background: this slide has no flow content,
  // and only there are the percentages page-relative, as in blank.pptx.
  let art = {
    // Opt-in honeycomb watermark behind the closing slide. The old radial
    // fade put hexagons under the logomark and the contact/link column, so
    // the mask is now a *rectangle*: the comb lives only in the empty gap
    // between the mark (left ≈25 %) and the text column (from 53 %), and
    // dissolves before it reaches either — or the org logo top-right.
    if hex != none and hex.at("thanks", default: false) {
      place(top + left,
        honeycomb(width: hex-canvas.w, height: hex-canvas.h,
          radius: hex.at("radius", default: 26pt) + 4pt,
          density: 0.55,
          accent-odds: hex.at("accent-odds", default: 0.08),
          seed: hex.at("seed", default: 7) + 3,
          fade: "window",
          fade-window: (x0: 0.27, x1: 0.51, y0: 0.0, y1: 1.0),
          fade-margin: 0.1,
          ink: fg,
          ink-alpha: 10%,
          accent-colour: fg,
          accent-fill-alpha: 35%))
    }
    if mode == "asc" or (mode == "both" and mark == none) {
      // the big ASC hexagons instead of (or without) the Aalto mark
      place(horizon + left, dx: logo-margins.x,
        logo-image(scicomp-logo(colour: mark-colour),
          height: mark-height * asc-scale, anchor: "middle"))
    } else if mode == "both" {
      // the pair, capped so it clears the column; rule follows corner-rule:
      let h = calc.min(mark-height, 7em)
      let gap = 0.7em
      let rule-w = 1.2pt
      let rule-colour = if fg == aalto-white { luma(160) } else { aalto-gray-light }
      place(horizon + left, dx: logo-margins.x,
        logo-image(mark, height: h, anchor: "middle"))
      let x-after = logo-margins.x + logo-ink-width(mark, height: h) + gap
      if rule {
        place(horizon + left, dx: x-after,
          rect(width: rule-w, height: h * 1.12, fill: rule-colour))
      }
      let asc-x = x-after + (if rule { rule-w + gap } else { 0pt })
      place(horizon + left, dx: asc-x,
        logo-image(scicomp-logo(colour: mark-colour), height: h * asc-scale,
          anchor: "middle"))
    } else if mode != none and mode != "none" and mark != none {
      // vertically centred (`horizon`), left edge pinned to the text margin —
      // note that a bare `place(left, …)` would default to the *top*
      place(horizon + left, dx: logo-margins.x,
        logo-image(mark, height: mark-height, anchor: "middle"))
    }
    place(top + left, dx: 53%, dy: 33%, column)
    org-place
  }

  touying-slide(
    self: utils.merge-dicts(
      self,
      config-common(freeze-slide-counter: true),
      config-page(margin: (top: 3.2em, bottom: 3.2em, x: 2.6em), fill: bg,
        background: art),
      config,
    ),
  )
})

/// Speaker-note panel styling (content is provided by #speaker-note[...]).
#let notes(self: none, ..args) = touying-notes(
  self: self,
  header: self => pad(x: 32pt, y: 16pt, text(
    fill: aalto-white,
    weight: "bold",
    utils.display-current-heading(depth: self.slide-level),
  )),
  header-fill: aalto-dark,
  fill: luma(245),
  ..args,
)

// ── Theme entry point ────────────────────────────────────────────────────────

/// The Aalto theme. Usage:
///
/// ```typst
/// #import "@preview/touying:0.8.0": *
/// #import "theme/aalto.typ": *
///
/// #show: aalto-theme.with(
///   accent: aalto-blue,          // or school-colours.sci, aalto-red, ...
///   config-info(
///     title: [My talk],
///     author: [Pedro Santos Silva],
///     date: datetime.today(),
///     institution: [Aalto University],
///     // logo: image("assets/logo/aalto-black.png", height: 1.5em),
///   ),
/// )
/// #title-slide()
/// = Section
/// == Slide title
/// Content...
/// ```
///
/// - accent (color): the brand/school colour used for underlines, section
///   slides and focus slides. Default: Aalto Blue.
/// - aspect-ratio (string): default "16-9".
/// - font (string): default "Inter" (the official Aalto typeface).
/// - density (string): "roomy" | "default" | "compact" | "dense" — picks the
///   base body size (24 / 20 / 17 / 15 pt). Everything else is relative to it,
///   so one knob rescales the whole deck.
/// - scale (float): multiply the preset base size, e.g. `scale: 0.9`.
/// - body-size (length): set the base size directly (overrides density/scale).
/// - title-size (length): deprecated alias for body-size.
/// - footer (content/function): bottom-left text of content slides, shown just
///   past the corner logo. Default: the deck's `short-title` if you set one in
///   `config-info`, otherwise nothing (like Aalto's own template).
/// - mark (string): force the logomark for the whole deck — "question" (A?),
///   "quote" (A") or "exclaim" (A!). Default: auto, i.e. whatever mark the
///   `logo:` path names. Only the mark part of the path is swapped, so the
///   lock-up and colour you configured are kept.
/// - corner (string): what the bottom-left corner of content and section slides
///   shows. Default "mark" — the bare logomark, as in Aalto's own template.
///   Any lockup name works ("primary", "secondary", "tertiary"); "keep" uses
///   the `logo:` path unchanged. `"asc"` shows only the ASC hexagons; `"both"`
///   shows the Aalto logo and the ASC hexagons (with the `corner-rule:` divider
///   between them when that is on). `#thanks-slide(corner: …)` overrides the
///   mode per closing slide (`none` drops its left art).
/// - corner-rule (bool): draw the thin grey vertical divider between the two
///   logos in `corner: "both"` compositions (content, section and closing
///   slides). Default: true.
/// - title-rule (string): the line between a slide's title and its content.
///   `"dash"` (default) is the short accent dash; `"none"` removes it;
///   `"progress"` turns it into a full-width rule that fills with the accent
///   colour as the deck advances — a quiet progress indicator.
/// - org-logo (path/content): a second logo co-branded top-right on the title
///   and closing slides, at the same height and top line as the Aalto lock-up
///   (e.g. `scicomp-logo()` for the ASC hexagons). On dark slides the theme
///   swaps a `-black`/`-white` file name automatically. Default: none.
/// - org-logo-height (length): size of the co-brand logo. Default: the title
///   logo height (2 em).
/// - asc-scale (number): one multiplier for the ASC hexagons *wherever* the
///   theme draws them — `org-logo:` (title and closing slides), the bottom-left
///   `corner: "asc"|"both"` compositions, the closing slide's left art, and a
///   `section-art:` / `#title-slide(art:)` panel that is one of those paths.
///   Default 1.0. A comb carries far less visual mass than a text lock-up of the
///   same ink height, so `1.067` (+6.7 %) is the value that makes the two read
///   as a pair. It only ever touches paths containing `/scicomp/` (`is-asc-logo`),
///   so a deck co-branding another organisation is untouched; and the footer's
///   corner-clearance reads the same factor, so a bigger corner composition can
///   never run under the footer text. The mark grows about the *centre* of its
///   slot (`asc-shift` = half the added height, pushed back against the anchor),
///   so doubling it keeps it on the Aalto mark's middle line instead of dragging
///   the row's shared top or bottom ink line — check the alignment with
///   `asc-scale: 2` and the comb straddles the lock-up symmetrically.
/// - org-logo-where (string): where the co-brand goes on the *title* slide.
///   `"right"` = the top-right corner (the old, and still the thanks-slide,
///   placement). `"after"` = in the top-LEFT row, after a thin vertical rule,
///   after the Aalto lock-up — the top twin of `corner: "both"`, sharing its
///   `corner-rule:` switch. `"auto"` (default) picks `"after"` exactly when the
///   top-right corner is taken — by `hex:` or by `#title-slide(art:)` — because
///   the co-brand would otherwise sit on top of the art. Needs a *measured path*
///   for the Aalto logo (`logo-ink-width` returns 0 for raw content).
/// - section-art (content/function): an image path or content shown in a
///   right-hand panel on every section slide (a function gets the section
///   heading and may return content). The heading column narrows to make
///   room. Image paths are opened by the theme — write them root-absolute
///   (`"/assets/…"`). Default: none.
/// - hex (bool/str/dict): the decorative honeycomb from the Aalto Scientific
///   Computing Slidev theme (theme/honeycomb.typ, a port of Honeycomb.vue):
///   seeded pointy-top hexagon combs on the title slide's right panel, every
///   section slide, and — opt-in — a watermark behind the closing slide.
///   `true` turns it on with defaults; a string is the title-slide letters
///   ("SCI\nCOMP"); a dict fine-tunes: `text:` title letters; `sections:`
///   chooses the section letters — `auto` (wrap the heading into readable
///   rows, falling back to content-word initials, then to no letters),
///   `"numbers"` (zero-padded section ordinal), one string (the same short
///   title on every section), an array (one short title per section, in
///   order; sections past the end fall back to `auto`), `heading => str`,
///   `none` (comb without letters) or `false` (no comb); `thanks:` bool
///   watermark; plus `seed:`, `density:`, `accent-odds:`, `panel-radius:`
///   (cell size of the title/section panels, default 32pt), `radius:` (cell
///   size of the closing-slide watermark, default 26pt), `min-radius:`
///   (cell-size floor for the auto wrap, default 13pt), `max-rows:`
///   (default 4), `fade:` and `stroke-width:`. The title/section panels bleed
///   off the top, bottom and right page edges; only the left side fades.
///   Colours follow the
///   slide (ink on light, white on dark, ink on the accent of section
///   slides). An explicit `art:` / `section-art:` always wins over the comb.
///   Default: none.
/// - header/header-right/footer-right: override the small decorations.
#let aalto-theme(
  accent: aalto-blue,
  aspect-ratio: "16-9",
  font: aalto-font,
  density: "default",
  scale: 1.0,
  body-size: auto,
  title-size: auto,
  header: self => utils.display-current-heading(
    setting: utils.fit-to-width.with(grow: false, 100%),
    level: 1,
    depth: self.slide-level,
  ),
  header-right: self => [],
  // Touying's `config-info` defaults `short-title` to *`auto`* (not `none`),
  // and `call-or-display` renders `auto` as the literal word "auto" — which
  // showed up in red next to the corner logo on every content slide of any deck
  // that left `short-title:` out. Guard it the way Touying's own themes do.
  footer: self => {
    let s = self.info.at("short-title", default: none)
    if s == auto { none } else { s }
  },
  mark: auto,
  corner: "mark",
  corner-rule: true,
  title-rule: "dash",
  org-logo: none,
  org-logo-height: logo-sizes.title,
  org-logo-where: "auto",
  asc-scale: 1.0,
  section-art: none,
  hex: none,
  // The page number lives in the page BACKGROUND (see `slide`'s footer-line),
  // which Typst lays out *before* the current slide updates the counter — so
  // the state seen here is one increment behind; add it back. (`last-slide-number`
  // is the final state, unaffected.)
  footer-right: context str(utils.slide-counter.get().first() + 1) + " / " + utils.last-slide-number,
  ..args,
  body,
) = {
  let base-size = resolve-body-size(
    body-size: body-size,
    density: density,
    scale: scale,
    title-size: title-size,
  )

  // Normalise the `hex:` knob into the dict the slides read from the store.
  let hex-base = (
    text: none, sections: auto, thanks: false,
    seed: 7, density: 0.5, accent-odds: 0.08,
    radius: 26pt, panel-radius: 32pt, panel-width: 40%,
    min-radius: 13pt, max-rows: 4,
    fade: "left", stroke-width: 1.5pt,
  )
  let hex-store = if hex == none or hex == false { none }
    else if hex == true { hex-base }
    else if type(hex) == str { hex-base + (text: hex) }
    else { hex-base + hex }

  show: touying-slides.with(
    config-page(
      ..utils.page-args-from-aspect-ratio(aspect-ratio),
      margin: content-margins,
      footer-descent: 0em,
    ),
    config-common(
      slide-fn: slide,
      notes-fn: notes,
      new-section-slide-fn: new-section-slide,
      zero-margin-header: false,
      zero-margin-footer: false,
    ),
    config-methods(
      init: (self: none, body) => {
        set text(font: font, size: base-size, fill: aalto-black, lang: "en")
        // brand: left-aligned, ragged right
        set par(justify: false, leading: 0.62em)
        show heading.where(level: 3): it => {
          set text(size: type-ratios.subheading * 1em, weight: "bold", fill: aalto-gray)
          block(above: 0.8em, below: 0.3em, it.body)
        }
        show footnote.entry: set text(size: type-ratios.footnote * 1em)
        // Inline code (`like this`) — the one default every deck gets. Typst does
        // NOT resolve its generic "monospace" alias and a missing font silently
        // falls back to Libertinus Serif, so raw text is pinned to the brand code
        // face here; decks never re-declare the font for a `word`. Block fences
        // are left alone on purpose — kit/deckkit.typ styles those (code-block()).
        show raw.where(block: false): it => box(
          fill: neutral-colours.at("3"),   // neutral.3, the same fill as cards
          radius: 2pt,
          inset: (x: 0.18em, y: 0.05em),
          baseline: 10%,
          text(font: aalto-mono, size: 0.8em, fill: aalto-black, it),
        )
        body
      },
      // #alert[...] → bold, accent colour darkened to stay readable on white
      alert: (self: none, body) => text(weight: "bold", fill: accent-on-white(accent), body),
    ),
    config-colors(
      neutral-light: aalto-gray,
      neutral-lightest: aalto-white,
      neutral-darkest: aalto-black,
      primary: accent,
    ),
    config-store(
      header: header,
      header-right: header-right,
      footer: footer,
      mark: mark,
      corner: corner,
      corner-rule: corner-rule,
      org-logo: org-logo,
      org-logo-height: org-logo-height,
      org-logo-where: org-logo-where,
      asc-scale: asc-scale,
      section-art: section-art,
      hex: hex-store,
      footer-right: footer-right,
      subslide-preamble: block(below: 1.5em, width: 100%, {
        text(
          size: type-ratios.slide-title * 1em,
          weight: "bold",
          tracking: -0.025em,
          fill: aalto-black,
          utils.display-current-heading(level: 2),
        )
        v(0.5em)
        // the line between the slide title and its content:
        //   "dash"     — the short accent dash (default, as in Aalto's template)
        //   "none"     — no line
        //   "progress" — a full-width rule that fills with the accent colour
        //                as the deck advances (a quiet progress indicator)
        if title-rule == "dash" {
          line(length: 2.6em, stroke: 3pt + accent)
        } else if title-rule == "progress" {
          block(width: 100%, height: 3pt, fill: luma(228), {
            utils.touying-progress(ratio =>
              place(top + left,
                rect(width: 100% * ratio, height: 3pt, fill: accent)))
          })
        }
      }),
    ),
    ..args,
  )

  body
}
