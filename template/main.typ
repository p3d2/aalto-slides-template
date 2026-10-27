// ── New deck (copied by `./slides new <name>`) ──────────────────────────────
// Build:  ./slides deck <name>       Watch:  ./slides watch-deck <name>
// (`make` has the same targets but is not installed here.)
// Fill <name>/OUTLINE.md BEFORE writing any slide body.

#import "@preview/touying:0.8.0": *
#import "../../theme/aalto.typ": *

#show: aalto-theme.with(
  accent: aalto-blue, // university-level. For a school: school-colours.sci, .chem, ...
  // mark: "exclaim", // force the logomark deck-wide: question (A?) | quote (A") | exclaim (A!)
  // Bottom-left corner of content/section slides: "mark" (Aalto only, default),
  // "asc" (hexagons only) or "both" (Aalto + ASC; corner-rule: true adds a
  // grey divider between them). The ASC hexagons (the team that runs Triton —
  // there is no separate Triton logo) live in assets/logo/scicomp/ after:
  // python3 assets/logo/fetch-scicomp.py
  // corner: "both",
  // corner-rule: false,
  // title-rule: "progress", // line under slide titles: "dash" (default) | "none" | "progress"
  // Co-brand: a second logo top-right on the title and closing slides, at the
  // same height/top line as the Aalto lock-up.
  // org-logo: scicomp-logo(),
  // section-art: scicomp-logo(colour: "white"), // optional right-hand image on every section slide
  config-info(
    title: [Your talk title],
    subtitle: none,
    author: [Pedro Santos Silva],
    date: datetime.today(),
    institution: [Aalto University],
    // Give the theme a *path*, not image(): it then sizes the visible lock-up
    // and aligns its ink with the slide margins (the originals carry the brand
    // clear space inside the file). See assets/logo/README.md.
    logo: "/assets/logo/primary/aalto-black-quote.pdf",
  ),
)

// The title slide uses the wide trilingual lock-up top-left; content and
// section slides show the bare text-free logomark bottom-left (like Aalto's own
// template) — `corner: "primary"` brings the wordmark back. For
// #title-slide(dark: true) pass a white logo instead of a black one.
// `#title-slide(art: "/assets/…")` adds a right-hand image panel (root-absolute
// path, like `logo:`) and narrows the title column to make room.
#title-slide(logo: "/assets/logo/tertiary/aalto-fi-se-en-black-quote.pdf")

// One file per talk section keeps the deck modular and agent-editable:
#include "sections/01-main.typ"

// Closing slide: bare logomark on the left, contact lines on the right.
// `info:` adds an optional extra block (links, a longer note, a QR code…);
// the co-brand logo appears top-right when `org-logo:` is set.
#thanks-slide(
  word: [Kiitos!],
  contact: ("Your Name · Aalto University", "you@aalto.fi · aalto.fi"),
  // info: [Slides and code: https://example.org/deck],
)
