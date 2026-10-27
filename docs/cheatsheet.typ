// ── Aalto slides — one-page cheat sheet ─────────────────────────────────────
// Printable reference card, built with the template it documents.
//   ./slides cheatsheet          →  docs/cheatsheet.pdf   (A4 portrait, 1 page)
//   typst compile --root . --font-path fonts docs/cheatsheet.typ
// Deliberately *not* a slide deck: same brand tokens, document layout.
// Layout note: two `grid` cells rather than `set page(columns:)` — page columns
// give no gutter control and break the small tables' column widths.

#import "../theme/aalto.typ": aalto-blue, aalto-blue-dark, aalto-gray, aalto-black

#set page(
  paper: "a4",
  margin: (top: 10pt, bottom: 10pt, x: 11pt),
)
#set text(font: "Inter", size: 7.5pt, fill: aalto-black, lang: "en")
#set par(justify: false, leading: 4.0pt, spacing: 4.4pt)
#show raw: set text(size: 6.9pt)

// ── document vocabulary for this one page ───────────────────────────────────
#let h(title) = block(above: 6.5pt, below: 3pt, {
  line(length: 100%, stroke: 1.3pt + aalto-blue)
  v(2pt)
  text(size: 9pt, weight: "bold", fill: aalto-blue-dark, title)
})
#let sub(body) = block(above: 4pt, below: 1.2pt, text(weight: "bold", body))
#let k(body) = text(fill: aalto-blue-dark, weight: "bold", body)
#let dim(body) = text(fill: aalto-gray, size: 7.4pt, body)
#let rows(..r) = table(columns: (54pt, 1fr), inset: (left: 0pt, right: 5pt, top: 1.2pt, bottom: 1.2pt),
  stroke: none, align: left, ..r)
#let knobs(..r) = table(columns: (56pt, 1fr), inset: (left: 0pt, right: 5pt, top: 1.2pt, bottom: 1.2pt),
  stroke: none, align: left, ..r)
#let cb = box(width: 6pt, height: 6pt, stroke: 0.8pt + aalto-gray)

// ── masthead ────────────────────────────────────────────────────────────────
#block(below: 6pt, {
  text(size: 17pt, weight: "bold", tracking: -0.45pt)[Aalto slides — cheat sheet]
  line(length: 100%, stroke: 2pt + aalto-blue)
  v(2pt)
  dim[Typst + Touying · Aalto visual identity · plain text → PDF in ~0.5 s ·
    typst ≥ 0.15 · full guides: `docs/using-the-template.md` (the tool) and
    `docs/making-a-talk.md` (how to build a talk)]
})

