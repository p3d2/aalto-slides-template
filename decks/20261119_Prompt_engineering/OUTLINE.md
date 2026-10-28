# Talk outline — Prompt engineering & Gen AI in the academic workflow

**Port** of sections 2 and 3 of `ppts/2026_04_28_AI_and_Research_Work.pptx`
(Enrico Glerean & Pedro Silva, CC-BY, DOI 10.5281/zenodo.14032261) into the Aalto
Typst theme. Old slide numbers are kept next to every line below so the two decks
stay cross-checkable. **Pedro must OK this outline before slide bodies are written.**

Source inventory already done: text extracted from all 149 slides
(`.scratch/prompt-eng/text.txt`, `full26_35.txt`), images pulled out of the PPTX and
renamed into `figures/` (see `figures/README.md` for provenance + old slide numbers).

---

## 1. The four lines

- **Ask** — researchers leave able to *rewrite one prompt they wrote this week* and to
  name the workflow step where AI actually helps them, with the verification duty
  attached. Not: "understand LLMs".
- **Room** — Aalto researchers, most of them new to generative AI (the April deck's own
  disclaimer: *this is not a computer science course*). They believe prompting is a
  trick — magic wording, a secret syntax. We contradict that: prompting is the same
  skill as briefing a colleague well. Second belief we contradict: the model is the
  product; the interface (history, model picker, system prompt) is half the skill.
- **Slot** — **TODO (Pedro)**: ______ min → content-slide budget ≈ slot ÷ 1.75.
  As ported: **16 content slides + 2 section slides** → ≈ 28–32 min of talking.
  If the slot is ~20 min, cut the example set (see §5 Q2), not the font size.
- **One sentence** — *Ask the way you would brief a colleague: be clear, give the
  context, say what shape the answer should take, iterate — and never paste in what
  you cannot verify or would not send to a cloud.*

---

## 2. Claims, in speaking order

The titles-only test: read this list back — it must be an argument.
Right-hand column = the old slide this comes from. `==` titles in `sections/*.typ`
follow these; the original topic labels are kept as comments in the files.

### Part A — Prompt engineering (old 18–22)

`= Prompt engineering` (section slide, old 19)

1. **A prompt is a question with the context baked in** — same words, four different
   answers. *(old 20 "The art of asking": "What is love?" → sociology / chemistry /
   business / music. Four ported icons.)*
2. **A vague prompt gets a vague answer: be clear, give context, say what you want.**
   *(old 21, principles I — clear and concise · contextual · instructive, each with the
   prompt/improved-prompt pair verbatim)*
3. **Prompting is iterative: split the task, give it a role, set the tone and format.**
   *(old 22, principles II — iterative · roleplay · tone and format + the CLEAR
   reference and OpenAI prompt-engineering guide links)*
   → the definition from old 18/19 becomes a one-line pull-quote on the section slide
   or a `#focus-slide`: *"constructing queries or inputs … so as to elicit the most
   precise, coherent, and pertinent responses."*

### Part B — Generative AI in the academic workflow (old 23–38, 40–41)

`= Generative AI in the academic workflow` (section slide, old 24)

4. **Every phase of the research process has an AI use — and responsible conduct sits
   in the middle of it.** *(old 25; the RDMkit lifecycle wheel is ported as a vector
   SVG. **Redesign proposed**: wheel left, seven phase → use-case lines right, instead
   of labels floating around the ring — see §5 Q9.)*
5. **When the answer is wrong, fix the prompt — not the model.** *(old 26, Ex 1
   "prompt a prompt": Google Scholar search string, two rounds. The best single
   example in the set: it shows iteration and a usable result.)*
