// ── 5 · Where it fails — old deck 61 (+ the publication rule) ───────────────
#import "../../../theme/aalto.typ": *
#import "../figs.typ": *

// ── 5 · Where it fails — old deck 61 (+ the publication rule) ───────────────
#import "../../../theme/aalto.typ": *
#import "../figs.typ": *

= Limits of AI-generated images

== Responsible use of AI in research

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1.8em,
  align: top,
  text(size: 0.8em)[
    - It is just a new tool, we use it carefully
    - *AI cannot be given authorship*
    - Use of AI should be transparent by describing how AI is used (see example)
    - Personal data protection (*GDPR*) is to be followed
    - Protect your own unpublished work
  ],
  text(size: 0.8em)[
    - The output of the AI system can be sensitive
    - When creating artistic output, contributor roles must be explained transparently and specifically.
    - *Reproducibility* can be difficult to achieve
    - *Accountability*: you are responsible for what you present
],
)

#v(2em)
#takeaway[
  Remember: the *AI Act is into force*. Research is exempt until it is put into practice.
]
#credit[#link("https://www.aalto.fi/en/services/responsible-use-of-artificial-intelligence-in-the-research-process")[Responsible use of AI in the research process -- Aalto University]]

== Copyrights (I)

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1.4em,
  align: top,
  block(
    width: 100%,
    fill: rgb("#EEF3F8"),
    stroke: (top: 2.4pt + aalto-blue-dark),
    inset: (x: 0.85em, y: 0.65em),
    text(size: 0.8em)[
      *1. Using other people’s material as inputs to AI:*
      #v(0.2em)
      #set text(size: 0.82em)
      #set par(leading: 0.48em)
      - Don’t ask AI to “rework” someone else’s copyrighted image/text (derivative work)
      - Style and mimicry: avoid asking for images that “closely resemble” a specific copyrighted work
      - If you want to alter copyrighted work and then share it, you need the copyright holder’s permission
      - Allowed special cases: parody, caricature, pastiche (use carefully)
      - Deepfakes: Must be clearly labelled as such (unethical deepfakes are still punishable!)
    ]
  ),
  block(
    width: 100%,
    fill: rgb("#F7F7F7"),
    stroke: (top: 2.4pt + aalto-gray),
    inset: (x: 0.85em, y: 0.65em),
    text(size: 0.8em)[
      *2. Using AI outputs:*
      #v(0.2em)
      #set text(size: 0.82em)
      #set par(leading: 0.48em)
      - Ownership/protection: *If there’s no real human creative input, the output isn’t an “original work” in the copyright sense*. Your right to use it comes from the tool’s license/terms
      - Risk of copying: AI might produce something too close to an existing copyrighted work (from training or your inputs). Avoid prompts like: “Make this look exactly like [living artist]/[famous photo]”
      - Provider responsibilities: Some providers add protections/indemnities
    ]
  ),
)

#credit[#link("https://www.aalto.fi/en/services/artificial-intelligence-and-copyright")[AI and Copyright -- Aalto University]]

== Copyrights (II)

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1.4em,
  align: top,
  block(
    width: 100%,
    fill: rgb("#EEF3F8"),
    stroke: (top: 2.4pt + aalto-blue-dark),
    inset: (x: 0.85em, y: 0.65em),
    text(size: 0.8em)[
      *3. Permanent copies made by the provider (training & storage)*
      #v(0.2em)
      #set text(size: 0.82em)
      #set par(leading: 0.48em)
      - Check the tool’s settings and terms
      - Turn off “use my content for training” unless the material is yours, public-domain (author died >70 years ago), or explicitly CC0
      - If the tool requires allowing training on uploads, don’t upload third-party works.
      - *If the provider stores your uploads for its own future use, you need the copyright owner’s permission (unless it’s your own/PD/CC0)*
      - Also follow university standards: protect personal data, cite transparently, and follow good scientific practice
    ]
  ),
  block(
    width: 100%,
    fill: rgb("#F7F7F7"),
    stroke: (top: 2.4pt + aalto-gray),
    inset: (x: 0.85em, y: 0.65em),
    text(size: 0.8em)[
      *4. Using AI outputs in teaching and publications*
      #v(0.2em)
      #set text(size: 0.82em)
      #set par(leading: 0.48em)
      - Don’t publish AI outputs that rely on third-party, copyrighted inputs (e.g., publisher PDFs) as your teaching materials or figures
      - You may publish AI outputs if the tool’s terms allow it and you cite properly and the inputs were your own, public-domain, or CC0. Safe inputs for figures/materials: (1) your own images/diagrams; (2) Public domain (author died >70y ago); (3) CC0 content
    ]
  ),
)
