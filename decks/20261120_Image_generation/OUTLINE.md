# Talk outline — Image generation with AI (20 Nov 2026)

**Port** of section 4.1 of `ppts/2026_04_28_AI_and_Research_Work.pptx` (old slides
45–64; Enrico Glerean & Pedro Silva, CC-BY, DOI 10.5281/zenodo.14032261).
Companion to `../20261119_Prompt_engineering` (the same series, parts 2–3).
Old slide numbers are on every line below. **Pedro must OK this before bodies.**

Done already: text + geometry of old 45–64 extracted
(`.scratch/prompt-eng/text.txt`, `.scratch/imggen/old-slides.typ` = a faithful
reconstruction of each old slide from its own images), 38 figures extracted and
resized by `figures/src/extract-figures.py`, layout helpers validated in
`.scratch/imggen/sample2-2.png` (the diffusion ladder) and `sample2-3.png`
(before → after pair). Skeleton builds: **23 pages, 0 warnings, 0.14 MB**.

---

## 0. ⚠ First: the four Erodium renders are missing

`figures/` contained `erodium_lines.png`, `erodium_flat.png`,
`erodium_shadows.png`, `erodium_lights.png` (1600×2000, dated 29 Sep) when you
created the folder. While re-running the extraction script I deleted them with a
`rm figures/*.png` glob — **my mistake, they are not recoverable from WSL**: I
searched the whole home tree (no other copy, no Blender `.blend`/`.py`, no
Trash). They were never in git (this project has no repo).

Recoverable by you from: Blender (re-export the four passes) or wherever they
came from on the Windows side. I have left the slide that uses them
(`06-workflows.typ`, last `==`) as a stub naming all four files, and the
`figures/src/extract-figures.py` plan does **not** touch them, so dropping the
PNGs back into `figures/` restores the slide. From now on the script only writes
the files in its own plan list, and I will not glob-delete in `figures/`.

They look like the perfect ending to the talk: the "outline → flat → shadows →
lights" ladder is the same idea the opening slide uses for a human drawing — so
the deck can close on your own render instead of Enrico's Blender screenshot.
Proposed below as claim 20.

---

## 1. The four lines

- **Ask** — researchers leave able to (a) prompt an image model with *style
  words* instead of adjectives, (b) tell which of the three workflows fits their
  task, and (c) know that an AI image in a paper figure is a disclosure problem,
  not a shortcut.
- **Room** — same audience as 19 Nov (Aalto researchers, mostly new to gen AI).
  They believe an image model *searches and collages* existing pictures, and that
  "AI figure" = "fake data". We contradict both: it denoises (nothing is copied),
  and the honest use is concept → your own redraw.
- **Slot** — **TODO (Pedro)**: ______ min. As ported: **20 content slides** ≈
  35–40 min of talking, which is a full session on its own. If the slot is
  shorter, the cut list is §5 Q2.
- **One sentence** — *Image models make drafts, not figures: use them for the
  concept and the edit, redraw what you publish, and say what you used.*

---

## 2. Claims, in speaking order

`= Image generation` (section slide, old 46)

**How it works (old 47–49)**
1. A human draws in steps — outline, detail, shading — and that is the ladder a
   model learns. *(old 47, `human-drawing-ladder.png`)*
2. It does not collage pictures — it removes noise, step by step. *(old 48,
   four-frame diffusion strip; **validated layout**)*
3. Two families under the hood — and one of them is the model you already use for
   text. *(old 49; sets up why GPT-Image edits so well; videos in credit line)*

**What to use (old 50–52, 45)**
4. The tools differ by what you can control, not by how pretty the output is.
   *(old 50 six-row table → compact Typst table)*
5. "Best" is a snapshot — that leaderboard was stale in April. *(old 51,
   LMArena screenshot; ⚠ re-shoot)*
6. At Aalto you already have two: the AI Assistant and Adobe Firefly.
   *(old 45 + 52 merged — the same two UIs appear twice in the original)*

**Prompting for images (old 53–54)**
7. Say what you want, not how you feel about it. *(old 53: weak poppy prompt vs
   six-word one; huge vs enormous cat; the pizza joke; the 7 parameter words)*
8. A style word does more work than an adjective. *(old 54 keyword table, cut to
   the columns a researcher uses)*

**What it can do to your own images (old 55–60)**
9. Same prompt, three engines, three different figures. *(old 55 flasks)*
10. The newer trick is reading the pictures you attach. *(old 56 Lego webinar)*
11. The newer trick is editing a photo you already have. *(old 57 lab cleanup;
    **validated layout**)*
