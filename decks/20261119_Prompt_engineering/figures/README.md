# figures/ — ported images + provenance

> **Slides never reference these files by path.** They use the *name* (the file
> stem) and `manifest.json` maps name → file. After adding, renaming or dropping
> in a better export: `python3 kit/scan-figures.py decks/NAME`. Vector beats
> raster automatically, and an unknown name renders a labelled placeholder
> instead of breaking the build. `manifest.json` is generated — do not edit.

Every file here was extracted from **`ppts/2026_04_28_AI_and_Research_Work.pptx`**
(Enrico Glerean & Pedro Silva, *AI in Research Work — prompt engineering and
advanced uses of generative AI for researchers*, CC-BY, DOI
[10.5281/zenodo.14032261](https://doi.org/10.5281/zenodo.14032261)) on 2026-10-19,
by reading the OOXML package (`ppt/media/`) — nothing was re-drawn or re-exported
through PowerPoint. Keep the CC-BY line on any slide that shows one of these.

| file | old media | old slide | what it is | status |
|---|---|---|---|---|
| `rdm-lifecycle-wheel.svg` | image8.svg | 5, 25, 124 | RDMkit (ELIXIR) “The data lifecycle” ring, **vector** — renders crisply in Typst | used (slide “Every phase…”) |
| `asking-sociology.png` | image15 | 20 | icon: two people, heart + book/culture speech bubbles | used (“art of asking”) |
| `asking-chemistry.png` | image16 | 20 | icon: brain + molecule network (dopamine) | used |
| `asking-business.png` | image17 | 20 | icon: person hugging a phone, heart (brand love) | used |
| `asking-music.png` | image18 | 20 | icon: broken heart + disco ball + microphone | used |
| `example-montecarlo-gbm.png` | image22 | 29 | the actual R output: 1000 GBM paths | backup slide |
| `example-ffmpeg-thumbnails.png` | image24 | 33 | the actual ffmpeg thumbnail strip (2970×570) | backup slide |
| `example-written-by-ai.png` | image25 | 34 | anime panel pointing at you — “written by AI alert!” | used |
| `ui-duckai-window.png` | image26 | 36 | duck.ai chat window (prompt box, history, model) | used · **re-shoot** |
| `ui-duckai-customize.png` | image27 | 37 | duck.ai “Customize responses” = the system-prompt panel | used · **re-shoot** |
| `ui-duckai-model.png` | image28 | 37 | crop: model selector | maybe drop |
| `ui-aalto-assistant-sidebar.png` | image31 | 40 | Aalto AI Assistant sidebar / history | used · **re-shoot** |
| `ui-aalto-assistant-models.png` | image32 | 40 | model dropdown — still lists GPT-4o / GPT-5 / DALL-E 3 + “Data classification: Public, Internal, Confidential” | used · **re-shoot (April 2026)** |
| `ui-aalto-assistant-parameters.png` | image33 | 40 | parameters panel (temperature, system prompt, max tokens) | used · **re-shoot** |
| `aalto-prompt-book.png` | image34 | 41 | Aalto Prompt Book (“Suggest your prompts”) | used · check URL |

## Deliberately NOT ported

| old media | old slide | why |
|---|---|---|
| image14.png, image20.png | 18, 23 | AI-cartoon divider art (2.1–2.2 MB each): the theme has its own section slides |
| image19.png | 22 | decorative art behind a text box (2.3 MB) |
| image21.svg, image23.svg | many | 0.5 in placeholder/person icons, no meaning |
| image29–30, 35.png | 40, 41 | tiny crops of the same screenshots (buttons, top bars) |

Re-extract any of them with:
`python3 -c "import zipfile;zipfile.ZipFile('ppts/2026_04_28_AI_and_Research_Work.pptx').extract('ppt/media/imageNN.png','out')"`

## Conventions (unchanged from `template/figures/README.md`)

- Reference **relative to the file that uses it**: `../figures/x.svg` from
  `sections/*.typ`, `figures/x.svg` from `main.typ`.
- Vector first (the wheel is SVG — keep it). PNG only for screenshots/outputs.
- `alt:` on every image. One hero figure per slide.
- Screenshots are the *exception* to “never screenshot a plot”: these show a
  product UI, which is the point of the slide. The R and ffmpeg outputs are real
  figures, not screenshots, and their generating code is quoted on the slide.
- **Stale by design**: the UI captures are April 2026. Re-shoot before 19 Nov
  (OUTLINE.md §5 Q4) — the model list in `ui-aalto-assistant-models.png` is the
  one that will look oldest.
