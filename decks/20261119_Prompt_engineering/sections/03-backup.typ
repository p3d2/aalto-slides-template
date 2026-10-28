// ── 3 · Backup slides — after the Kiitos slide, only if the questions come ───
// The two examples the main flow dropped: too niche to spend 4 minutes on, too
// good to throw away. Cut from here, not from the main sections.
#import "../../../theme/aalto.typ": *
#import "../figs.typ": *

// old 29 — R Monte Carlo.
== It will also write the simulation you keep putting off

#example(
  prompt: "What R package and functions are most effective for simulating stock market fluctuations using Monte Carlo methods? Provide an example script.",
  images: ("example-montecarlo-gbm",),
  labels: ([the answer’s own output: 1000 GBM paths],),
  note: [Answer: #ic[quantmod] + #ic[MASS], a geometric Brownian motion loop, a
    seed, and a plot.],
  source: [doi:10.5281/zenodo.14032261 · old slide 29],
)

// old 33 — ffmpeg.
== Batch automation you can paste into a terminal

#example(
  prompt: "How can I create thumbnails for each MP4 file in a directory, using FFmpeg to select frames based on the video’s duration, scale the video, apply a specific FPS value, and include a timestamp overlay?",
  images: ("example-ffmpeg-thumbnails",),
  labels: ([what it produced],),
  note: [One command, every file in the folder — and it explains each flag after.],
  source: [doi:10.5281/zenodo.14032261 · old slide 33],
)
