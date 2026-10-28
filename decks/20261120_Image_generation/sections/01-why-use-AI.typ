// ── 0 · Opening — three slides ──────────────────────────────────────────────
// 1. their situation (empathy)   2. the plane (the frame for the whole talk)
// 3. the tools (dated, from catalogue.typ)
//
// Slide 2 is drawn with `place` inside a fixed-height box using PERCENT offsets:
// verified on Typst 0.15.1 — percentages resolve against the box, so the diagram
// survives a density change. `layout()` is deliberately not used: inside a
// Touying slide it pushes everything after it onto its own page.
//
// Slide 3 reads the tool list from catalogue.typ — edit that file next year, not
// this one. Anything marked ⚠ in catalogue.typ is copied from vendor docs or
// press and has not been tested here: check it before the talk.
#import "../../../theme/aalto.typ": *
#import "../figs.typ": *
#import "../catalogue.typ": tools, tool, live-tools, asof-date, VERIFIED, check

= Why use AI to generate images?

// ── 1 · where they are ──────────────────────────────────────────────────────
== When do you need to use images in your research work?

#v(0.2em)

I need an image for...
#{
  let need(item) = block(
    width: 100%,
    inset: (left: 0.9em, y: 0.5em),
    stroke: (left: 2.4pt + aalto-blue),
    fill: rgb("#F5F8FC"),
    text(size: 0.86em, item),
  )
  grid(
    columns: 2,
    column-gutter: 2.2em,
    row-gutter: 0.9em,
    ..(
      [the lab website],
      [a course or a talk],
      [visualize an idea],
      [drawing my own setup],
      [my showcase my data],
      [a research paper],
    ).map(need),
  )
}

#v(1.1em)
#align(center)[
  #text(size: 0.8em, fill: aalto-gray)[Show of hands — who recognised one of these?]
]

// ── 2 · the plane ───────────────────────────────────────────────────────────
== Where each one sits

#{
  // Fixed dimensions for a squarish, high-precision plot that leaves room for the side legend
  let W = 13.5cm
  let H = 8.8cm

  // Semantic colors for the 3 action zones & ownership threshold
  let col-use = raw-school-colours.chem2     // Green: Safe to use AI directly
  let col-finish = raw-school-colours.arts2   // Amber: AI draft + human polish
  let col-diy = aalto-red      // Crimson: High ownership / do it yourself

  // External legend card for the right-hand column
  let legend-card(num, title, sub, desc, col, bg, border) = box(
    width: 100%,
    fill: bg,
    stroke: (left: 3.5pt + col, rest: 0.7pt + border),
    radius: (right: 6pt, left: 2pt),
    inset: (x: 9pt, y: 8pt),
    [
      #text(size: 0.6em, weight: "bold", fill: col, tracking: 0.05em, [#num. #title])
      #v(-0.35em)
      #text(size: 0.5em, weight: "bold", fill: aalto-black, sub)
      #v(-0.25em)
      #text(size: 0.45em, fill: aalto-gray, desc)
    ]
  )

  grid(
    columns: (W, 1fr),
    column-gutter: 0.6cm,
    align: (left + horizon, left + horizon),

    // LEFT COLUMN: Squarish XY Plot
    image("../figures/xy_AIfigure.pdf", width: 135mm, height: 88mm),

    // RIGHT COLUMN: Outside Legend for 1, 2, 3
    stack(
      dir: ttb,
      spacing: 0.35cm,
      text(size: 0.56em, weight: "bold", fill: aalto-gray, tracking: 0.06em, [Effort level]),
      legend-card(
        "1", "USE IT", "Prompt & publish",
        "Safe to use directly & exploratory. Use AI output as-is.",
        col-use, rgb("#DFF6E7"), rgb("#5dd089")
      ),
      legend-card(
        "2", "FINISH IT", "AI base + human edit",
        "Use AI for layout or cleanup, but verify & refine details yourself.",
        col-finish, rgb("#FEFCEE"), rgb("#ffc341")
      ),
      legend-card(
        "3", "DO IT YOURSELF", "100% human ownership",
        "AI can help with layout or cleanup, but the final image needs to be human generated. Full accountability.",
        col-diy, rgb("#FFEFEF"), rgb("#FED0CF")
      ),
      box(
        width: 100%,
        fill: rgb("#F2F4F7"),
        radius: 5pt,
        inset: (x: 9pt, y: 7pt),
        text(size: 0.5em, fill: aalto-black)[
          *Good practices:* Test ideas with AI. Prove facts with code and data. If you want to be the owner of the final image, you need to put effort into creating it.
        ]
      )
    )
  )
}

#credit-line[Images © 2026 Pedro Silva. Licensed under CC BY 4.0.]

// ── 3 · the tools, dated ────────────────────────────────────────────────────
== Which tool should you use? (#asof-date)

#v(-0.5em)
#align(center)[
  #grid(
    columns: 1,
    figure(
      image("../figures/aiarena.png", height: 13.2em),
      alt: "Screenshot of Aalto's AI tool",
      caption: text(size: 0.72em)[New models are added every day (hard to keep up-to-date)],
      numbering: none,
    )
  )
]

#credit[#link("https://arena.ai/leaderboard/image/text-to-image")[Ranking provided by *arena.ai*]]
