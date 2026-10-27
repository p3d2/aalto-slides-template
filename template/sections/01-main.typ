// ── Section 1 ────────────────────────────────────────────────────────────────
// Headings drive the deck: `= Section` → section slide, `== Title` → slide.
// Each section file must import the theme (includes do not inherit imports).
#import "../../../theme/aalto.typ": *

= Introduction

== Your first slide

- Write content in plain markup — *bold*, `code`, maths $x^2$
- `#pause` reveals the next bullet on click
#pause
- Like this one

#speaker-note[Optional presenter notes for this slide.]

== A two-column example

#two-col(ratio: (2fr, 1fr))[
  Left column: text, bullets, equations — anything.

  - point one
  - point two
][
  #figure-placeholder(label: [figure here], ratio: 4/3, fill-colour: aalto-blue)
]
