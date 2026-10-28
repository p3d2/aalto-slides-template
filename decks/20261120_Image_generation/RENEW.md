# Renewing this deck next year (target: 30 minutes, no slide surgery)

The deck is split so that **what ages lives in one file**.

| layer | file | ages? |
|---|---|---|
| the six capabilities, the problems they solve, what to watch out for | `catalogue.typ` → `capabilities` | **no** — this is the introduction |
| model names, makers, where Aalto gets them, which one is now legacy | `catalogue.typ` → `tools` | **yes** — this is the whole perishable surface |
| the verification date printed on the slides ("as of November 2026") | `catalogue.typ` → `VERIFIED` | **yes** |
| example images (each one is a model's output) | `figures/` | **yes**, but only the ones you re-run |
| layout, sizing, cards, tables | `kit/deckkit.typ` | no |
| brand | `theme/aalto.typ` | no |

## The ritual

1. **Open `catalogue.typ`.** For each entry in `tools`: still called that? still
   available at Aalto? Update `name`, `where`, `does`, and set `checked:` to the
   date you verified it. A model that has been superseded gets `legacy: true` —
   it disappears from the live tables and stays available for the history/backup
   slide. A genuinely new tool is one new dict.
2. **Set `VERIFIED = "November 2027"`.** Every slide that names a product reads
   that string, so the deck re-dates itself. Nothing else needs touching.
3. **Re-run the examples you care about** (the ones where the *result* is the
   argument, not just the illustration): the rig photo → schematic, the bench
   clean-up, the day → night, the Blender script. Save each output over the same
   name in `figures/` — the slides reference names, not files, so they update
   themselves. Then:
   `python3 kit/scan-figures.py decks/20261120_Image_generation`
   (vector beats raster automatically, so a `.pdf` export of the same figure
   replaces the `.png` with no edit.)
4. **Re-shoot the two UI screenshots** (`ui-*`, `aalto-*`) — these are the slides
   that look oldest fastest. If a screenshot is gone for a while, delete it and
   the slide renders a labelled placeholder instead of breaking the build.
5. **`./slides deck 20261120_Image_generation`.** If a capability has no live
   tools left, its row prints nothing in the third column — that is a signal to
   edit `tools: (…)`, not the slide.

## What deliberately does *not* need re-updating

- The mechanism slide ("it draws, it does not search"). Diffusion vs
  autoregressive is a footnote; the claim that survives every model generation is
  that it produces what pictures of this kind usually look like, which is exactly
  why it invents labels. That is the sentence the ethics act rests on.
- The four failure modes (dense small text, invented labels, concept binding,
  non-Latin text). Re-check them once a year — if one stops being true, that is
  news worth putting on the slide, not a fix.
- The disclosure rules (Nature / Elsevier / ALLEA / Aalto). These change by
  policy, not by release; check them against aalto.fi each year and keep the
  date on the slide.

## If a capability itself changes

If something genuinely new appears (real-time video, 3D-native generation as a
consumer feature), add a row to `capabilities` — the map slide, the scenario
grouping and the closing rule all read from that list, so one entry propagates.
Keep the list at six or seven rows: it is a map, not a taxonomy.
