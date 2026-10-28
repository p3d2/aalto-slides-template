// ── 6 · Three research workflows — old deck 62–64 (+ Pedro's own run) ───────
#import "../../../theme/aalto.typ": *
#import "../figs.typ": *

#spec-table(
  (
    [Tool],
    [Access here],
    [Data & uploads],
    [Edits your image?],
    [Output],
  ),
  live-tools.map(t => (
    {
      text(weight: "bold", size: 1.06em, t.name)
      if t.maker not in (none, [], "") {
        linebreak()
        text(size: 0.82em, fill: aalto-gray, t.maker)
      }
    },
    t.access,
    t.uploads,
    t.edits,
    {
      t.gives
      if t.open not in (none, [], [no], "no", false) {
        [ · #text(fill: aalto-blue-dark, weight: "bold")[open weights]]
      }
    },
  )),
  cols: (1.1fr, 0.9fr, 1.15fr, 0.95fr, 1.05fr),
  size: 0.56em,
)

#v(0.35em)
  #text(size: 0.76em, fill: aalto-gray)[
    #align(center)[
    #text(weight: "bold", fill: aalto-black)[Four practical filters:]
    Can you access it here? · Does it train on your uploads? · Can it edit an existing figure? · What file comes back?
  ]
]


// old 62 — two runs of one good prompt.
== Workflow I — use it for the concept, not for the figure

#example(
  prompt: "Scientific concept graphic on a pure white background: a left-to-right sequence of five identical rods, each gently twisting more than the previous, colored by a smooth low-to-high gradient along their length. Add a small vertical color bar at the right with no tick numbers or words. Flat vector look, crisp edges, no shadows, no textures, no photorealism.",
  images: ("concept-rods-a", "concept-rods-b"),
  labels: ([run 1], [run 2]),
  take: [Generate two or three to settle style, composition, perspective, colour.
    Then draw it yourself — the runs are the brief, not the figure.],
  source: [doi:10.5281/zenodo.14032261 · old slide 62],
)

// old 63 — sketch → AI concept → the redraw you publish.
== Workflow II — AI-informed, hand-made, publishable

#example(
  images: ("rig-sketch-user", "rig-drawing-ai", "rig-illustration-final"),
  labels: ([your sketch], [AI concept], [redrawn in Inkscape]),
  note: [Inkscape is free, the output is SVG, and every line in the last one is
    yours.],
  take: [This is the answer to “so can I use it in a paper?” — yes, as a
    reference, no, as the figure.],
  source: [doi:10.5281/zenodo.14032261 · old slide 63],
)

// old 64 — ask for the script, not the pixels.
== Workflow III — ask for code, not pixels

#example(
  prompt: "I've attached a picture of my experimental setup. I want you to make a script for Blender that generates a scientific diagram, use color-blind safe colors and freestyle stroke. (...) Be extra careful to make sure the code does run on Blender 4.5, so don't use deprecated code.",
  images: ("blender-code", "blender-render"),
  labels: ([the script in Blender], [the render]),
  take: [Code is editable, re-renderable and citable; a PNG from a chat is none of
    those. And it can read your data files too.],
  source: [doi:10.5281/zenodo.14032261 · old slide 64],
)

// NEW — Pedro's own Blender run. ⚠ The four passes are currently missing from
// figures/ (see OUTLINE.md §0 and figures/README.md): drop them back with these
// exact names, re-run kit/scan-figures.py, and the placeholders fill themselves.
== The same ladder, on my own subject: an Erodium awn in Blender

#example(
  images: ("erodium_lines", "erodium_flat", "erodium_shadows", "erodium_lights"),
  labels: ([lines], [flat], [shadows], [lights]),
  note: [Four render passes of one model — not four pictures.],
  take: [Which pass you keep, and how far you push it, is a decision you make.
    That difference is the whole talk.],
  source: [model + render: Pedro Santos Silva · subject: doi:10.1039/C8SM02290A],
)
