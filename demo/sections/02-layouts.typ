// Layout recipes: columns, figures, tables, code, maths.

#import "../../theme/aalto.typ": *

= Layouts

== Two columns: text + figure

#two-col(ratio: (3fr, 2fr))[
  Flexibility without fighting a GUI:

  - `two-col[..][..]` for text + figure
  - any `grid`/`stack`/`place` from plain Typst works inside a slide
  - `slide(composer: (1fr, 2fr))[A][B]` for column-split slides
][
  #figure(
    image("../figures/example-chart.svg", width: 100%),
    caption: [A figure from an external SVG file.],
  ) <chart>
]

== Figures and grids

#figure-placeholder(label: [draft figure — replace me], ratio: 21/6)

#v(0.8em)

#grid(
  columns: 3,
  column-gutter: 1.2em,
  figure-placeholder(label: [panel a], ratio: 1, fill-colour: aalto-blue),
  figure-placeholder(label: [panel b], ratio: 1, fill-colour: aalto-red),
  figure-placeholder(label: [panel c], ratio: 1, fill-colour: school-colours.sci),
)

== Tables, code and maths stay native

#two-col(ratio: (1fr, 1fr))[
  #table(
    columns: (auto, auto, auto),
    inset: 8pt,
    stroke: 0.5pt + luma(200),
    table.header([Tool], [Build], [Source]),
    [PowerPoint], [slow], [binary],
    [Slidev], [medium], [markdown+Vue],
    [*Typst*], [*ms*], [*plain text*],
  )
][
  ```py
  def compile(deck):
      return deck.build()  # ~50 ms
  ```

  Euler's identity, equation animations supported:
  $ integral_0^inf e^(-x^2) dif x = sqrt(pi) / 2 $
]

== Co-branding, title art and the closing slide

`org-logo:` (set once in `main.typ`) puts a second logo — here the ASC
hexagons — top-right of the title and closing slides. The closing slide also
takes an optional `info:` block, and `#title-slide(art: …)` adds a right-hand
image panel:

#thanks-slide(
  word: [Kiitos!],
  contact: ("Pedro Santos Silva · Research Software Engineer",
            "rse@aalto.fi · aalto.fi"),
  info: [Slides, source and figures live in one plain-text folder —
    ask me for a copy.],
)

#title-slide(art: "/demo/figures/example-chart.svg")
