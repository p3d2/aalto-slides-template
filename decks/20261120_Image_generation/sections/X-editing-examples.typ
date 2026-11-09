// ── 4 · What it can do to *your* images — old deck 55–60 ────────────────────
// Six worked examples, all the same shape: a prompt, then the pictures.
#import "../../../theme/aalto.typ": *
#import "../figs.typ": *

// old 55 — one long prompt, three engines (+ the vector output).
== Same prompt, three engines, three different figures

#example(
  // Strings, not markup: the estimator can count them, and a prompt full of
  // `*`, `#`, `+` or `–` cannot accidentally re-flow the slide.
  prompt: "Scientific illustration showing a laboratory setup for a chemical reaction: a round-bottom flask on a heating plate connected to a condenser with circulating coolant tubes, visible vapors condensing back into liquid, clear glassware reflections, clean white background, labeled parts (A-E), flat vector-infographic style, color-blind-safe palette, minimal text, publication-ready composition.",
  images: ("flask-dalle3-flat", "flask-firefly", "flask-dalle3-badge",
           "flask-firefly-vector"),
  labels: ([DALL-E 3], [Firefly Image 4], [DALL-E 3, second run],
           [Firefly — #text(weight: "bold")[vector]]),
  source: [doi:10.5281/zenodo.14032261 · old slide 55],
)

// old 56 — GPT-Image reads the attachments.
== The newer trick is reading the pictures you attach


// old 57 — validated layout (.scratch/imggen/sample2-3.png).
== The newer trick is editing a photo you already have

#example(
  prompt: "Remove all cables, bottles and chemicals from the image.",
  images: ("lab-before-cleanup", "lab-after-cleanup"),
  labels: ([your photo], [same room, emptied]),
  note: [GPT-Image “high fidelity” mode],
  take: [This is the one that saves an hour: clean a bench shot before it goes in
    a slide, then say that you did.],
  source: [doi:10.5281/zenodo.14032261 · old slide 57],
)

// old 58 — day → night, geometry kept.
== Reimagine the scene and it keeps the geometry

#example(
  prompt: "Turn the scene into nighttime while preserving the same buildings, layout, glass, flags, and perspective. Create a lively outdoor university party: small groups chatting, a few people dancing, subtle string lights, and warm ambient lighting (photorealistic, not overcrowded). Treat the A! sculpture as a bright white light source: it glows intensely and casts realistic spill light onto the nearby pavement, railings, facade, flagpoles, and people in the bottom-right area, with natural falloff and reflections in the windows.",
  images: ("otaniemi-day", "otaniemi-night"),
  labels: ([photo], [same camera, after dark]),
  note: [Gemini image generation — “Nano Banana”],
  source: [doi:10.5281/zenodo.14032261 · old slide 58],
)

// old 59 — the butterfly actuator, and the honesty line.
== Put your own result in a context — and say so

#example(
  prompt: "Generate a beautiful realistic nature, featuring the butterfly actuator living among real ones. It should look natural, calm and symbiotic.",
  images: ("butterfly-source", "butterfly-generated"),
  labels: ([the actuator], [among real ones]),
  take: [Fine for outreach, a grant cover, a talk opener. Never a results figure
    — and the caption says which one this is.],
  source: [old slide 59 · “The butterfly effect”, Aalto news],
)

// old 60 — Pedro's rig: photo → schematic.
== From a photo of your rig to a schematic

#example(
  prompt: "I've attached a picture of my experimental setup. I want you to make a representation in the style of a scientific diagram. My picture is a photo so it has many elements that are not needed. In the center top it has the solar simulator, the calibrator system is in the center and being illuminated, and in the right top there's the thermal camera and in the right there's the screen showing the image of the thermal camera.",
  images: ("rig-photo", "rig-diagram-nanobanana"),
  labels: ([the photo], [the diagram]),
  take: [Naming each part in the prompt is what makes the diagram right — and it
    is the same skill as writing a good caption.],
  source: [doi:10.5281/zenodo.14032261 · old slide 60],
)
