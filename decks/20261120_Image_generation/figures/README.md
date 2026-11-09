# figures/ — ported images + provenance

> **Slides never reference these files by path.** They use the *name* (the file
> stem) and `manifest.json` maps name → file. After adding, renaming or dropping
> in a better export: `python3 kit/scan-figures.py decks/NAME`. Vector beats
> raster automatically, and an unknown name renders a labelled placeholder
> instead of breaking the build. `manifest.json` is generated — do not edit.

Everything here (except the **Erodium passes**, see below) was extracted from
**`ppts/2026_04_28_AI_and_Research_Work.pptx`** — Enrico Glerean & Pedro Silva,
*AI in Research Work*, CC-BY, DOI
[10.5281/zenodo.14032261](https://doi.org/10.5281/zenodo.14032261) — section 4.1,
old slides 45–64. Nothing was re-drawn or exported through PowerPoint.

**Regenerate:** `python3 figures/src/extract-figures.py` (needs `ffmpeg`).
The script reads the pptx, renames to semantic kebab-case, and **downscales to a
1000 px long edge** — the originals are 1024–1920 px at 1–3 MB each (43 MB for
this section) while every figure is drawn at 2–4 in, and Typst embeds PNG/JPEG
untouched. After the script: **11.5 MB**. It only writes the files named in its
own `PLAN`; it never deletes anything else in this folder.

`png` = screenshots, line art, anything with text (lossless matters).
`jpg` = photographs and painterly generations. `svg` = vector, copied verbatim.

## What is here

| file | old | what it is |
|---|---|---|
| `human-drawing-ladder.png` | 47 | four microscopes: outline → sketch → shading → realistic |
| `diffusion-0-clean.jpg` … `diffusion-3-noise.jpg` | 48 | the denoising strip (cat in an anechoic chamber). **NB** `0-clean` is pptx `image42` and `3-noise` is `image41` — the old slide shows them right-to-left |
| `denoiser-glyph.png` | 48 | the little neural-network icon between frames |
| `lmarena-text-to-image.png` | 51 | Text-to-Image Arena leaderboard ⚠ April 2026 |
| `aalto-assistant-dalle3.png` | 45, 52 | Aalto AI Assistant, DALL-E 3 panel |
| `firefly-start.png`, `firefly-generate-panel.png` | 45, 52 | Adobe Firefly text-to-image UI |
| `prompt-pizza.jpg` | 53 | “hawaian pizza. no pinapple” |
| `prompt-huge-cat.jpg`, `prompt-enormous-cat.jpg` | 53 | one word changed |
| `flask-dalle3-flat.jpg`, `flask-dalle3-badge.jpg`, `flask-firefly.jpg`, `flask-firefly-vector.svg` | 55 | same prompt, different engines (last one = vector output) |
| `lego-webinar.jpg` | 56 | GPT-Image from 2 researcher photos + the Undergraduate Centre |
| `lab-before-cleanup.jpg`, `lab-after-cleanup.jpg` | 57 | high-fidelity removal of cables/bottles/chemicals |
| `otaniemi-day.jpg`, `otaniemi-night.jpg` | 58 | “reimagine the scene”, geometry preserved |
| `butterfly-source.jpg`, `butterfly-generated.jpg` | 59 | the LCE butterfly actuator among real ones |
| `rig-photo.jpg`, `rig-diagram-nanobanana.png` | 60, 64 | Pedro's experimental setup → schematic |
| `limit-dense-figure.png`, `limit-finland-map.jpg`, `limit-dog-horse.jpg`, `limit-thai-alphabet.png` | 61 | the four visible failures: dense small text, misspelled labels, concept binding, non-Latin text |
| `concept-rods-a.jpg`, `concept-rods-b.jpg` | 62 | DALL-E 3 concept runs (twisting rods + colour bar) |
| `rig-sketch-user.png`, `rig-drawing-ai.jpg`, `rig-illustration-final.svg` | 63 | sketch → AI concept → the figure redrawn in Inkscape (**vector**) |
| `blender-code.png`, `blender-render.png`, `blender-thumb.png` | 63, 64 | Blender scripting + viewport render |

## ⚠ Missing: the Erodium passes (yours, not from the pptx)

`erodium_lines.png`, `erodium_flat.png`, `erodium_shadows.png`,
`erodium_lights.png` (1600×2000, dated 29 Sep) were in this folder and were
**deleted by an agent glob (`rm figures/*.png`) on 2026-10-20** while the
extraction script was being re-run. No copy exists anywhere in WSL and there is
no git history in this project. Re-export from Blender / the Windows side and
drop them back here — `sections/06-workflows.typ` (last `==`) already references
them by those exact names.

## Not ported

| old media | why |
|---|---|
| `image39.svg`, `image55.svg`(icon), `image57.svg`, `image72.svg` (small ones) | decorative marks / the Aalto `A"` logo — we have the official logos in `assets/logo/` |
| `image46.png` | LMArena favicon-sized logo crop |
| `image36.png` | a third Firefly screenshot, duplicate of 37/48 |

## Conventions (as in `template/figures/README.md`)

- Reference **relative to the file that uses it**: `../figures/x.png` from
  `sections/*.typ`, `figures/x.png` from `main.typ`.
- `alt:` on every image. One hero figure per slide; a row of figures is for
  *comparison* and the title says what is compared (this deck is built on that).
- Every AI-generated image is labelled with the tool on the slide — the deck's
  own rule, and the point of claims 16 and 18.