#grid(
  columns: (1fr, 1fr),
  column-gutter: 14pt,
  align: top + left,
  [
    #h[Build & run]
    #rows(
      [`demo`], [build the demo deck → `demo/demo.pdf`],
      [`watch-demo`], [rebuild the demo on every save],
      [`new`], [`new my-talk` → scaffold `decks/my-talk/` from the template],
      [`deck`], [`deck my-talk` → build `decks/my-talk/main.pdf`],
      [`watch-deck`], [`watch-deck my-talk` → edit with a live rebuild],
      [`cheatsheet`], [this page → `docs/cheatsheet.pdf`],
      [`clean`], [remove built PDFs (sources stay)],
    )
    #dim[Run them as `./slides demo` (or `make demo`, `make new NAME=…`). VS Code +
      Tinymist gives a preview instead — point its root at the template folder.]

    #h[One deck = a few files]
    ```
    decks/my-talk/
      main.typ              identity: title, author,
                            accent, colour, logo
      sections/01-intro.typ your slides (one file
                            per talk section)
      figures/              what you reference
    ```
    Every section file starts with the import — `#include` does not inherit
    imports:
    ```typ
    #import "../../../theme/aalto.typ": *
    ```

    #h[The language, in six lines]
    ```typ
    = Section        // colour section slide
    == Slide title   // a content slide
    === Subheading   // bold grey, in a slide
    // comment
    #cmd(...)        // `#` starts a command
    [content]        // brackets = content
    ```
    `- bullet` · `+ numbered` · a blank line starts a new paragraph.

    #h[Slide recipes]
    #sub[Bullets and emphasis]
    ```typ
    == The coating cracks above 700 °C

    - one idea per bullet, ≤ 6 bullets
    - *bold*, `code`, $x^2 + y^2 = z^2$
    - #alert[accent, readable on white]
    ```

    #sub[Text beside a figure]
    ```typ
    #two-col(ratio: (3fr, 2fr))[
      - the plateau above 700 °C
      - the error bars
    ][
      #figure(image("figures/tga.svg",
        width: 100%),
        caption: [TGA trace, batch 3.])
    ]
    ```

    #sub[Figure not ready yet]
    ```typ
    #figure-placeholder(
      label: [AFM height image],
      ratio: 16/10)
    ```

    #sub[One big claim]
    ```typ
    #focus-slide[40 % less
      delamination.]
    ```

    #sub[Reveal as you speak]
    ```typ
    - first point
    #pause
    - second, after you click
    #gray-in[dim → full]
    #gray-out[full → dim]
    ```

    #h[Troubleshooting]
    #dim[
      `path would escape the project root` → use `/assets/…` root paths, or build
      from the template folder \
      `unknown variable: x` → missing `#import` line in that section file \
      `file not found (…/assets/logo/…)` → typo, or run `fetch-logos.py` \
      logo tiny or floating → not in `theme/logo-metrics.typ`: run
      `measure-logos.py` \
      content vanished → a `#pause` inside a heading, or nested in a grid cell \
      first build fails offline → Touying downloads once; preview differs in VS
      Code → set Tinymist's root to the template folder
    ]


    #block(above: 8pt, text(fill: aalto-gray, size: 6.8pt)[
  Brand rules the theme enforces: Inter everywhere · bold tight-tracked headings ·
  sentence case · left-aligned ragged-right · ≤ 3 type sizes per surface · brand
  colours take #k[black] text (≥ 7:1) · one school colour per deck · logo
  originals only.\
  Offline brand mirror: `reference/brand-aalto-fi/` · #link("https://brand.aalto.fi")[brand.aalto.fi] ·
  #link("https://typst.app/docs")[typst.app/docs] · #link("https://touying.app")[touying.app] ·
  #link("https://aaltologo.fi")[aaltologo.fi]
    ])
  ],

  [
    #sub[Tables, code, maths — all native]
    Tables with `#table(columns: 3, [a], [b], [c])`, fenced code blocks, and
    maths in `$ integral_0^inf e^(-x^2) dif x = sqrt(pi)/2 $`.

    #sub[Free layout]
    ```typ
    #place(top + right,
      image("x.png", height: 2em))
    #grid(columns: 2, column-gutter: 1em, a, b)
    ```

    #sub[Notes, opening, closing]
    ```typ
    #speaker-note[Ask about the ramp rate.]

    #title-slide(dark: true, logo:
      "/assets/logo/tertiary/aalto-fi-se-en-\
       white-quote.pdf")

    #thanks-slide(word: [Kiitos!],
      contact: ("Name · group",
                "you@aalto.fi"))
    ```

    #h[Theme knobs]
    All in `#show: aalto-theme.with(…)` in `main.typ`. Everything is sized
    relative to one base, so `density` rescales the whole deck — avoid hand-set
    font sizes.
    #knobs(
      [`accent`], [`aalto-blue` · `aalto-red` · `aalto-yellow` ·
        `school-colours.sci` `/ .chem` `/ .eng` `/ .elec` `/ .biz` `/ .arts`
        — one school per deck, never mixed],
      [`density`], [`roomy` `default` `compact` `dense` = 24/20/17/15 pt base.
        Hall or bad projector → `roomy`; methods detail → `compact`; `dense` is
        for handouts, not screens],
      [`scale`], [`0.9` — one notch below a preset],
      [`mark`], [`"question"` `"quote"` `"exclaim"` — forces the logomark
        (A? A" A!) on every slide, title to closing],
      [`corner`], [`"mark"` (default: bare logomark bottom-left) · `"primary"`
        brings the wordmark back · `"keep"`],
      [`logo`], [a #k[path string], not `image()`:
        `"/assets/logo/primary/aalto-black-quote.pdf"`],
      [`short-title`], [shows bottom-left next to the logo; omit for a clean
        footer],
      [`aspect-ratio`], [`"16-9"` (default), `"4-3"`],
      [`header`/`footer`], [functions for the small decorations],
    )

    #h[Logos]
    ```bash
    python3 assets/logo/fetch-logos.py
      # 30 official originals (university)
    python3 assets/logo/make-plain.py
      # + the text-free logomark
    python3 assets/logo/measure-logos.py
      # regenerate theme/logo-metrics.typ
    python3 assets/logo/fetch-logos.py \
      --unit sci --unit chem
    ```
    Names: `<lockup>/aalto-<lang-><colour>-<mark>.pdf` — lockups #k[primary]
    (mark + name below), #k[secondary] (trilingual, 3 rows), #k[tertiary]
    (trilingual, right — title slides), #k[mark] (no text: corners, closing).
    Black on light, white on dark; official originals only, never redrawn. Pass
    a #k[path] and the theme sizes the visible logo and aligns its ink to the
    margin, because the files carry Aalto's clear space inside them.

    #h[Presenting]
    - `pdfpc decks/my-talk/main.pdf` — notes, next slide, timer, dual screen
    - present from the #k[exported PDF], not a live build; name it
      `talk-2026-11-05.pdf`, put it on a stick #k[and] in your outbox
    - check the room: beam projectors wash out light colours; never yellow on white
    - 3–5 back-pocket answer slides *after* the thank-you

    #h[Before you present]
    #table(columns: (9pt, 1fr), inset: (left: 0pt, right: 4pt, top: 1.4pt, bottom: 1.4pt), stroke: none,
      align: left,
      [#cb], [titles alone read as an argument],
      [#cb], [squint / 25 %-zoom test passed],
      [#cb], [figures labelled, sources cited],
      [#cb], [`#pause` matches what you say],
      [#cb], [preliminary data marked as such],
      [#cb], [rehearsed aloud, with a timer],
      [#cb], [PDF exported, named, on a stick],
    )
  ],
)

