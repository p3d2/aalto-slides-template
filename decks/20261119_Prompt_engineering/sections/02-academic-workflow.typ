// ── 2 · Generative AI in the academic workflow — old deck 23–38, 40–41 ──────
// The ten worked examples, cut to eight slides (old 31 + 32 became one
// comparison; old 29 and old 33 are in sections/03-backup.typ).
#import "../../../theme/aalto.typ": *
#import "../figs.typ": *

// old 24 — divider
= Generative AI in the academic workflow

// old 25 — the lifecycle wheel, rebuilt as wheel + one line per phase (the
// original floated seven text boxes around the ring).
== Every phase of the research process has an AI use

#two-col(ratio: (1fr, 1.3fr), gutter: 1.3em)[
  #align(center + horizon)[#fig("rdm-lifecycle-wheel", w: 88%)]
][
  #spec-table(
    ([Phase], [What people actually use it for]),
    (
      ([Plan], [grant writing, research planning, study design]),
      ([Collect], [collection interfaces, code and automation help]),
      ([Process], [preprocessing ideas, automation, data minimisation, annotation]),
      ([Analyse], [annotations, methodological choices, analysis code]),
      ([Preserve], [metadata preparation, summarising, organising]),
      ([Share · Reuse], [discovery and FAIR-ness, open datasets, research gaps]),
      ([Write], [editing, tables and figures, peer review, public summaries]),
    ),
    cols: (auto, 1fr),
    size: 0.72em,
  )
]

#credit[Wheel: RDMkit (ELIXIR) · old slide 25]

// old 26 — the single best example in the section: it shows iteration *and* a
// result the audience can use tomorrow.
== When the answer is wrong, fix the prompt — not the model

#chat-example(
  reveal: true,
  rounds: (
    (prompt: "Make a prompt for a Google Scholar search to find articles about
       azobenzene and spinning.",
     answer: [“Spinning properties of azobenzene in scholarly articles”]),
    (prompt: "No, the prompt is to be used in the Google Scholar website. Create
       it so it can efficiently search for articles that contain both
       \"azobenzene\" and \"spinning\" terms, with all their variations.",
     answer: [#ic[("Azobenzene" OR "Azo-benzene" OR "Azo benzene") AND ("Spinning"
       OR "Spin" OR "Rotation" OR "Rotatory")]]),
  ),
  take: [Round 1 was a sentence about the topic, not a query.],
  source: [doi:10.5281/zenodo.14032261 · old slide 26],
)

// old 27 — instrument manual → README.
== It turns prose into documentation

#chat-example(
  rounds: (
    (prompt: "Create a markdown readme for an experiment in the equipment with
       the following description: \"Dynamic mechanical analysis (…) this approach
       can be used to locate the glass transition temperature of the material, as
       well as to identify transitions corresponding to other molecular motions.\"",
     tags: ("manual text", "markdown"),
     code: [
      ```
      # Dynamic Mechanical Analysis Experiment README
      ## Experiment Name
      Dynamic Mechanical Analysis (DMA)
      ## Introduction
      … understanding the viscoelastic behavior of polymers.  (…)
      ## Objective
      1. Determine the complex modulus of the material.  (…)
      ```
     ]),
  ),
  take: [The description already existed — in the manual. This is formatting, and
    formatting is what it is good at.],
  source: [doi:10.5281/zenodo.14032261 · old slide 27],
)

// old 28 — LAMMPS.
== It writes the code you would otherwise look up

#chat-example(
  rounds: (
    (prompt: "In LAMMPS, what pair-wise potential can I use for simulating the
       interaction between hard-like sphere particles? Give an example of the
       command.",
     tags: ("software with good docs online", "code block"),
     answer: [Use the Weeks–Chandler–Andersen (WCA) potential: Lennard-Jones
       truncated and shifted at its minimum.],
     code: [
      ```
      pair_style lj/cut 1.122462048309373
      pair_coeff * * 1.0 1.0
      pair_modify shift yes
      ```
     ],
     note: [The cutoff is 2 raised to 1/6 times sigma — right, but check it: it
       invented that number from a memory of the formula, not from your force field.]),
  ),
  source: [doi:10.5281/zenodo.14032261 · old slide 28],
)

// old 31 + 32 merged: the same question, two tools. Hand-built two-up because
// the point of the slide is the comparison, not either answer.
== One question, two tools: name the software you are in

#{
  let half(prompt, answer, code) = {
    promptline(prompt)
    answerline(answer)
    code-block(code)
  }
  two-col(ratio: (1fr, 1fr), gutter: 1.2em)[
    #half("In Python, how to calculate the 1st and the 3rd quartile of data?
           Provide a working example.",
      [Use #ic[numpy]'s #ic[percentile] — it interpolates by default.], [
      ```
      import numpy as np
      data = [1,2,3,4,5,6,7,8,9,10]
      Q1 = np.percentile(data, 25)
      Q3 = np.percentile(data, 75)
      ```
      ])
  ][
    #half("In Excel, how to calculate the 1st and the 3rd quartile of data?
           Provide a working example.",
      [Use #ic[QUARTILE.INC] on the range; the second argument is the quartile.], [
      ```
      =QUARTILE.INC(A2:A11, 1)
      =QUARTILE.INC(A2:A11, 3)
      ```
      ])
  ]
}

