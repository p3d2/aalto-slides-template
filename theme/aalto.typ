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

/// Page margins of content slides. The footer and `credit-line` measure from
/// the bottom of the text area, so they must track these numbers — the theme
/// applies them via `set page(margin: content-margins)`.
#let content-margins = (top: 1.9em, bottom: 2.3em, x: 2.6em)

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

/// What the bottom-left corner shows. Aalto's own template puts the **bare
/// logomark** there (no wordmark), so that is the default: the corner is built
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

/// Render a logo original so that `height` is the **visible** (ink) height and
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

/// The deck logo anchored to a **page** corner, ink-aligned — meant to be
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

/// The ink colour a logo path carries ("…-white-…" → white, else black).
#let corner-ink(logo) = {
  if type(logo) == str and logo.contains("-white") { aalto-white } else { aalto-black }
}

/// Total *ink* width of the bottom-left corner composition, so the footer
/// text can clear it. `mode` is the theme's `corner:` value; anything but
/// `"asc"`/`"both"` is the plain single-logo width. `rule:` mirrors the
/// theme's `corner-rule:` (divider drawn or not).
#let corner-ink-width(logo, mode, rule: true, height: logo-sizes.content) = {
  let gap = 0.55em
  let rule-w = 0.8pt
  let asc-w = logo-ink-width(corner-asc(aalto-black), height: height)
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
#let bottom-corner(logo, mode, ink: aalto-black, rule: true) = {
  let h = logo-sizes.content
  let gap = 0.55em
  let rule-w = 0.8pt
  let rule-h = 1.4em
  let rule-colour = if ink == aalto-white { luma(160) } else { aalto-gray-light }
  if mode == "asc" or (mode == "both" and logo == none) {
    place(bottom + left, dx: logo-margins.x, dy: -logo-margins.bottom,
      logo-image(corner-asc(ink), height: h, anchor: bottom))
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
    place(bottom + left, dx: asc-x, dy: -logo-margins.bottom,
      logo-image(corner-asc(ink), height: h, anchor: bottom))
  } else if logo != none {
    place(bottom + left, dx: logo-margins.x, dy: -logo-margins.bottom,
      logo-image(logo, height: h, anchor: bottom))
  }
}

/// A small gray credit / source / footnote line pinned to the bottom of a
/// content slide, **bottom-aligned with the corner logo and the footer**: the
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
      corner-ink-width(logo, mode, rule: rule) + .8em
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
        ink: corner-ink(logo), rule: self.store.at("corner-rule", default: true))
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
  if art != none {
    body = block(width: 62%, body)
  }

  // optional right-hand panel (image path or ready-made content), vertically
  // centred, ink-aligned to the right margin like the corner logo on the left
  let art-place = if art != none {
    let inner = if type(art) == str { image(art, width: 100%) } else { art }
    place(horizon + right, dx: -logo-margins.x,
      block(width: art-width, inner))
  } else { none }

  // co-brand: a second logo (e.g. the ASC hexagons) top-right, same height
  // and top line as the Aalto lock-up on the left
  let org = self.store.at("org-logo", default: none)
  let org-place = if org != none {
    let org-h = self.store.at("org-logo-height", default: logo-sizes.title)
    place(top + right, dx: -logo-margins.x, dy: logo-margins.top,
      logo-image(if dark { logo-colour(org, "white") } else { org },
        height: org-h, anchor: top))
  } else { none }

  touying-slide(
    self: utils.merge-dicts(
      self,
      config-common(freeze-slide-counter: true),
      config-page(
        fill: if dark { aalto-dark } else { aalto-white },
        margin: (top: 3.2em, bottom: 3.2em, x: 2.6em),
        background: {
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
  let art = self.store.at("section-art", default: none)
  if art != none and type(art) == function {
    art = art(utils.display-current-heading(level: 1))
  }
  let content = {
    text(
      size: type-ratios.section * 1em,
      weight: "bold",
      tracking: -0.025em,
      fill: ink-on(self.colors.primary),
      utils.display-current-heading(level: 1),
    )
    if body != none { v(1em); body }
  }
  if art != none {
    content = block(width: 62%, content)
  }
  let art-place = if art != none {
    let inner = if type(art) == str { image(art, width: 100%) } else { art }
    place(horizon + right, dx: -logo-margins.x,
      block(width: 30%, inner))
  } else { none }
  touying-slide(
    self: utils.merge-dicts(
      self,
      config-common(freeze-slide-counter: true),
      config-page(fill: self.colors.primary, margin: (top: 3.2em, bottom: 3.2em, x: 2.6em),
        background: {
          let logo = corner-logo-of(self)
          bottom-corner(logo, self.store.at("corner", default: "mark"),
            ink: corner-ink(logo), rule: self.store.at("corner-rule", default: true))
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
    setting: it => align(center + horizon, text(
      fill: fg,
      size: type-ratios.section * 0.9em,
      weight: "bold",
      tracking: -0.025em,
      it,
    )),
    body,
  )
})

/// "Kiitos / Thank you" closing slide, laid out like Aalto's own template
/// (blank.pptx "Thank you"): the **bare logomark** vertically centred on the
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

  // co-brand logo top-right, same slot as on the title slide
  let org = self.store.at("org-logo", default: none)
  let org-place = if org != none {
    let org-h = self.store.at("org-logo-height", default: logo-sizes.title)
    place(top + right, dx: -logo-margins.x, dy: logo-margins.top,
      logo-image(if fg == aalto-white { logo-colour(org, "white") } else { org },
        height: org-h, anchor: top))
  } else { none }

  // Everything lives in the page background: this slide has no flow content,
  // and only there are the percentages page-relative, as in blank.pptx.
  let art = {
    if mode == "asc" or (mode == "both" and mark == none) {
      // the big ASC hexagons instead of (or without) the Aalto mark
      place(horizon + left, dx: logo-margins.x,
        logo-image(scicomp-logo(colour: mark-colour), height: mark-height, anchor: "middle"))
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
        logo-image(scicomp-logo(colour: mark-colour), height: h, anchor: "middle"))
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
/// - section-art (content/function): an image path or content shown in a
///   right-hand panel on every section slide (a function gets the section
///   heading and may return content). The heading column narrows to make
///   room. Image paths are opened by the theme — write them root-absolute
///   (`"/assets/…"`). Default: none.
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
  // Touying's `config-info` defaults `short-title` to **`auto`** (not `none`),
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
  section-art: none,
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
      section-art: section-art,
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
