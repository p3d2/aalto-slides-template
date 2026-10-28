// ── 1 · Prompt engineering — old deck 18–22 ─────────────────────────────────
// Data in, layout out (kit/deckkit.typ). Figure names come from
// figures/manifest.json; re-run kit/scan-figures.py after touching figures/.
#import "../../../theme/aalto.typ": *
#import "../figs.typ": *

// old 18/19 — divider + the definition. Content after `= Heading` does NOT join
// the section slide (Touying starts a new one), so the quote is its own slide.
= Prompt engineering

#focus-slide[
  “the process of constructing queries or inputs for AI language models
  #text(weight: "bold")[so as to elicit the most precise, coherent, and pertinent
  responses]”
  #v(0.6em)
  #text(size: 0.45em)[#dim([The definition this course uses — wording varies
  across sources.])]
]

// old 20 — “The art of asking”. Same four words, four disciplines, four answers.
== A prompt is a question with the context baked in

#example(
  prompt: "What is love?",
  images: ("asking-sociology", "asking-chemistry", "asking-business",
           "asking-music"),
  labels: ([sociology], [chemistry], [business], [music]),
  h: 2.5in,
  note: "social interactions · dopamine and norepinephrine · attachment to a brand · “oh baby, don’t hurt me”",
  take: [The model did not change its mind about the words — it answered the
    question it could infer. Give it the context, and you get the answer you meant.],
  source: [doi:10.5281/zenodo.14032261 · old slide 20],
)

// old 21 — principles I.
== Be clear, give context, say what you want

#spec-table(
  ([Principle], [The prompt you typed], [The prompt that works]),
  (
    ([Clear and concise],
     [“Tell me about the climate”],
     [Summarize the key impacts of climate change observed globally between 2015
      and 2025, highlighting effects on agriculture.]),
    ([Contextual],
     [“What is PCE?”],
     [What is PCE in the context of photovoltaics?]),
    ([Instructive],
     [“Analyze the following text: (BLOCK OF TEXT)”],
     [Provide a short summary of the following text (50-70 words) explaining the
      reported key concepts. Provide a list with the main results, itemize the
      different methods, and explain the novelty.]),
  ),
  cols: (auto, 1fr, 1.5fr),
)

#credit[doi:10.5281/zenodo.14032261 · old slide 21]

// old 22 — principles II.
== Split the task, give it a role, set the tone

#spec-table(
  ([Principle], [The prompt you typed], [The prompt that works]),
  (
    ([Iterative],
     [“Write about renewable energies”],
     [List four types … → from that list, describe the advantages and drawbacks
      of solar → expand on the environmental impacts of large-scale solar.]),
    ([Roleplay],
     [“Explain to me the basics of antibiotics.”],
     [You are an experienced microbiology teacher who makes explanations
      accessible and fun for students. Explain how misuse of antibiotics
      contributes to resistance.]),
    ([Tone and format],
     [“Tell me about black holes.”],
     [Explain black holes in a friendly tone suitable for toddlers, with simple
      analogies, in bullet points, and briefly explain how the analogy works.]),
  ),
  cols: (auto, 1fr, 1.5fr),
)

#credit[CLEAR principles · OpenAI prompt engineering guide · old slide 22]
