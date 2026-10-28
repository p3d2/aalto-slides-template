// ── 1 · Introduction — what these tools are and what they are for ───────────
// Act 1 has exactly three jobs: kill the "it's a collage of other people's
// pictures" belief, hand out the map of capabilities, and date-stamp every tool
// name. The capability table below is rendered from catalogue.typ — next year
// you edit that file, not this one.
#import "../../../theme/aalto.typ": *
#import "../figs.typ": *
#import "../catalogue.typ": capabilities, tool, asof, asof-date, VERIFIED

// The section slide and the three opening slides are in 00-open.typ.

// ⚠ Pedro to decide: this mechanism slide is the last remnant of the old intro.
// The plane on slide 2 + the failures in act 3 carry the same message with less
// risk of going stale, so this may belong in the backup file instead.

// One mechanism slide, because the rest of the talk depends on it.
== An image generator draws — it does not search

#example(
  images: ("diffusion-0-clean", "diffusion-1-noisy", "diffusion-2-noisier",
           "diffusion-3-noise"),
  labels: ([the picture], [a bit of noise], [more noise], [pure noise]),
  note: "Training: corrupt a picture and ask what was removed. Generation: start from noise and repeat.",
  take: [Nothing is being copied or retrieved. It learned what pictures of this
    kind look like — which is why it is fluent, and why it invents details.],
  source: [old slide 48 · CC-BY 10.5281/zenodo.14032261],
)

// The capability map that used to be here is now slide 3 (the tools table,
// rendered from catalogue.typ) — one list of names is enough for an opening.
