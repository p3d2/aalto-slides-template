// Sequential reveals, graying in/out, and emphasis — the only "effects" the
// template provides, exactly as needed. Everything is click-driven via
// Touying's #pause / #meanwhile / #only / #uncover / #alternatives.

#import "../../theme/aalto.typ": *

= Dynamics

== Sequential reveal

Present a point at a time — nothing appears until you advance:

- Plain text sources keep decks git-friendly
#pause
- Typst compiles in milliseconds, so agents can iterate fast
#pause
- And *you* can edit the `.typ` files directly — no GUI wrestling

#speaker-note[Advance three clicks here.]

== Graying in and out

#dim[The whole list can start dimmed…]

#pause

…then items #alert[gray in] when they matter (`gray-in`, `gray-out`, `dim`):

#gray-in[This line starts gray and becomes black on the next click.]

#pause

#gray-out[This line starts black and grays out on the next click —
useful to retire a point after discussing it.]

== Focus by dimming the rest

#let focus-step(n, items) = stack(
  dir: ttb,
  spacing: 0.7em,
  ..items.enumerate().map(pair => {
    let (i, it) = pair
    if i == n { it } else { dim(it) }
  }),
)

#let points = (
  [*Data stays local* — no cloud round-trip per keystroke],
  [*Agent-editable* — surgical text edits, instant rebuilds],
  [*On brand* — Aalto colours, Inter, consistent layout],
)

#alternatives(
  focus-step(0, points),
  focus-step(1, points),
  focus-step(2, points),
)

== Side-by-side evolution

// NOTE 1: never put animation marks (#pause/#meanwhile) inside a heading —
// headings are re-rendered through a context block (the title preamble).
// NOTE 2: keep #pause / #uncover at the top level of the slide body —
// touying cannot see animation marks nested inside grid cells or
// measured containers (layout, figure-placeholder, two-col).

#two-col(ratio: (1fr, 1fr))[
  *Draft v1*

  #dim[Generic bullet list]
][
  *Draft v2*

  #dim[Generic bullet list, refined]
]

#pause

#two-col(ratio: (1fr, 1fr))[
  → key claim: #alert[Typst beats PPT for agent workflows]
][
  → brand colours applied consistently
]

#focus-slide[
  Keep it simple, align left, \
  and stick to as few styles and sizes as needed.
]

== Takeaways

#two-col(ratio: (2fr, 1fr))[
  - `make new NAME=my-talk` → new deck from the template
  - Write `= Section` / `== Slide`; `#include` files per section
  - Effects: `#pause`, `gray-in`, `gray-out`, focus-step + `alternatives`
  - Presenter notes: `#speaker-note[...]` (export with pdfpc/pympress)
][
  #rect(width: 100%, height: 7em, fill: aalto-blue.lighten(75%), stroke: 1pt + aalto-blue,
    align(center + horizon, text(fill: aalto-blue.darken(55%), weight: "bold", [Q&R])))
]

// ── Closing ──────────────────────────────────────────────────────────────────
// The bare logomark (no wordmark) oversized in the same bottom-left corner,
// like Aalto's own "Thank you" layout. `mark:` swaps A"/A?/A! deck-wide.

#thanks-slide(
  word: [Kiitos!],
  contact: ("Pedro Santos Silva · Research Software Engineer",
            "rse@aalto.fi · aalto.fi"),
)

#thanks-slide(
  word: [Thank you],
  background: aalto-blue,
  contact: ("slides + source: this deck is plain text",),
)
