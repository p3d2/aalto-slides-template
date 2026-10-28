// ── 2 · What to use — old deck 50–52 (+ 45) ─────────────────────────────────
#import "../../../theme/aalto.typ": *
#import "../figs.typ": *

= How to use the AI tools available at Aalto

== Easy access tools available at Aalto

#align(center)[
  #grid(
    columns: 2,
    column-gutter: 2em,
    figure(
      image("../figures/aiaalto.png", height: 12em),
      alt: "Screenshot of Aalto's AI tool",
      caption: link("https://ai.aalto.fi/")[*ai.aalto.fi*],
      numbering: none,
    ),
    figure(
      image("../figures/aiadobe.png", height: 12em),
      alt: "Screenshot of Adobe's AI tool",
      caption: link("https://www.adobe.com/solutions/ai.html")[*Adobe's Firefly*],
      numbering: none,
    ),
  )
]

== What is a good prompt?

#v(-0.5em)
// Callout / Tip Container
#[
  #set text(size: 0.72em)
  #rect(
    width: 100%,
    stroke: (left: 3pt + aalto-red, rest: 1pt + aalto-red),
    radius: (right: 4pt),
    fill: aalto-gray.lighten(95%),
    inset: (x: 14pt, y: 12pt),
  )[
    #text(weight: "bold", fill: aalto-red, size: 1.1em)[Quick start:] \
    #v(2pt)
    #enum(
      numbering: "a)",
      tight: true,
      [Check the tool's official documentation for the latest prompting recommendations.],
      [Use meta-prompts when possible (e.g., _"Generate a prompt for model gpt-image-1.5 that will produce an image of..."_).],
    )
  ]
]
#v(-0.5em)
#text(size: 0.8em)[Example of #link("https://docs.midjourney.com/hc/en-us/articles/32023408776205-Prompt-Basics")[prompt basics for Midjourney]]:
#v(-0.5em)
#text(size: 0.72em, fill: aalto-gray)[
- *Subject*: Who or what? (person, animal, character, location, object)
- *Medium*: In what form? (photo, painting, illustration, sculpture, doodle, tapestry)
- *Environment*: Where? (indoors, outdoors, on the moon, underwater, in the city)
- *Lighting*: What kind? (soft, ambient, overcast, neon, studio lights)
- *Color*: In what shades? (vibrant, muted, bright, monochromatic, colorful, black and white, pastel)
- *Mood*: Feelings to evoke? (playful, calm, gloomy, energetic)
- *Composition*: How is it framed? (portrait, headshot, closeup, birds-eye view)
]
#align(center)[
  #text(size: 0.8em)[The model fills in the rest, so leave nothing important blank.]
]

== Useful keywords for research image generation

#v(-0.5em)
#{
  // Styled prompt token pill
  let tok(label) = box(
    baseline: 22%,
    inset: (x: 0.45em, y: 0.24em),
    radius: 3pt,
    fill: aalto-blue.lighten(90%),
    stroke: 0.5pt + aalto-blue.lighten(55%),
    text(size: 0.72em, weight: "bold", fill: aalto-blue-dark, label)
  )

  // Small subtle separator between tokens
  let sep = h(0.5em)
  spec-table(
    ([Prompt keywords to add], [What it suggests the model to do], [Best for / Watch out]),
    (
      (
        [#tok("scientific diagram")#sep#tok("schematic illustration")],
        [Separates parts, flattens perspective, adds callout lines],
        [*Process flows & setups* strip AI text & re-label yourself],
      ),
      (
        [#tok("flat vector illustration")#sep#tok("iconographic")],
        [Kills photorealistic lighting, shadows, and lens blur],
        [*Slide icons & graphical abstracts* cleanest background removal],
      ),
      (
        [#tok("minimalist line art")#sep#tok("white background")],
        [High-contrast ink strokes only — a drawing, not a photo],
        [*Whiteboard / xkcd concepts* easy to trace or threshold],
      ),
      (
        [#tok("isometric cutaway")#sep#tok("orthographic 3D")],
        [Parallel projection where depth and hidden layers stay readable],
        [*Hardware rigs & layer stacks* check port & screw counts],
      ),
      (
        [#tok("patent drawing")#sep#tok("technical cross-section")],
        [Monochrome stippling and numbered leader lines on plain paper],
        [*Mechanical assemblies* great when photos look too messy],
      ),
      (
        [#tok("Okabe-Ito palette")#sep#tok("high contrast")],
        [Pushes distinct hues instead of muddy cinematic gradients],
        [*Review-safe figures* still verify contrast in grayscale],
      ),
    ),
    cols: (1.25fr, 1.4fr, 1.2fr),
    size: 0.72em,
  )
}

#v(-0.5em)
#align(center)[
  #text(size: 0.76em, fill: aalto-gray)[
    *Tip:* Avoid saying #text(fill: aalto-red, weight: "bold", [make it look professional]), name the #text(fill: raw-school-colours.chem1, weight: "bold", [medium]) and the #text(fill: raw-school-colours.chem1, weight: "bold", [projection]) instead.
  ]
]
