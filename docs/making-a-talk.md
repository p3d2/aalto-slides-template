# Making a talk: how to build a presentation from scratch

The tool is in [using-the-template.md](using-the-template.md). This file is about
the other half — deciding what goes on the slides, and in what order. It is
opinionated on purpose; the opinions are the ones a slide template can actually
enforce.

---

## 1. Before you open an editor

Write these four lines in a text file (or on paper). Everything later is derived
from them, and if you cannot fill them in, the talk is not ready to be built:

1. **The ask** — what should this audience *do, decide or believe* when I stop
   talking? ("Fund the follow-up", "let them run their data through this
   pipeline", "understand why the interface fails at 700 °C".)
2. **The room** — who is there, what do they already know, what do they believe
   that I am going to contradict?
3. **The slot** — minutes, including or excluding questions. This is a hard
   budget, not an ambition.
4. **The one sentence** — the whole talk in a single sentence that a first-year
   could repeat afterwards. If it is long, the talk is long.

Then stop. Do not open the deck yet.

---

## 2. Story first, slides last

Outline the talk as a numbered list of *claims*, one line each, in the order you
will make them. Only then decide which claims need a slide.

A research talk has a shape that is worth stealing rather than reinventing:

| # | beat | job |
|---|---|---|
| 1 | the problem, in their terms | why anyone should spend 20 minutes |
| 2 | what is missing / what everyone assumes | the gap you are filling |
| 3 | your claim (say it out loud, early) | the one sentence from §1 |
| 4 | how you know — method, in one slide | credibility, not a methods course |
| 5 | evidence — one slide per finding | the body of the talk |
| 6 | what it does **not** show | limits, stated before someone else does |
| 7 | the ask | what happens next, and who you need to make it happen |

**The titles-only test.** After you have built the deck, read *only* the slide
titles in sequence. It should be a coherent argument that makes sense to someone
who never saw the bodies. If it reads as a list of topics — "Introduction",
"Methods", "Results", "Setup", "Sample prep" — you have written a table of
contents, not a talk. Fix the titles, not the slides.

---

## 3. Spend the time you were given

Roughly **1.5–2 minutes per content slide** when you are explaining evidence,
plus 1–2 minutes per section break, plus the Q&A you asked for:

| slot | content slides | notes |
|---|---|---|
| 10 min (pitch, demo) | 5–7 | one hero figure, one claim slide, one ask |
| 20 min | 10–13 | the usual seminar length |
| 45 min | 20–25 | insert a question or a demo every ~10 min |
| 60–90 min | 25–35 | beyond ~35 slides, cut content, not font size |

Count slides early (`./slides deck x` prints nothing, but the footer says
`n / N`). Being 40 slides into a 20-minute slot is a design failure, not a
speaking failure.

---

## 4. One slide, one claim — and the claim is the title

The title is the loudest position in the room. Do not waste it labelling the
slide:

| instead of | write |
|---|---|
| Results | The coating cracks above 700 °C |
| Setup | Two ramps, three batches, one sensor |
| Literature | Nobody has measured the interface directly |
| Method | XPS depth profiling, 5 nm resolution |

The body then *supports* the title: the figure, two or three numbers, one
sentence of interpretation. If a slide needs two claims, it is two slides. If a
slide needs a paragraph, the paragraph belongs in a handout or in the appendix.

---

## 5. How much to put on a slide

Rules of thumb that keep working:

- **≤ 6 bullets, ≤ 2 lines each.** A 7th bullet means the slide has two jobs.
- **≤ 3 type sizes on a slide** (Aalto's own rule, and the theme's defaults
  already obey it). Never set a size by hand to squeeze something in.
- **If the audience can read it faster than you can say it, they will** — so
  either remove it, or reveal it with `#pause`.
- **Numbers get their own slide** when the number is the point. `#focus-slide[40 %
  less delamination.]` beats a bullet that mentions 40 %.
- Choose `density:` for the room, not for your comfort: `roomy` for a lecture
  hall or a bad projector, `default` for a seminar, `compact` for a methods
  audience that came for detail. `dense` is for handouts, not screens.

The uncomfortable test: **squint at the slide until it is blurry.** Whatever you
can still read is what the back row sees.

---

## 6. Figures

- **One hero figure per slide.** Two figures side by side is for *comparison*,
  and the slide title must say what is being compared.
- **Redraw for the room.** A figure exported for a paper (6 pt labels, journal
  column width) is unreadable on a screen. Make a slide version: bigger type,
  fewer gridlines, one accent colour, no legend box if you can label directly.
- **Never screenshot a plot.** Keep the file (SVG/PDF/PNG) and reference it —
  that is the whole point of a text deck: fix the figure, rebuild, done.
- **While the figure does not exist**, use `#figure-placeholder[label, ratio]`
  so the layout is final and the hole is visible to you and your collaborators.
- **Colour carries meaning, not decoration.** Aalto's brand colours are made for
  black text on top; on plots, keep one accent + greys. Check the palette and
  data-visualisation guidance at brand.aalto.fi (Visual guidelines → Data
  visualisation).
- Label axes and units *on the figure*, and say the axes out loud once — "time
  across, strain down" is not filler, it is how other people read your plot.

---

## 7. Controlling attention

Slides are a spotlight, not a document. Use the reveals deliberately:

- `#pause` — one advance per thing you say. If you never click, nothing should
  be hidden; if you click three times on one bullet, split the bullet.
- `#gray-out[...]` — retire a point after discussing it, so the eye goes to what
  is live.
- `#gray-in[...]` — bring something in exactly when you name it.
- `focus-step` + `#alternatives` (see `demo/sections/03-dynamics.typ`) — dim the
  list, light the item you are on. Good for a three-part argument.
- Everything else — fly-ins, spins, sound — costs credibility in a research
  room. This template deliberately ships no animation theatre.

---

## 8. Evidence, sources, and what not to show

- **Cite on the slide**, small and grey at the bottom or as a footnote; a
  bibliography slide at the end for the full list. Unattributed figures are how
  you get asked "is that yours?" at the worst moment.
- **Label what is preliminary** ("n = 3", "pending QA", "simulation, not
  measurement"). Audiences forgive uncertainty; they do not forgive finding out
  later.
- **Unpublished results**: fine on slides, but never paste them into a web-based
  AI tool or a cloud service. This template works offline by design — keep using
  it that way for anything patentable or under embargo.
- **Data and code availability**: one line on the closing slide ("data:
  aaltodigital.aalto.fi/…", "code: github.com/…") costs nothing and is
  increasingly expected.

---

## 9. Accessibility and the room

- Brand colours take **black text** — that is why section slides are coloured
  with black type. White-on-blue fails Aalto's own contrast rule.
- Don't encode meaning in colour alone (add shape, dash, direct label) — about
  1 in 12 men is colour-blind, including people in your audience.
- Minimum text: after building, render the deck to PNG and look at one slide at
  ~25 % zoom on your laptop. If the axis labels vanish, so do they on the
  projector.
- Present from the **PDF**, not from a live build, and keep the file name stable
  (`talk-2026-11-05.pdf`) so you know which one you just mailed.
- Check the room if you can: beam-projector rooms wash out light colours and
  yellow especially — never put yellow text on white.
- Read the deck aloud once, with a timer. It always takes 20 % longer than you
  think, and you will hear the slide that has no reason to exist.

---

## 10. End the talk on purpose

- `#thanks-slide(word: [Kiitos!], contact: ("name · group", "email", "repo/orcid"))`
  — the slide stays up during Q&A, so treat it as your business card.
- **Back pocket slides**: 3–5 answer slides *after* the thank-you, for the
  questions you expect ("why not method X?", "how does it scale?", "what about
  batch 2?"). Say "I have a slide for that" and jump — it is the single highest
  return-on-effort improvement available to a technical talk.
- End with the ask, not with "thank you for your attention". The thank-you slide
  is the last thing on screen, not the last thing you say.

---

## 11. The loop

```bash
./slides new my-talk                      # 1. scaffold
# 2. write the four lines of §1, then the outline as `== ` titles only
./slides watch-deck my-talk               # 3. keep this running
# 4. fill each slide: claim title → evidence → figure (or placeholder)
# 5. cut: kill the slides that do not support the one sentence
# 6. reveals: add #pause where you speak in steps
# 7. titles-only test, squint test, timed read-aloud
# 8. ship the PDF; commit the sources
```

Step 2 is the one people skip and the one that decides the talk. Build the
skeleton of titles first — the deck compiles at any moment, so you can see the
argument as slides before you have written a sentence of body text.

---

## 12. Anti-patterns

| pattern | why it hurts |
|---|---|
| Reading the slides aloud | the audience reads faster than you speak |
| Topic titles ("Background", "Results") | wastes the loudest position on the slide |
| A paragraph where a sentence belongs | nobody reads it, everybody notices it |
| Paper figures pasted in | unreadable, and says "I reused this" |
| Six bullet lists in a row | no slide is the point; the talk becomes a wall |
| Animation for its own sake | costs time and credibility |
| 40 slides in a 20-minute slot | you will rush the evidence, which was the reason for being there |
| Apologies ("sorry, this is messy") | the room inherits your judgement of your own work |
| No ask | a talk that ends without a request is remembered as pleasant and nothing else |

---

## 13. Two checklists

**Before you build**
- [ ] the ask, the room, the slot, the one sentence are written down
- [ ] outline as a list of claims, in order
- [ ] slide count fits the slot (§3)
- [ ] every claim either supports the one sentence or is cut

**Before you present**
- [ ] titles-only test reads as an argument
- [ ] squint test / 25 %-zoom test passed
- [ ] figures labelled, units stated, sources cited
- [ ] `#pause` matches what you actually say
- [ ] preliminary data marked as preliminary
- [ ] 3–5 back-pocket slides after the thank-you
- [ ] rehearsed aloud once, with a timer
- [ ] PDF exported, named, on a stick *and* in your outbox
- [ ] clicker, adapter, and the first slide checked on the room's machine
