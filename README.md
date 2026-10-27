# Aalto slides template

A presentation template built on **Typst + Touying** that follows the
[Aalto University visual identity](https://brand.aalto.fi/). Plain-text
sources, millisecond builds, agent-friendly — and you can still hand-edit
everything.

**Start here** (written for humans, no Typst experience assumed):

- 📖 **[docs/using-the-template.md](docs/using-the-template.md)** — the tool:
  setup, the six lines of syntax you need, the eight things you will actually
  write, knobs, logos, presenting, troubleshooting.
- 🎤 **[docs/making-a-talk.md](docs/making-a-talk.md)** — the craft: how to build
  a presentation from scratch, what belongs on a slide, how much to show, and
  the checklists before you build and before you present.
- 🖨️ **[docs/cheatsheet.typ](docs/cheatsheet.typ)** — one printable A4 page with
  everything above on it: `./slides cheatsheet` → `docs/cheatsheet.pdf`.

This README is the reference; the demo deck (`./slides demo`) is the catalogue.

```
slides-template/
├── theme/aalto.typ        the Aalto theme (colours, Inter, slide layouts, helpers)
├── theme/tokens.typ       brand design tokens — generated, do not hand-edit
├── theme/logo-metrics.typ logo ink geometry — generated, do not hand-edit
├── fonts/Inter.ttf        the official Aalto typeface (OFL, bundled)
├── fonts/SourceCodePro.ttf the brand code face, variable (OFL, bundled)
├── assets/logo/           official logo originals + fetch/measure scripts (see its README)
├── demo/                  demo deck showing every feature → demo/demo.pdf
│   ├── main.typ           entry point (config-info + #include of sections)
│   ├── sections/          one file per talk section
│   └── figures/           external figures (SVG/PNG/…)
├── docs/                  guides for people + a printable one-page cheat sheet
├── template/              starter copied by `make new`: main.typ, a section,
│                          OUTLINE.md (the talk worksheet, filled first) and
│                          figures/README.md (figure conventions)
├── decks/                 your decks live here (decks/<name>/) — not published
├── reference/brand-aalto-fi/  offline mirror of the whole brand site (136 pages,
│                          design tokens, media) — local only, not published
└── Makefile               build / watch / new-deck helpers
```

## First clone

The repository ships the *code*, not the brand artwork: Aalto's logo PDFs/SVGs
are trademarked originals that the bundled scripts fetch from Aalto, and all
build outputs (`*.pdf`, `*.png`) are gitignored on purpose. So after a fresh
clone, regenerate the logos once before the first build:

```bash
python3 assets/logo/fetch-logos.py      # official Aalto lock-ups + marks (PDF)
python3 assets/logo/make-plain.py       # derive the text-free marks
python3 assets/logo/fetch-scicomp.py    # ASC hexagon SVGs
python3 assets/logo/measure-logos.py    # rewrite theme/logo-metrics.typ
./slides demo                           # → demo/demo.pdf
```

Everything else (fonts, theme, kit, docs, template) is in the repo. Requires
`typst >= 0.15` on PATH; Touying 0.8 is downloaded automatically on first
build. See `assets/logo/README.md` for what each script does and where the
originals come from.

## Quick start

```bash
./slides demo               # build the demo deck → demo/demo.pdf
./slides watch-demo         # rebuild on every save while you edit
./slides new my-talk        # scaffold decks/my-talk/ (deck + OUTLINE.md + figures/)
./slides deck my-talk       # build it → decks/my-talk/main.pdf
./slides watch-deck my-talk # rebuild a deck on every save
./slides cheatsheet         # printable one-page reference → docs/cheatsheet.pdf
```

A `Makefile` with the same targets (`make demo`, `make new NAME=my-talk`, …)
is included for environments that have `make`; the `./slides` script works
everywhere (it only needs `typst`). If the demo build fails with missing
logo files, run the [First clone](#first-clone) steps.

## Writing a deck

A deck is one `main.typ` plus one file per section:

```typst
#import "@preview/touying:0.8.0": *
#import "../../theme/aalto.typ": *

#show: aalto-theme.with(
  accent: aalto-blue,          // or school-colours.sci, aalto-red, …
  density: "default",          // "roomy" | "default" | "compact" | "dense"
  // scale: 0.9,               // fine-tune the preset (multiplies the base size)
  // body-size: 18pt,          // or set the base size directly
  config-info(
    title: [My talk],
    short-title: [My talk],    // footer text
    author: [Pedro Santos Silva],
    date: datetime.today(),
    institution: [Aalto University],
    // A *path*, not image(): the theme then sizes the visible lock-up and
    // aligns its ink to the slide margins (the originals carry clear space
    // inside the file). Paths start at the project root — "/assets/…".
    // logo: "/assets/logo/primary/aalto-black-quote.pdf",
  ),
)

#title-slide()                 // dark: true → black-background variant
                               // official title slides use the wide lock-up:
                               // #title-slide(logo: "/assets/logo/tertiary/
                               //   aalto-fi-se-en-black-quote.pdf")
#include "sections/01-intro.typ"
```

Headings drive the structure — no boilerplate:

| Markup | Result |
|---|---|
| `= Section` | section slide (accent background, black text) |
| `== Slide title` | content slide with that title |
| `=== Subheading` | bold grey subheading inside a slide |

**Every section file must import the theme** (`#include` does not inherit
imports from the including file):

```typst
#import "../../theme/aalto.typ": *
```

## Effects (the only ones you asked for)

| Effect | How |
|---|---|
| Sequential reveal | `#pause` between bullets/paragraphs |
| Gray in | `#gray-in[content]` (dim → full on next click) |
| Gray out | `#gray-out[content]` (full → dim on next click) |
| Dim manually | `#dim[content]` |
| Focus one item, dim the rest | `focus-step` + `#alternatives` (see demo `03-dynamics.typ`) |
| Emphasis in accent colour | `#alert[content]` |
| Big statement slide | `#focus-slide[Keep it simple.]` |
| Closing / Kiitos slide | `#thanks-slide(word: [Kiitos!], contact: ("you@aalto.fi",), info: [extra block])` |
| Presenter notes | `#speaker-note[...]` (shown by pdfpc/pympress) |

**Gotchas (learned the hard way):**
- Never put `#pause`/`#meanwhile` inside a heading (`== Title #pause`) —
  headings are re-rendered through a context block and the mark is lost.
- Keep animation marks at the top level of the slide body — not nested
  inside `two-col`/`grid` cells or measured containers (`layout`,
  `figure-placeholder`). Compose slides as: static grid first, then a
  top-level `#pause`, then the next grid.
- Typst 0.15 has no `image(crop:)`, no `place(region:)` and no `warn()`; logo
  clear space is compensated by size + `move()`, and corner logos live in
  `set page(background:)` so they anchor to the page, not the text area.
- `place(bottom + left, dy: X)` moves **down** (off the page): inset from a
  bottom edge needs `dy: -X`.

## Logos

Three marks — **A"** quote, **A?** question, **A!** exclaim — interchangeable.
Pick one per deck:

```typst
#show: aalto-theme.with(
  mark: "exclaim",      // "question" | "quote" | "exclaim" — swaps the mark
                        // everywhere (title, content, section, thanks slide)
  // corner: "primary", // bottom-left lock-up; default "mark" = bare logomark.
                        // "asc" = ASC hexagons only; "both" = Aalto + grey rule + ASC
  logo: "/assets/logo/primary/aalto-black-quote.pdf",   // path names the rest
)
```

Or address a variant directly — the path is `<lockup>/aalto-<lang-><colour>-<mark>.pdf`:

```typst
aalto-logo()                                   // primary, EN, black, A"
aalto-logo(lockup: "mark", mark: "question")   // the bare A? logomark
aalto-logo(lockup: "tertiary", colour: "white")
// rewrite one part of an existing path:
logo-with("/assets/logo/primary/aalto-black-quote.pdf", lockup: "tertiary")
```

`mark/` is the **text-free logomark** — what Aalto uses in the bottom-left
corner of its content slides and oversized on its Thank-you slides, so it is
what this theme draws there by default (it swaps the `lockup:` of your `logo:`
path; `corner: "primary"` gets the wordmark back). The generator does not serve
it: `assets/logo/make-plain.py` derives it by rewriting only the `/MediaBox` of
the official originals to the mark's ink rectangle — the artwork is copied
byte-for-byte, nothing is redrawn. See `assets/logo/README.md`.

**Aalto Scientific Computing hexagons** (`assets/logo/scicomp/`, fetched by
`assets/logo/fetch-scicomp.py`) brand the team's material — Triton included,
there is no separate Triton logo. `corner: "asc"` or `corner: "both"` puts them
bottom-left of content/section slides (`"both"` = Aalto logo then the hexagons;
`corner-rule: true` adds a thin grey divider between them). The closing slide
stays calm by default (single mark) — `#thanks-slide(corner: "both")` opts into
the pair, `corner: "asc"` into the hexagons alone, `corner: none` drops the
left art. `org-logo: scicomp-logo()` co-brands the title and closing slides
top-right; `section-art: scicomp-logo(colour: "white")` puts them on every
section slide; `#title-slide(art: "/assets/…")` adds a right-hand image panel
to a title slide. `title-rule: "progress"` turns the line under each slide
title into a quiet deck-progress bar (`"dash"` is the default short accent
line, `"none"` removes it).

## Layout recipes

```typst
#two-col(ratio: (2fr, 1fr))[text][figure]        // columns
#slide(composer: (1fr, 2fr))[A][B]               // column-split slide
#grid(columns: 3, column-gutter: 1em, a, b, c)   // any grid
#place(...)                                       // free positioning
#figure(image("fig.png", width: 80%), caption: [Caption.])
```

`#figure-placeholder(label: [x], ratio: 16/9, fill-colour: aalto-blue)`
draws a branded draft box while a figure is still missing.

## `kit/` — the tweak layer for real decks

`theme/aalto.typ` is the brand. `kit/deckkit.typ` is **slide composition**: it
turns a deck into data — one call per slide, no layout in the section files.
Used by `decks/20261119_Prompt_engineering` and `decks/20261120_Image_generation`.

```typst
// decks/<name>/figs.typ — three lines, then every section imports it
#import "../../kit/deckkit.typ": make-deck
#let d = make-deck(json("figures/manifest.json"), k: (fig-h: 4in, reveal: true))
#let example = d.example   // + fig, pair, ladder, chat-example, spec-table, …

// sections/*.typ
== When the answer is wrong, fix the prompt — not the model
#chat-example(rounds: ((prompt: "…", answer: […]), (prompt: "…", answer: […])),
              take: […], source: [old slide 26])
```

Figures are referenced by **name**, never by path: `kit/scan-figures.py
<deck>` writes `figures/manifest.json` from the folder (vector preferred over
raster), and an unknown name renders a labelled placeholder instead of failing
the build — so a slide can be written before its picture exists. Re-scan after
adding or replacing anything.

Knobs (per deck, or per call): `fig-h` (the figure-row budget — the builders
subtract the prompt strip, note and lesson from it), `reveal`, `show-source`,
`card-size`, and `h:` to override one slide. Why it estimates text heights
instead of measuring them: `layout()`/`measure()` inside a Touying slide pushes
everything after it onto its own page (measured: 44 pages vs 25).

## Brand compliance (from brand.aalto.fi)

The machine-readable brand tokens are baked into `theme/tokens.typ` and the
logo ink geometry into `theme/logo-metrics.typ` — do not hand-edit either.
(On the maintainer's machine the full brand site is also mirrored offline in
`reference/brand-aalto-fi/`, 136 pages + tokens, refreshable with its
`refresh.sh` — that mirror is not published here.)

- **Typeface:** Inter for everything (bundled). **Source Code Pro is the code
  face** — bundled too (`fonts/SourceCodePro.ttf`, variable); Typst does *not*
  resolve generic names like `"monospace"`, so code text must name it: `font: ("Source Code Pro", "DejaVu Sans Mono")`. Bold headings with tight
  tracking (brand "tracking −25"), sentence case, left-aligned ragged-right
  text, **≤ 3 font sizes per slide**. Besley is the optional serif complement;
  Source Code Pro is the code face. Arial/Georgia are Office fallbacks only.
- **Type scale:** the theme's `density` presets (roomy/default/compact/dense =
  24/20/17/15 pt base) keep the brand's own size *ratios* while letting you
  shrink everything with one knob — source: brand.aalto.fi design tokens
  (`theme/tokens.typ` carries them; the full mirror lives only on the
  maintainer's machine).
- **Colours:** white/black base; brand colours as sparing accents.
  University: Blue `#46A5FF`, Red `#FD6360`, Yellow `#F7E159`.
  School colours in `school-colours` (arts/eng/elec/biz/chem/sci) — use a
  school colour only for that school's material, never mixed. Their dark
  companions are in `school-colours-dark` / `aalto-*-dark` for text on white.
  Brand colours are designed for **black** foreground text (≥ 7:1 contrast);
  the theme therefore uses black text on accent backgrounds and the official
  tint4 token for `#alert` on white.
- **Logo:** registered trademark — only the official originals, never redrawn.
  `python3 assets/logo/fetch-logos.py` pulls every valid university variant from
  aaltologo.fi (primary / secondary / tertiary lock-ups × 3 marks × 2 colours;
  schools with `--unit sci|chem|…`) — the `*.pdf` files are gitignored on purpose.
  Pass a **path** via `config-info(logo: ...)`; the theme draws it as a page
  background — **top-left on the title slide** (tertiary wide lock-up) and the
  **bare text-free logomark bottom-left on content and section slides**, exactly
  like Aalto's own template (`corner: "primary"` puts the wordmark back) — sized
  from the official PowerPoint template and *ink-aligned* (the originals hide the
  clear space inside the page box, which is why a plain `image(height: 1.6em)`
  looked small and floating — see `assets/logo/README.md`).
  `mark: "question"|"quote"|"exclaim"` switches the logomark deck-wide.
  Override per slide with `#title-slide(logo: ...)`; use a white file on dark.

## Presenting & exporting

- **Present:** the build is a standard PDF — present from any viewer.
  For presenter notes + next-slide preview use `pdfpc` or `pympress`
  (touying writes the notes into the PDF; pdfpc also reads `.pdfpc`).
- **PPTX (if ever needed):** experimental editable-PPTX via
  [Tylina](https://tylina.github.io/) or the `touying-exporter` CLI.
  PDF is the primary format; treat PPTX as a lossy fallback.

## For agents

- Build command: `./slides demo` (or `typst compile --root . --font-path fonts <deck>/main.typ`).
- Brand data: the generated tokens are in `theme/tokens.typ` (source: Aalto's
  design tokens from brand.aalto.fi — the maintainer's unpublished
  `reference/brand-aalto-fi/` mirror and its `refresh.sh` are not in this repo).
- Logos: `python3 assets/logo/fetch-logos.py` (files) and
  `python3 assets/logo/measure-logos.py` (regenerate `theme/logo-metrics.typ`;
  an unmeasured file silently falls back to plain box sizing, so it renders a
  bit small — measure anything you add).
- `example/blank.pptx` is Aalto's own PowerPoint template, kept as the
  geometry reference for slide margins and logo size/placement.
- Real decks compose through `kit/deckkit.typ` (see *kit/ — the tweak layer*
  above): section files hold data, not layout, and figures are named, not
  pathed — `python3 kit/scan-figures.py decks/<name>` after touching `figures/`.
  Never clear a deck's `figures/` with a glob: it holds files the scanner does
  not know about.
- Touying 0.8 API notes: `#show: aalto-theme.with(...)` (no `utils.methods`);
  section titles render from heading context, not the slide body;
  animation marks must not sit inside headings or measured containers.
- Never send unpublished/confidential talk content to web tools — decks are
  local plain text by design.
