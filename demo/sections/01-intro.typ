#import "../../theme/aalto.typ": *

= Why this template

== Plain text, fast builds

- The whole deck is *plain text* (`.typ` files) — diffable, git-friendly,
  and trivial for an agent (or you) to edit surgically
- Compiles in milliseconds; `make watch-demo` rebuilds as you type
- Multi-source: this deck is assembled with `#include` from
  `demo/sections/*.typ` — one file per talk section
- No heavy Office binaries; the output is a standard PDF you can present
  from anywhere

#speaker-note[Mention that the same source can later be exported to PPTX via
Tylina / touying-exporter if an editable-PPT handoff is ever needed — but PDF
is the primary format.]

== One logo system, four lock-ups

// Give the theme a *path* and `height:` is the visible logo height: the
// originals hide the brand clear space inside the PDF page (see
// `assets/logo/README.md`). Paths start at the project root; sizes are
// explicit here only for the demo.

#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 1.5em,
  row-gutter: 1.2em,
  align: left + horizon,
  stack(dir: ttb, spacing: .5em,
    logo-image("/assets/logo/primary/aalto-black-quote.pdf", height: 1.9em),
    text(size: .6em, fill: aalto-gray)[*primary* — mark + name below. Ask for it
      with `corner: "primary"`; the default corner is the bare mark.]),
  stack(dir: ttb, spacing: .5em,
    logo-image("/assets/logo/secondary/aalto-fi-se-en-black-quote.pdf", height: 1.9em),
    text(size: .6em, fill: aalto-gray)[*secondary* — trilingual, three rows.
      Aalto's choice for external communication.]),
  stack(dir: ttb, spacing: .5em,
    logo-image("/assets/logo/tertiary/aalto-fi-se-en-black-quote.pdf", height: 1.9em),
    text(size: .6em, fill: aalto-gray)[*tertiary* — trilingual, to the right.
      Used top-left on the title slide here.]),
  stack(dir: ttb, spacing: .5em,
    logo-image("/assets/logo/mark/aalto-black-quote.pdf", height: 1.9em),
    text(size: .6em, fill: aalto-gray)[*mark* — no text at all. The bottom-left
      corner of content and section slides, and the closing slide.]),
  rect(width: 100%, fill: aalto-dark, inset: 1.2em,
    logo-image("/assets/logo/mark/aalto-white-question.pdf", height: 1.9em)),
  rect(width: 100%, fill: aalto-blue, inset: 1.2em,
    logo-image("/assets/logo/mark/aalto-black-exclaim.pdf", height: 1.9em)),
)

Black on light, white on dark — and the marks (A", A?, A!) are interchangeable.


== On brand

The theme follows the #alert[Aalto visual identity] (brand.aalto.fi):

- *Inter* — the official Aalto typeface (bundled in `fonts/`, bold headings
  with tight tracking, sentence case, left-aligned ragged-right text)
- White/black base with brand colours used #alert[as sparing accents]
- University colours: #text(fill: aalto-blue, weight: "bold")[Blue],
  #text(fill: aalto-red, weight: "bold")[Red],
  #text(fill: rgb("#B89B00"), weight: "bold")[Yellow] (darkened here for
  contrast on white — the raw yellow is for backgrounds/blocks)
- School colours available as `school-colours.sci`, `.chem`, `.biz`, …
  (one school per deck, never mixed)
