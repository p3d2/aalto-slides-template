// ── 1 · How it works — old deck 46–49 ───────────────────────────────────────
// Each slide is one data call; layout lives in kit/deckkit.typ.
// Figure names come from figures/manifest.json — rename or replace a file,
// re-run `python3 kit/scan-figures.py decks/20261120_Image_generation`, and the
// slides follow. A name that does not exist yet prints a labelled placeholder.
#import "../../../theme/aalto.typ": *
#import "../figs.typ": *

// old 46 — divider
= Image generation

// old 47 — four microscopes, increasing finish.
== A human draws in steps: outline, detail, shading

#example(
  images: ("human-drawing-ladder",),
  labels: ([complexity increases →],),
  take: [Nobody hands a model finished pictures. It learns the *result* of that
    ladder — which is why it can imitate a style but not a method.],
  source: [doi:10.5281/zenodo.14032261 · old slide 47],
)

// old 48 — the denoising strip. NB: a markup cell must not *start* with `+`
// (Typst reads it as a list bullet) — the labels below are worded around it.
== It does not collage pictures — it removes noise, step by step

#example(
  images: ("diffusion-0-clean", "diffusion-1-noisy", "diffusion-2-noisier",
           "diffusion-3-noise"),
  labels: ([the picture], [a bit of noise], [more noise], [pure noise]),
  note: [Training: corrupt a picture, ask the model what it removed.
    Generation: start from noise and repeat that, many times.],
  source: [doi:10.5281/zenodo.14032261 · old slide 48],
)

// old 49 — mechanism, two families. No figure: this one is a talking slide.
== Two families under the hood — and one of them is the model you already use for text

#v(-0.3em)

- *Diffusion* — start from noise, denoise towards the words you gave it. Most
  tools you have heard of: DALL-E, Firefly, Stable Diffusion, Midjourney.
#pause
- *Autoregressive* — predict the next piece of image the way a text model
  predicts the next word. This is GPT-Image, and it is why that one can read your
  attached photo and edit it instead of redrawing it.
#pause
- Both learn patterns from huge datasets — neither searches the internet for a
  picture that looks like your words.

#credit[Deep dives: Welch Labs · 3Blue1Brown · Render Realm · old slide 49]
