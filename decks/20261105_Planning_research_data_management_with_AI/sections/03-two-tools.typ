// ── 3 · Where to run it — the "two tools" strategy — 8 min ─────────────────
// Comparison table: the SAME master prompt, three different models, and the
// job each one is good at. Turns the internet-access / knowledge-cutoff hiccup
// into content: reasoning is not the same thing as being up to date.
//
// NAMING (verify in ai.aalto.fi before deck final, 29 Oct): the dropdown labels
// and the printed knowledge cutoffs. OpenAI documents GPT-6.1 Sol (cutoff
// 30 Apr 2026) and GPT-6.1 Terra (cutoff 1 Jun 2026); GPT-5.5/.4/.1 stay in the
// menu as the older tiers. If Aalto labels them "GPT-6 Sol"/"GPT-6 Terra",
// change the strings in the table below — they are the only place they appear.
#import "../../../theme/aalto.typ": *
#import "../../../kit/deckkit.typ": compare-table, numbered-item, hairline

= Different tools, one workflow

== Different models for different purposes

#compare-table(
  ([When you need to], [Use], [Because]),
  (
    ([Work out the plan (intake, follow-ups, trade-offs)],
     [*GPT-6.1 Sol*],
     [Strongest multi-step reasoning, and room to hold the prompt plus the whole conversation at once]),
    ([Write the words (APL-ready notes, summaries, FI ⇄ EN)],
     [*GPT-6.1 Terra*],
     [Fast, cheaper, natural writing]),
    ([Check an Aalto service, a link, internal information],
     [*Aalto.fi Chatbot*],
     [It answers from *aalto.fi* and cites pages, so a link or a deadline is checked against the live website, not against a model's memory])
  ),
  cols: (0.75fr, auto, 1.45fr),
)

#text(size: 0.7em)[
  It is not always clear which model to use. The table above is a rough guide to the different models available in the Aalto AI Assistant. *Test them out* and see which one works best for your needs.
]

== How to use the system prompt?

#stack(
  dir: ttb,
  spacing: 0.5em,
  numbered-item(
    "01",
    [Pick the model],
    [First, every time: a model change resets the system prompt.],
    gap: 0.5em,
  ),
  hairline(),
  numbered-item(
    "02",
    [Load the system prompt],
    [From the Prompt Book, or paste RDMASSISTANT.md directly in the chat.],
    gap: 0.5em,
  ),
  hairline(),
  numbered-item(
    "03",
    [Set the level of reasoning],
    [Low to start; high when the answer feels shallow or the project is complex.],
    gap: 0.5em,
  ),
  hairline(),
  numbered-item(
    "04",
    [Introduce your scenario],
    [One message: who you are, the funder, the project phase, the data you have.
     The assistant takes the wheel from here.],
    gap: 0.5em,
  ),
  hairline(),
  numbered-item(
    "05",
    [Answer the follow-up questions],
    [If it asks, you answer so the model can respond effectively.],
    gap: 0.5em,
  ),
)

#v(0.5em)
#text(size: 0.7em)[
  Steps 1 to 3 are per conversation, not per message.
]

#credit-line[Prompt: RDMASSISTANT.md v1.2 · ai.aalto.fi]