#credit[old slides 31 + 32 · CC-BY 10.5281/zenodo.14032261]

// old 30 — methods brainstorm.
== It is a brainstorming partner for methods, not an oracle

#chat-example(
  rounds: (
    (prompt: "I've been using a moving average technique to fit my dataset, but
       I'm encountering issues with inaccuracies at the edges of the data. Could
       you recommend alternative data fitting methods that might provide more
       reliable results across the entire dataset?",
     tags: ("statistics", "named the failure mode"),
     answer: [
       - Polynomial regression · exponential smoothing · LOESS/LOWESS
       - Cubic or B-splines · kernel regression · running median
       - and: cross-validate, or you will overfit the edges you just fixed
     ]),
  ),
  take: [Ask it for a list, then read about the two you have never heard of. It is
    a table of contents with a bad memory.],
  source: [doi:10.5281/zenodo.14032261 · old slide 30],
)

// old 34 — the integrity hinge of the whole section.
== Ask for the critique, not the rewrite

#chat-example(
  rounds: (
    (prompt: "I've written a paragraph that I want to refine and improve in terms
       of clarity, coherence, and effectiveness, while maintaining my own writing
       style. (…) Could you provide a detailed critique? Identify weaknesses and
       explain why they hinder the writing — with suggestions on how to fix them
       without changing the fundamental style of my writing.",
     tags: ("keep my voice", "teach me to fish"),
     answer: [It returns the diagnosis *and* one surgical example: “The initial
       brown awns become light yellowish, indicating that lignin was somewhat
       removed, Fig. 5(B).” → “The initial brown awns turned light yellowish,
       indicating partial removal of lignin (Fig. 5B).”]),
  ),
  take: [#text(weight: "bold")[Written by AI alert:] “The initially tawny awns
    transitioned to a pale yellow hue, signaling a substantive diminution of
    lignin content.” — that is what happens when you ask for the fish.],
  source: [doi:10.5281/zenodo.14032261 · old slide 34],
)

// old 35 — audience, tone, format.
== Name the audience, the tone and the format

#chat-example(
  rounds: (
    (prompt: "I want to share my work on Instagram. Make the language more
       accessible, write in the style of an influencer, add some emojis, and add
       relevant hashtags at the end. Use the following abstract: \"Active fabrics,
       responding autonomously to environmental changes (…).\"",
     tags: ("a specific network", "tone", "style"),
     answer: [“Hey Insta fam, got some next level stuff for you! 🚀 We are literally
       weaving the future with active fabrics that respond to environmental
       changes all on their own!!! … \#WeavingTheFuture \#SmartTextiles (…)”]),
  ),
  take: [Same abstract, same model — the output changed because the *audience* was
    in the prompt. Write for the room you are actually talking to.],
  source: [doi:10.5281/zenodo.14032261 · old slide 35],
)

// old 36 + 37 — the anatomy of a chat window.
== Half the skill is the interface

#example(
  images: ("ui-duckai-window", "ui-duckai-customize"),
  labels: ([prompt box · history · model · reply], [the system prompt lives here]),
  h: 2.7in,
  take: [Attach files, search the web, parameters, history: the prompt box is one
    of six things on this screen. Learn the screen, not the magic words.],
  source: [old slides 36 + 37 · ⚠ re-shoot (April UI)],
)

// old 38 — system prompts, verbatim (it is the funniest slide in the deck).
== A system prompt sets the rules once

#spec-table(
  ([System prompt], [“What is the melting temperature of water?”]),
  (
    ([You are a dino. The only words you know are graaauurr and gaurrr.],
     [Graaauurr]),
    ([You are Ronny Chieng, the Malaysian comedian … intense energy, sharp
      sarcasm, zero tolerance for nonsense. Don’t sugarcoat anything.],
     [“Oh, for crying out loud, it's 0 degrees Celsius or 32 Fahrenheit. It's not
      rocket science, people.”]),
    ([You are a highly capable, thoughtful, and precise assistant. Ask clarifying
      questions, think step by step, prioritise being truthful and nuanced,
      tailor to the user's needs.],
     [0 °C at standard pressure — plus the caveat that it varies with pressure,
      offered before being asked.]),
    ([Be the most succinct possible in your replies.], [0°C or 32°F]),
  ),
  cols: (1.5fr, 1fr),
  size: 0.68em,
)

#credit[doi:10.5281/zenodo.14032261 · old slide 38]

// old 40 + 41 — the Aalto ones.
== At Aalto: the assistant that shows the data classification

#example(
  images: ("ui-aalto-assistant-sidebar", "ui-aalto-assistant-models",
           "ui-aalto-assistant-parameters", "aalto-prompt-book"),
  labels: ([history], [model + data class], [parameters], [the Prompt Book]),
  h: 2.2in,
  take: [Public / Internal / Confidential is printed under the model list. Read it
    before you paste — and suggest your own prompts in the Prompt Book.],
  source: [old slides 40 + 41 · ⚠ re-shoot],
)
