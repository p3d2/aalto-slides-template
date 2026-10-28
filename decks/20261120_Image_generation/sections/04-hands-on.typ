// ── 3 · Prompting for images — old deck 53–54 ───────────────────────────────
#import "../../../theme/aalto.typ": *
#import "../figs.typ": *

= Hands-on example: using Blender

== The basic workflow

#let workflow-step(n, heading, body) = {
  grid(
    columns: (2.8em, 1fr),
    column-gutter: 0.8em,
    align: (center, horizon),
    text(size: 1.5em, weight: "bold", fill: aalto-blue)[#n],
    block(width: 100%)[
      #text(weight: "bold", size: 0.92em)[#heading]
      #v(-0.2em)
      #text(size: 0.8em, fill: aalto-gray)[#body]
      #v(-0.5em)
    ],
  )
  v(0.8em)
}

#workflow-step(
  "01",
  "Design the prompt",
  "Use a chatbot or AI agent to develop and refine your prompt.",
)

#workflow-step(
  "02",
  "Generate code, not images",
  "Ask the AI to define shapes, structures, or physical setups in code. It can also work directly with your data.",
)

#workflow-step(
  "03",
  "Run it in Blender",
  "Execute the generated code in Blender’s scripting workspace.",
)

#workflow-step(
  "04",
  "Refine and render",
  "Adjust the geometry, materials, and textures, then render the final result.")


== The prompt

#chat-example(
  rounds: (
    (
      prompt: [Create a Blender Python script that generates a scientific 3D visualization of microplastics in a water sample. Include a transparent blue water volume, hundreds of small irregular plastic fragments and thin fibers suspended at different depths, and a layer of sediment at the bottom. Use procedural geometry and materials, studio lighting, and an orthographic camera. Make the scene clean, visually clear, and suitable for an academic presentation. *Organize the parameters* so I can easily modify particles, sizes, shapes, and distribution. Generate the scene entirely through Python; do not use external images.],
      answer: [I've written the script as `microplastics_scene.py`. I haven't run it in Blender, so expect to adjust a few things on the first run. Run it from the Scripting tab, or headless with `blender --background --python microplastics_scene.py`.

*What it builds*
- *Water:* a closed box with a transparent, Fresnel-reflective surface and a light-blue absorbing volume. Nothing refracts, so the particles stay undistorted.
- *Sediment:* a bumpy, noise-displaced layer at the bottom with a procedural sand material. About 700 loose sand grains sit on top of it.
...],
    ),
  ),
  reveal: true,
)

== Blender (how it looks)

#v(-0.5em)
#align(center)[
  #grid(
    columns: 1,
    figure(
      image("../figures/scripting_c.png", height: 13.2em),
      alt: "Screenshot of Aalto's AI tool",
      caption: text(size: 0.72em)[Go to *Scripting* workspace],
      numbering: none,
    )
  )
]

== Blender (how to create a script)

#v(-0.5em)
#align(center)[
  #grid(
    columns: 1,
    figure(
      image("../figures/new_c.png", height: 13.2em),
      alt: "Screenshot of Aalto's AI tool",
      caption: text(size: 0.72em)[Click on the *New* button],
      numbering: none,
    )
  )
]

== Blender (how to run the script)

#v(-0.5em)
#align(center)[
  #grid(
    columns: 1,
    figure(
      image("../figures/run_c.png", height: 13.2em),
      alt: "Screenshot of Aalto's AI tool",
      caption: text(size: 0.72em)[Click on the *Run* button],
      numbering: none,
    )
  )
]

== Render

#v(-0.5em)
#align(center)[
  #grid(
    columns: 1,
    figure(
      image("../figures/microplastics_v2_c.jpg", height: 13.2em),
      alt: "Screenshot of Aalto's AI tool",
      caption: text(size: 0.72em)[Click on the *New* button],
      numbering: none,
    )
  )
]