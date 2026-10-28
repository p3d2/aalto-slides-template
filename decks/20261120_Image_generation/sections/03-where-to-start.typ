// ── 3 · Prompting for images — old deck 53–54 ───────────────────────────────
#import "../../../theme/aalto.typ": *
#import "../figs.typ": *

= Where to start?

== From ideas to images

#v(-0.5em)
#example(
  prompt: "Scientific concept graphic on a pure white background: a left-to-right sequence of five identical rods, each gently twisting more than the previous, colored by a smooth low-to-high gradient along their length. Add a small vertical color bar at the right with no tick numbers or words. Flat vector look, crisp edges, no shadows, no textures, no photorealism.",
  
)
#v(0.5em)
#align(center)[
  #grid(
    columns: 3,
    column-gutter: 1em,
    figure(
      image("../figures/concept-rods-a.jpg", height: 9.6em),
      alt: "Screenshot of Aalto's AI tool",
      caption: text(weight: "bold", size: 0.72em, fill: aalto-blue)[Dall-E·3],
      numbering: none,
    ),
    figure(
      image("../figures/concept-rods-c.png", height: 9.6em),
      alt: "Screenshot of Adobe's AI tool",
      caption: text(weight: "bold", size: 0.72em, fill: aalto-blue)[GPT Image 1.5],
      numbering: none,
    ),
    figure(
      image("../figures/concept-rods-d.jpeg", height: 9.6em),
      alt: "Screenshot of OpenAI's DALL·E",
      caption: text(weight: "bold", size: 0.72em)[Flux 2 Pro],
      numbering: none,
    ),
  )
]

== Combining reference images

#v(-0.5em)
#example(
  prompt: [Draw two researchers (pictures attached) from Aalto University (the image attached contains a landmark building), giving a webinar about Prompt Engineering. The artistic style should resemble a Lego movie.],
  attachments: ("researcher_1.jpg", "researcher_2.jpg", "undergraduate_center.jpg")
)
#v(0.5em)
#align(center)[
  #figure(
        image("../figures/lego-webinar.png", height: 9.6em),
        alt: "Screenshot of Aalto's AI tool",
        caption: text(weight: "bold", size: 0.72em)[GPT Image 1],
        numbering: none,
      )
]

== Editing pictures

#v(-0.5em)
#example(
  prompt: [Remove all cables, bottles and chemicals from the image.],
  attachments: ("messy_solar_simulator.jpg",)
)
#v(0.5em)
#align(center)[
  #grid(
    columns: 3,
    column-gutter: 1em,
    figure(
      image("../figures/lab-before-cleanup.jpg", height: 9.6em),
      alt: "Screenshot of Aalto's AI tool",
      caption: text(size: 0.72em)[#raw("messy_solar_simulator.jpg")],
      numbering: none,
    ),
    align(center + horizon)[
      #text(size: 2.5em, fill: aalto-blue)[#sym.arrow.r]
    ],
    figure(
      image("../figures/lab-after-cleanup.png", height: 9.6em),
      alt: "Screenshot of OpenAI's DALL·E",
      caption: text(weight: "bold", size: 0.72em)[GPT Image 1],
      numbering: none,
    ),
  )
]

== Putting your own result in a context

#v(-0.5em)
#example(
  prompt: [Generate a beautiful realistic nature, featuring the butterfly actuator living among real ones. It should look natural, calm and symbiotic.],
  attachments: ("butterfly-source.jpg",)
)
#v(0.5em)
#align(center)[
  #grid(
    columns: 3,
    column-gutter: 1em,
    figure(
      image("../figures/butterfly-source.jpg", height: 9.6em),
      alt: "Screenshot of Aalto's AI tool",
      caption: text(size: 0.72em)[#raw("butterfly-source.jpg")],
      numbering: none,
    ),
    align(center + horizon)[
      #text(size: 2.5em, fill: aalto-blue)[#sym.arrow.r]
    ],
    figure(
      image("../figures/butterfly-generated.png", height: 9.6em),
      alt: "Screenshot of OpenAI's DALL·E",
      caption: text(weight: "bold", size: 0.72em)[GPT Image 1],
      numbering: none,
    ),
  )
]
#credit-line[#link("https://www.aalto.fi/en/news/aalto-researchers-develop-butterfly-inspired-actuator-that-can-be-used-in-soft-robotics")[The butterfly effect -- bending and turning artificial muscles with light | Aalto University]]

== From a photo of your setup to a schematic

#v(-0.5em)
#example(
  prompt: [I've attached a picture of my experimental setup. I want you to make a representation in the style of a *scientific diagram*. My picture is a photo so it has *many elements that are not needed*. In the center top it has the solar simulator, the calibrator system is in the center and being illuminated, and in the right top there's the thermal camera and in the right there's the screen showing the image of the thermal camera.],
  attachments: ("messy_solar_simulator.jpg",)
)
#v(0.5em)
#align(center)[
  #grid(
    columns: 3,
    column-gutter: 2em,
    figure(
      image("../figures/setup_photo.jpg", height: 9.2em),
      alt: "Screenshot of Aalto's AI tool",
      caption: text(size: 0.72em)[#raw("messy_solar_simulator.jpg")],
      numbering: none,
    ),
    align(center + horizon)[
      #text(size: 2.5em, fill: aalto-blue)[#sym.arrow.r]
    ],
    figure(
      image("../figures/setup_photo_ai_c.jpg", height: 9.2em),
      alt: "Screenshot of OpenAI's DALL·E",
      caption: text(weight: "bold", size: 0.72em)[Nano Banana 2.5],
      numbering: none,
    ),
  )
]

== From a sketch to a full picture

#v(-0.5em)
#example(
  prompt: [I want to make a diagram for my research article. It needs to have a good finishing without becoming sci-fi. *Generate a prompt* that I can use with this image so it takes full advantage of the latest image generation models of ChatGPT. The fidelity does not need to be 100% because I draw really bad, I tried to depict from top to bottom in the image dirty water on top of a glass, goes through a filter and in the bottom there's clean water. The left side starts in the filter and it's supposed to be a super ampliation to see the internal structure at micro/nano level of cellulose chains and nanoparticles],
  attachments: ("filter_sketch.jpg",)
)
#v(0.5em)
#align(center)[
  #grid(
    columns: 3,
    column-gutter: 2em,
    figure(
      image("../figures/filter_original_c.jpg", height: 8.0em),
      alt: "Screenshot of Aalto's AI tool",
      caption: text(size: 0.72em)[#raw("filter_sketch.jpg")],
      numbering: none,
    ),
    align(center + horizon)[
      #text(size: 2.5em, fill: aalto-blue)[#sym.arrow.r]
    ],
    figure(
      image("../figures/filter_c.png", height: 8.0em),
      alt: "Screenshot of OpenAI's DALL·E",
      caption: text(weight: "bold", size: 0.72em)[ImageGen],
      numbering: none,
    ),
  )
]