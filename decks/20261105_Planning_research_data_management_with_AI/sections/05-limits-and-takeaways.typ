// ── 5 · Limits, safe use, and the three takeaways — 7 min ──────────────────
// Surface level, and only what Aalto publishes. The rules below are quoted from
// two aalto.fi pages (dated in the credit lines); everything else — the
// sub-classification of confidential data, the upload rules, the web-search
// toggle, the model comparison — stays in these comments and in the speaker
// notes, because it is either not official Aalto guidance or not verified.
//
// DO NOT PUT ON A SLIDE (Pedro, 2026-11-02):
//  - Which kinds of confidential data are actually fine to enter. Work is under
//    way on that and it is not official guidance yet, so the slides stop at the
//    published classification table and link out for detail.
//  - Any claim about which model answers better (the Terra vs RAG benchmark).
//    Internal evaluation, not Aalto guidance. Back-pocket slide at most, and
//    only if someone asks about choosing a model.
//  - The web-search toggle. The news item is not fetchable (aalto.fi returns
//    HTTP 500 to our fetcher) and the service page still says the Assistant
//    cannot reach the internet. If it comes up, answer from the app, not the
//    deck. SOURCES.md claim 28.
//  - RDMASSISTANT.md §5E says "do not input secret, confidential, or sensitive
//    personal data" into ai.aalto.fi. Stricter than the published table. If a
//    listener reads the prompt aloud, agree that the prompt is the safer rule
//    and take it to the Data Agents afterwards (PROMPT_CHANGES.md).
#import "../../../theme/aalto.typ": *
#import "../../../kit/deckkit.typ": compare-table, ink-muted, panel, fill-card, ink-emph, ink-body

= Limits and safe use

== Classify your data before you paste

#compare-table(
  ([Level], [Examples], [AI tools Aalto allows]),
  (
    ([Public],
     [Wikipedia content, published papers with CC license, public datasets, document calls for proposals],
     [Any AI tool]),
    ([Internal],
     [Meeting notes, internal pages],
     [*Aalto AI Assistant*]),
    ([*Confidential*],
     [Participant data, unpublished findings],
     [*Aalto AI Assistant* or run AI models locally (e.g. on Triton cluster)]),
    ([*Secret*],
     [Medical records, patent-sensitive information],
     [*No cloud AI tool*, only local tools inside a Trusted Research Environment like SECDATA]),
  ),
  cols: (0.85fr, 1.3fr, 1.4fr),
  leading: 0.4em,
  inset: (x: 0.5em, y: 0.45em),
)


#credit-line[#link("https://www.aalto.fi/en/research-art/best-practices-for-ai-use-in-research-work")[Best practices for AI use in research work · aalto.fi · 28.10.2026]]


== Verify what it tells you about Aalto

#{
  set text(size: 0.9em)
  set par(leading: 0.9em)
  [
    + Aalto's own answer to "can I trust Aalto AI Assistant's answers?" is *No.* Language models often generate false information, such as hallucinations, inaccuracies and bias.
    + Use the *Aalto.fi chatbot* for links, services, and policies: it answers from #link("aalto.fi") content and is the tool Aalto designates for Aalto-related questions.
    + Anything that decides what you do next (a storage service, a legal basis, an ethics requirement) goes to the Aalto service named in the answer, not to the chat.
  ]
}

#v(0.5em)
// 0.75em, not 0.8: at four lines the paragraph's last line lands in the strip
// of page the theme reserves for the corner mark (measured: text ink y612-634
// vs logo ink y614-667 at 108 ppi). Three lines clear it.
#text(size: 0.75em)[
  What the limits look like, *same scenario in both tools*: the ChatBot answered without asking follow-ups & ignored the output structure. For links and services it is still the better tool (always up-to-date with internal information).
]

#credit-line[Aalto AI Assistant service page · aalto.fi · 30.6.2026]

== To keep in mind

#{
  let cards = (
    ("01", [A complementary tool],
     [This tool available at all times and can be used for quick reference, or as a starting point for more detailed work.]),
    ("02", [A helper, not a writer],
     [It makes drafts for you, and its questions and checklists are useful to improve your DMP, but not a replacement for your own thinking.]),
    ("03", [Select the right resource],
     [You don't always need the most powerful model. Also, while not reliable Aalto ChatBot contains up-to-date information about Aalto services and policies. *In case of doubt reach out to the Aalto Data Agents*.]),
  ).map(((n, t, d)) => panel(
    fill: fill-card,
    inset: (x: 0.9em, y: 1em),
    height: 15em,
    [
      #text(size: 1.3em, weight: "bold", fill: ink-emph, n)
      #v(0.25em)
      #text(size: 0.9em, weight: "bold", fill: aalto-black, t)
      #v(0.6em)
      #text(size: 0.7em, fill: ink-body, d)
    ],
  ))
  grid(columns: (1fr, 1fr, 1fr), column-gutter: 1.1em, align: top, ..cards)
}
