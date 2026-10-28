# Talk outline — Planning research data management with AI

Webinar deck for **TASK-015** (planner). Drafted from
`~/projects/aalto-ai-dm-assistant-webinar/lecture-framing.md` — **Pedro must OK
this outline before slide bodies are written.** Titles marked `TODO: claim` in
`sections/*.typ` are provisional topic labels; replace them with the claims below.

## 1. The four lines

- **Ask** — researchers leave able to *start a guided RDM conversation with the
  assistant this week*, produce APL-ready notes, and know which tool to trust
  for what (and what never goes in the chat).
- **Room** — Aalto researchers, mixed APL users and non-users, online webinar.
  They know DMPs are required; most believe a DMP is a form you fill at the end
  (what we contradict: it's a plan you have a conversation about).
- **Slot** — 90 min total = **60 min lecture + 30 min Q&A**. 20 of the 60 are
  live demos (deck paused), so the content-slide budget is ≈ **18–22 slides**,
  not the 25–35 a 60-min slot would normally allow.
- **One sentence** — *A guided conversation about your research data: plan RDM
  with an AI assistant, and let APL be where the plan officially lives.*

## 2. Claims, in speaking order

The titles-only test: read this list back — it must be an argument.

1. Your DMP problem isn't writing — it's that the plan happens too late,
   alone, and in "funder language".
2. The assistant is a coach, not a writer; APL is the system of record;
   you stay in control. *(positioning slide, segment 1)*
3. It's a prompt plus a few files — transparent and updatable, not a black-box
   product. *(segment 2)*
4. It does four things: structured intake → guidance → APL-ready notes →
   routing sensitive topics to humans. *(segment 2)*
5. It deliberately does NOT write final DMPs, give legal advice, or replace
   the Privacy Office. *(segment 2)*
6. Two tools, one workflow: think with ChatGPT + the master prompt, verify
   current Aalto facts with the aalto.fi chatbot. *(segment 3)*
7. **Demo 1: the assistant asks *you* the questions** — intake, follow-ups,
   and a personal-data moment routed to an Aalto service. *(segment 4, live)*
8. Good users iterate: have funder/phase/data types/role ready, push back,
   ask in your own language (FI/SV/EN). *(segment 5)*
9. **Demo 2: from chat to APL** — draft notes map 1:1 to APL fields; a human
   reviews everything before it enters the record. *(segment 6, live)*
10. What you put in APL stays on record — project folders are kept 10 years
    from project start. *(fact slide, segment 6)*
11. Never paste what you wouldn't publish: no actual personal data, no
    confidential/unpublished research data. *(segment 7)*
12. No internet means verify: stale facts and hallucinations are caught by
    routing + the aalto.fi chatbot + Aalto services. *(segment 7)*
13. Take the three things home and try it this week — prompt, APL, links.
    *(segment 8 → the ask)*

## 3. Per-slide plan

To be finalised with Pedro after the outline is approved (slide budget above;
≤ 6 bullets ≤ 2 lines each · one hero figure per slide · numbers that are the
point get their own `#focus-slide`).

| # | segment | title (claim) | evidence | figure | reveal / note |
|---|---|---|---|---|---|
| 1 | — | title slide | | | |
| 2 | 1 | DMP problem | | | opening poll |
| 3 | 1 | coach / record / control | positioning | maybe diagram | |
| 4–6 | 2 | prompt+files · 4 jobs · NOT | | | |
| 7 | 3 | two tools table | comparison | table | |
| 8 | 4 | demo 1 frame | live chat | | `#speaker-note` from demo-script.md; play recording if live fails |
| 9–10 | 5 | good user · anti-patterns | | loop diagram? | |
| 11–13 | 6 | APL intro · demo 2 · 10-year fact | apl-shots/ | screenshots | |
| 14–15 | 7 | never paste · verify | | | |
| 16 | 8 | three takeaways | | | |
| 17 | 8 | links + QR | | QR figure | |
| 18 | — | thanks (Kiitos!) | | | |
| 19+ | — | back-pocket Q&A **after** thanks | qa-preparation.md | | |

## 4. Logistics → `main.typ` (drafted in scaffold — confirm)

- date / venue: **Thu 5 Nov 2026, 13:00–14:30, online webinar** — no projector.
  Scaffold sets `density: "default"`, accent `aalto-blue` (university-level,
  not one school). *Note:* `"roomy"` was tried and overflows the two-line title
  slide onto a second page — choose roomy only if the title is shortened.
- logomark: default A" (`quote`); logo language EN/trilingual as template —
  Pedro's call.
- contact lines for the Kiitos slide: **TODO in main.typ** (name/email + link).
- questions you expect → back-pocket slides after `#thanks-slide`:
  training data / privacy, funders not covered, mid-project use, language
  support, "is the output binding?" (see `qa-preparation.md`).

## 5. Before you present (`docs/making-a-talk.md` §13)

- [ ] **deck FINAL by Thu 29 Oct** (task TASK-015 due date — one week before)
- [ ] titles alone read as an argument
- [ ] squint / 25 %-zoom test passed (render to PNG)
- [ ] figures labelled, sources cited (APL screenshots: slides/apl-shots/)
- [ ] `#pause` matches what you actually say
- [ ] **both demos recorded as backup video** (live AI demos fail)
- [ ] poll + master-prompt distribution (chat/QR) ready
- [ ] full dry run 4 Nov
- [ ] rehearsed aloud once, with a timer
- [ ] PDF exported and named `talk-2026-11-05.pdf`, in the outbox