12. Reimagine the scene and it keeps the geometry. *(old 58 Otaniemi by night)*
13. Put your own result in a context — and say so. *(old 59 butterfly actuator)*
14. From a photo of your rig to a schematic. *(old 60, Pedro's setup)*

**Where it fails (old 61)**
15. Seven ways it fails — four of them are fatal in a figure. *(old 61 + the four
    limitation images)*
16. In a publication, an AI image is a claim you have to justify. *(borrowed from
    old 142 — OUTLINE §5 Q3)*

**Three workflows to take home (old 62–64 + new)**
17. Workflow I — use it for the concept, not for the figure. *(old 62 rods)*
18. Workflow II — AI-informed, hand-made, publishable. *(old 63 sketch →
    Inkscape → final SVG)*
19. Workflow III — ask for code, not pixels. *(old 64 Blender)*
20. **The same ladder, on my own subject: an Erodium awn in Blender.** *(new,
    Pedro's four passes — see §0)*

---

## 3. Per-slide plan

| # | new slide | old | figure / evidence | reveal |
|---|---|---|---|---|
| 1 | title | 1 | tertiary lock-up | — |
| 2 | `= Image generation` | 46 | — | — |
| 3 | the human ladder | 47 | `human-drawing-ladder.png` | `#pause` per stage |
| 4 | noise, step by step | 48 | `ladder(diffusion-0…3)` | `#pause` per frame |
| 5 | two families | 49 | text + `credit-line` (3 videos) | — |
| 6 | control, not prettiness | 50 | 6-row table | `#pause` per 2 rows |
| 7 | "best" is a snapshot | 51 | `lmarena-text-to-image.png` | date label |
| 8 | two at Aalto | 45+52 | `aalto-assistant-dalle3.png`, `firefly-start.png`, `firefly-generate-panel.png` | — |
| 9 | say what you want | 53 | `verdict()` pair + `prompt-huge-cat` vs `-enormous-cat` + `prompt-pizza` | `#pause` |
| 10 | style words | 54 | keyword table (cut) | one column highlighted |
| 11 | same prompt, three engines | 55 | `flask-*` ×3 (+ vector) | `#pause` |
| 12 | it reads your images | 56 | `lego-webinar.jpg` + prompt | — |
| 13 | editing a photo | 57 | `pair(lab-before → lab-after)` | `#pause` after |
| 14 | keep the geometry | 58 | `pair(otaniemi-day → -night)` | `#pause` |
| 15 | your result in context | 59 | `pair(butterfly-source → -generated)` | — |
| 16 | rig photo → schematic | 60 | `pair(rig-photo → rig-diagram-nanobanana)` | — |
| 17 | seven failures | 61 | `ladder(limit-*)` ×4 | `#pause` per image |
| 18 | publication rule | 142 (borrowed) | text / `focus-slide` | — |
| 19 | workflow I | 62 | `pair(concept-rods-a → -b)` | — |
| 20 | workflow II | 63 | `rig-sketch-user` · `rig-drawing-ai` · `rig-illustration-final.svg` | `#pause` |
| 21 | workflow III | 64 | `pair(blender-code → blender-render)` | — |
| 22 | my own ladder (Erodium) | new | `erodium_{lines,flat,shadows,lights}.png` ⚠ missing | `#pause` per pass |
| 23 | Kiitos / references | 149 | — | — |

---

## 4. Logistics → `main.typ` (draft values, TODO = needs Pedro)

- date: 20 Nov 2026 (from the folder name — confirm)
- title: `Image generation with AI` · subtitle `AI in research work · concepts,
  figures and 3D` — **TODO**
- author: Enrico Glerean · Pedro Santos Silva — **TODO** (who presents what?)
- accent: **`aalto-blue`** (series default, matches the 19 Nov deck). `aalto-yellow`
  was tried and does not work: the theme derives `#alert` (every `*bold*` word)
  and the title rule from the accent, so bold text came out olive-on-white and the
  rule nearly vanished. `aalto-red` is the other live option; a school colour if
  this is one school's session — **TODO**.
- density: `default`; `roomy` only with a shortened title (theme limit)
- mark: `question` (matches the 19 Nov deck — one series, one mark)
- language: EN; closing `Kiitos!` **TODO**
- attribution: CC-BY DOI line on the title/Kiitos slide + `#credit-line` on every
  slide carrying a ported figure (all of them are from the April deck)

---

## 5. Open questions before I write bodies

1. **The Erodium renders** (§0): can you re-export the four passes? And do you
   want them as the closing slide (my proposal) or as the *opening* example?
2. **Slot & cut list.** 20 content slides ≈ 35–40 min. If you have ~25 min, my
   proposed cuts: merge 6+7 (tools + arena), drop 10 (style words → fold into 9),
   drop 12 (Lego webinar — the funniest but least useful), and move 14 to backup.
3. **The publication rule** (claim 16) is borrowed from the ethics section of the
   April deck. Keep it here (I'd argue strongly for it — it is the question every
   researcher asks after seeing the flasks slide), or leave it to Enrico?
4. **Stale material**: LMArena screenshot (April 2026), the tool table, "Nano
   Banana" naming, and whether Aalto still has Firefly. Re-shoot / re-check?
5. **Slides 55 (three engines)**: old 55 has 4 images + 2 SVG icons and is
   crowded. Three-up (my plan) or DALL-E vs Firefly only, with the vector output
   as the punchline?
6. **Do you want the "how it works" part at all?** Old 47–49 is 3 slides of
   mechanism; the audience for an image session may want to get to their own
   figures faster. Cutting it saves 5 min and makes the deck 17 slides.
7. **Hands-on?** The April session had none. One 5-minute exercise ("prompt your
   own rig photo, compare with a neighbour") would fit right after claim 14 and
   is the only way most of this sticks.
8. **Language of the closing slide**, and the contact lines.

---

## 6. Before you present (`docs/making-a-talk.md` §13)

- [ ] titles alone read as an argument
- [ ] squint / 25 %-zoom test (this deck is image-heavy: check every figure at
      arm's length — the limitation slides depend on *reading* broken text)
- [ ] every ported figure credited (CC-BY DOI + RDMkit-style source lines)
- [ ] `#pause` matches what is said (before/after slides need it: reveal the
      result only after the prompt is read)
- [ ] AI-generated images labelled as such on the slide (the deck's own rule)
- [ ] Erodium passes restored
- [ ] rehearsed aloud with a timer
- [ ] PDF named `talk-2026-11-20.pdf`

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