6. **It turns prose into documentation.** *(old 27, Ex 2: instrument-manual paragraph →
   markdown README for a DMA experiment. Pedro's own CHEM example.)*
7. **It writes the code you would otherwise look up — you still check it.**
   *(old 28, Ex 3 LAMMPS WCA potential; code block ported as real `raw`.)*
8. **One question, two tools: name the language or software you are in.**
   *(**merge** old 31 + 32, Ex 6 Python vs Ex 7 Excel — identical quartile prompt,
   side by side. Saves a slide and makes the point better than either alone.)*
9. **It is a brainstorming partner for methods, not an oracle.** *(old 30, Ex 5:
   moving-average edge effects → six alternative smoothers + the cross-validation
   caveat.)*
10. **Ask for the critique, not the rewrite.** *(old 34, Ex 9: "don't ask for the fish,
    ask to be taught how to fish" + the "written by AI alert!" example sentence and the
    pointing-man image. The integrity hinge of the whole part.)*
11. **Name the audience, the tone and the format.** *(old 35, Ex 10: abstract →
    Instagram post with hashtags. Fun, and it lands the format-setting point.)*
12. *(backup)* **Simulation scripts in one go.** *(old 29, Ex 4: R Monte Carlo GBM —
    keep the plot (`figures/example-montecarlo-gbm.png`) but move to backup: finance
    example, long code, weakest fit for this room.)*
13. *(backup)* **Batch automation you can paste into a terminal.** *(old 33, Ex 8:
    ffmpeg thumbnails; the strip of outputs is a nice image but the command is noise
    for most of the room.)*
14. **Half the skill is the interface: prompt box, history, model, system prompt.**
    *(old 36 + 37, duck.ai window. Screenshots are April-dated → re-shoot, §5 Q4.)*
15. **A system prompt sets the rules once instead of repeating them.**
    *(old 38, the four-row system-prompt table — dino / Ronny Chieng / careful
    assistant / succinct. Keep verbatim, it is the funniest slide in the deck.)*
16. **At Aalto there is a chatbot with a data-classification label — use it before
    you use the others.** *(old 40 Aalto AI Assistant screenshots + old 41 Aalto Prompt
    Book. Add the Public / Internal / Confidential line visible in the screenshot.)*
17. **The closing rule** *(optional borrow from old 144, currently in the ethics
    section — §5 Q6)*: *if you cannot verify the output, it stays in self-learning and
    brainstorming.*

---

## 3. Per-slide plan

| # | new slide | old | figure / evidence | reveal |
|---|---|---|---|---|
| 1 | title | 1 | tertiary trilingual logo lock-up | — |
| 2 | `= Prompt engineering` | 19 | definition pull-quote | — |
| 3 | context baked in | 20 | `asking-{sociology,chemistry,business,music}.png` | `#pause` per discipline |
| 4 | clear · contextual · instructive | 21 | 3 prompt/improved pairs (text) | `#pause` per principle |
| 5 | iterative · role · tone | 22 | 3 pairs + `#credit-line` refs | `#pause` per principle |
| 6 | `= Gen AI in the academic workflow` | 24 | — | — |
| 7 | every phase has a use | 25 | `rdm-lifecycle-wheel.svg` + 7 phase lines | `#pause` per 2–3 phases |
| 8 | fix the prompt | 26 | 2-round chat cards | `#pause` for round 2 |
| 9 | prose → documentation | 27 | prompt + markdown answer (`raw`) | — |
| 10 | code you'd look up | 28 | prompt + WCA answer + `pair_style` block | `#pause` for code |
| 11 | one question, two tools | 31+32 | two answer cards side by side (`two-col`) | — |
| 12 | brainstorming partner | 30 | prompt + 6-method list | `focus-step` per method |
| 13 | critique not rewrite | 34 | prompt + critique + "tawny awns" alert + `example-written-by-ai.png` | `#pause` |
| 14 | audience · tone · format | 35 | prompt + influencer answer (trimmed) | pills |
| 15 | the interface | 36+37 | `ui-duckai-window.png`, `ui-duckai-customize.png` (TODO re-shoot) | `#pause` per label |
| 16 | system prompt once | 38 | 4-row table | `#pause` per row |
| 17 | the Aalto one | 40+41 | `ui-aalto-assistant-*.png`, `aalto-prompt-book.png` (TODO re-shoot) | — |
| 18 | Kiitos / references | 149 | — | — |
| b1 | R Monte Carlo (backup) | 29 | `example-montecarlo-gbm.png` | after thanks |
| b2 | ffmpeg thumbnails (backup) | 33 | `example-ffmpeg-thumbnails.png` | after thanks |

Old 18/23 (image-only dividers), 19/24 (section slides), 39 (break) and the
decorative AI cartoons (old 18/23 art, old 22 art) are **not** ported as separate
slides — the theme has its own section slides. `figures/README.md` lists what was
left out and why.

---

## 4. Logistics → `main.typ` (draft values, TODO = needs Pedro)

- date: **19 Nov 2026** (from the folder name — confirm)
- title: **TODO** — proposed `[Prompt engineering and generative AI in the academic
  workflow]`, subtitle `[AI in research work · part 2 of 2]`? Old series title:
  "AI in Research Work — prompt engineering and advanced uses of generative AI for
  researchers".
- author: **TODO** — Enrico Glerean & Pedro Silva (co-presented?) or Pedro only
- institution: Aalto University · accent: `aalto-blue` (university-level training,
  not one school) — **TODO** confirm; if it's a CHEM/SCI session use
  `school-colours.chem` / `.sci`
- density: `default` (20 pt) — `roomy` if a big lecture hall, but the title then
  overflows (known theme limit) → shorten the title first
- mark: `question` (A?) — the old deck's own joke; **TODO** preference
- language: EN (logo `aalto-black-quote.pdf`, trilingual lock-up on the title slide)
- contact lines for the Kiitos slide: **TODO** (old footer: Enrico Glerean & Pedro
  Silva (2026), DOI: 10.5281/zenodo.14032261, CC-BY)
- attribution: keep the CC-BY DOI line — on the title slide and as `#credit-line`
  on slides that carry ported figures/screenshots

---

## 5. Open questions before I write bodies

1. **Slot & split.** How many minutes on 19 Nov, and is this the whole session or two
   sections inside a longer workshop with Enrico? Who presents which half? (Decides
   whether 16 content slides fit.)
2. **All 10 examples?** Proposal above: merge Ex 6+7 into one comparison slide, move
   Ex 4 (R finance) and Ex 8 (ffmpeg) to backup → 8 example slides instead of 10.
3. **Titles.** The originals are topic labels ("General principles of good prompts
   (I)"). OK to replace them with the claims in §2? (The template's rule is titles =
   claims; the old wording stays in the file comments.)
4. **Stale screenshots.** The duck.ai and Aalto AI Assistant captures are from April
   2026 (the model dropdown still shows GPT-4o / GPT-5 / DALL-E 3). Re-shoot before the
   talk — I put `TODO re-shoot` on those slides; the ported ones keep the layout.
5. **Post-break material.** Old 36–38 + 40–41 sit after the coffee break in the April
   deck. Port them here (my assumption) or keep them for the "advanced" session?
6. **Where does the warning go?** The April deck's "never paste what you cannot
   verify / data classification" material lives in section 6 (ethics). This port needs
   at least one line of it (old 144 quote, or the Aalto data-classification label).
   Add it here, or leave it to Enrico's part?
7. **Recap slide?** Old section 1 (what is AI / an LLM, next-token guessing) is not
   ported. If the Nov audience hasn't had it, one backup slide "what the model is
   actually doing" would be cheap insurance.
8. **Language of the closing slide** — `Kiitos!` (theme default) or `Thank you!`?

---

## 6. Before you present (`docs/making-a-talk.md` §13)

- [ ] titles alone read as an argument
- [ ] squint / 25 %-zoom test passed (render pages to PNG and look)
- [ ] every ported figure credited (RDMkit wheel, CC-BY DOI line)
- [ ] `#pause` matches what is actually said
- [ ] stale screenshots re-shot or replaced with placeholders
- [ ] rehearsed aloud with a timer
- [ ] PDF named `talk-2026-11-19.pdf`

---

## 7. How to tweak this deck (the whole point of `kit/deckkit.typ`)

The section files are **data**: one call per slide, no layout code. Layout,
sizing and the figure registry live in `kit/deckkit.typ` (shared with the other
deck) — so a change that should affect every slide is made once.

| you want to | do this |
|---|---|
| change a title | edit the `==` line |
| swap a picture | replace the file in `figures/`, re-run `python3 kit/scan-figures.py decks/NAME` |
| use a PDF/vector export instead of the PNG | drop it in `figures/` with the **same stem** and re-scan — vector wins automatically |
| add a figure you do not have yet | write `fig("my-name")` into the slide; it renders a placeholder naming the file to create |
| cut a slide | delete the call (or move it to `sections/03-backup.typ`, which sits after the Kiitos slide) |
| reorder | move the call |
| bigger/smaller figures everywhere | one knob: `k: (fig-h: 4in)` in `figs.typ` |
| reveal results on a click | `k: (reveal: true)` for the deck, or `reveal: true` on one call |
| hide every credit line (rehearsal) | `k: (show-source: false)` |
| tune one slide | `h: 2.4in` on that call — it overrides the auto-fit |

Two rules the builders cannot enforce for you:

- **Keep credit lines short** (≈ 50 characters). They share the baseline with the
  corner logo and the page number, so a long one collides with them. Put the
  sentence in `note:` instead.
- **Pass prompts as strings, not markup** (`prompt: "…"`). The auto-fit counts
  characters to size the figure row, and a prompt full of `*`, `#`, `+` or `–`
  cannot then re-flow the slide by accident.

Build: `./slides deck NAME` · watch: `./slides watch-deck NAME`.
