# Using the Aalto slides template

A guide for **people**, not machines. No prior Typst experience assumed — if you
can edit a text file and run a command, you can make a deck here.

*How the talk itself should be built (story, density, rehearsal) is in
[making-a-talk.md](making-a-talk.md). This file is only about the tool. In a
hurry, or printing something for the desk: [`cheatsheet.pdf`](cheatsheet.pdf)
— one A4 page, built from `cheatsheet.typ` with `./slides cheatsheet`.*

---

## 1. What you get

Your slides are a **text file**. You write what you mean; the program draws the
slides, on brand, in about half a second, and hands you a PDF you can present
from any machine.

| | PowerPoint / Keynote | this |
|---|---|---|
| source | binary file, one copy | plain text, diffable, survives any editor |
| design | you fight the template | the theme enforces Aalto's identity |
| build | minutes to open | ~0.5 s, re-runs every time you save |
| figures | paste a screenshot | reference the file; re-export the figure, rebuild |
| maths, code, tables | images or pain | typed, native |
| presenting | needs Office | any PDF viewer |

You never set a font size, a margin or a colour unless you want to — that is the
theme's job, and it is what keeps 20 slides looking like one talk.

---

## 2. Set up (once)

1. **Install Typst** — <https://typst.app/open-source/>. It is one binary, no
   runtime:
   ```bash
   # Linux/macOS: grab the release binary and drop it on your PATH
   #   https://github.com/typst/typst/releases   (this machine: ~/.local/bin/typst)
   brew install typst                 # macOS / Linux
   winget install typst               # Windows
   cargo install --locked typst-cli   # if you already have Rust
   ```
   Check with `typst --version` (needs ≥ 0.15; release binaries can then
   self-update with `typst update`). There is **no** `pip`/`uv` package for the
   CLI — the PyPI `typst` package is Python bindings, not the compiler.
2. **Put the folder somewhere** — clone/copy `slides-template/`.
3. **Try it**:
   ```bash
   cd slides-template
   ./slides demo          # → demo/demo.pdf
   ```
   The first run downloads the Touying slide engine once (needs network); after
   that it works offline. Inter (Aalto's font) is bundled, so nothing to install.

`./slides` is a small script that just runs `typst` with the right flags
(`--root .` so paths are shared, `--font-path fonts` so the font is found). If
you have `make`, `make demo` does the same thing. If you use **VS Code +
Tinymist**, you get live preview without any command at all.

---

## 3. The whole language in six lines

```typst
= Heading level 1        // makes a SECTION slide (colour background)
== Heading level 2       // makes a CONTENT slide (this is your normal slide)
=== Heading level 3      // a bold subheading *inside* the slide
// this is a comment
#word(...)               // a `#` starts a command: #pause, #two-col(...), #image(...)
[free text]              // square brackets = "content" you can pass to a command
- bullet                 // `-` bullet, `+` numbered, blank line = new paragraph
```

That is genuinely most of what you will type. Everything else is copy-paste from
§5 or from `demo/sections/`.

---

## 4. Your first deck

```bash
./slides new my-talk            # copies the starter into decks/my-talk/
$EDITOR decks/my-talk/main.typ
./slides deck my-talk           # → decks/my-talk/main.pdf
./slides watch-deck my-talk     # rebuilds on every save — leave this running
```

Two files matter:

- **`main.typ`** — the deck's identity: title, author, colours, logo, then one
  `#include` per talk section.
- **`sections/01-main.typ`** — your actual slides. Add `02-method.typ`,
  `03-results.typ`, … as your talk grows. One file per section is what keeps a
  40-slide deck editable (and lets you or an agent rewrite one section without
  touching the rest).

Every section file must start with the import line — `#include` does **not**
inherit imports:

```typst
#import "../../../theme/aalto.typ": *      // three levels up from decks/<name>/sections/
```

---

## 5. The eight things you will actually write

**A content slide**

```typst
== Slides are text, so they are easy to change

- *bold*, `code`, maths $x^2 + y^2 = z^2$
- a bullet per idea, not per sentence
```

**Text beside a figure**

```typst
#two-col(ratio: (3fr, 2fr))[
  What the reader should notice:
  - the plateau above 700 °C
  - the error bars
][
  #figure(image("figures/degradation.svg", width: 100%),
          caption: [TGA trace, sample batch 3.])
]
```

**A figure you do not have yet** — put the box in so the slide is honest about
its hole, and the layout does not move later:

```typst
#figure-placeholder(label: [AFM height image], ratio: 16/10)
```

**A table, code, maths** — all native Typst, see `demo/sections/02-layouts.typ`.

**Free placement** when a grid is not enough: `#place(top + right, ..)`,
`#grid(columns: 2, ..)`, `#v(1em)` for a gap.

**A credit / source line** pinned to the bottom of the slide — it lands on the
same line as the corner logo and the page number (the text's bottom aligns with
the mark's bottom edge; descender tails like `q` may hang below it, as in print):

```typst
#credit-line[Images © 2026 … · CC BY 4.0.]   // or where: "left" / "right"
```

**A slide that is one sentence** — this is your loudest tool, use it for the
claim you want remembered:

```typst
#focus-slide[The interface is the story, not the coating.]
```

**Reveal as you speak**

```typst
- first point
#pause
- second point, only after you say it
```

**The closing slide** (logomark, contact details, optional extra info)

```typst
#thanks-slide(word: [Kiitos!], contact: ("Your Name · Aalto University",
                                         "you@aalto.fi"))
// `info:` adds an optional block below the contact lines — links, a longer
// note, a QR code — set off with a thin rule:
#thanks-slide(word: [Kiitos!], contact: ("you@aalto.fi",),
              info: [Slides and code: https://example.org/deck])
// `corner:` picks the left-hand logo for this slide alone: "mark" (default —
// a deck with corner: "both" still closes with the single Aalto mark),
// "asc", "both" (the pair) or none:
#thanks-slide(word: [Kiitos!], corner: "asc")
```

**Co-branding and side images**

```typst
// in main.typ — a second logo top-right on the title and closing slides,
// aligned with the Aalto lock-up (e.g. the ASC hexagons):
#show: aalto-theme.with(org-logo: scicomp-logo(), ...)

// a right-hand image panel on the title slide (root-absolute path):
#title-slide(art: "/assets/figures/photo.svg")

// an image/content panel on every section slide (theme option):
#show: aalto-theme.with(section-art: scicomp-logo(colour: "white"), ...)
```

---

## 6. The knobs worth touching

All of these go in `aalto-theme.with(...)` in `main.typ`:

| knob | values | when to touch it |
|---|---|---|
| `accent:` | `aalto-blue` (default), `aalto-red`, `aalto-yellow`, `school-colours.sci`, `.chem`, `.eng`, `.elec`, `.biz`, `.arts` | school talks use their school colour — one school per deck, never mixed |
| `density:` | `"roomy"` `"default"` `"compact"` `"dense"` | big hall / bad projector → `roomy`; dense methods talk → `compact`; never `dense` on a screen |
| `scale:` | e.g. `0.9` | fine-tune one notch below a preset |
| `mark:` | `"question"` `"quote"` `"exclaim"` | pick the logomark for the whole deck (A? / A" / A!) |
| `corner:` | `"mark"` (default) `"primary"` … `"keep"` `"asc"` `"both"` | what sits bottom-left: the bare mark is Aalto's own choice; `"asc"` shows only the ASC hexagons; `"both"` shows Aalto + ASC (with the `corner-rule:` divider between them when on). `#thanks-slide(corner: …)` overrides per closing slide (`none` drops its left art) |
| `corner-rule:` | `true` (default) / `false` | draw the thin grey divider between the two logos in `"both"` corners |
| `title-rule:` | `"dash"` (default) `"none"` `"progress"` | the line under each slide title: the short accent dash, nothing, or a full-width rule that fills with the accent colour as the deck advances (a quiet progress indicator) |
| `org-logo:` | `scicomp-logo()` or any path/content | a second logo co-branded top-right on the title and closing slides; on dark slides a `-black`/`-white` file name swaps automatically |
| `org-logo-height:` | e.g. `1.6em` | size of the co-brand logo (default: title-logo height) |
| `section-art:` | path, content, or `heading => content` | right-hand image panel on every section slide (heading column narrows) |
| `config-info(logo:)` | a **path string** | see §7 |
| `config-info(short-title:)` | `[My talk]` | shows bottom-left next to the mark; leave out for a clean footer — footer text and page number are always bottom-aligned with the logo's ink |
| `aspect-ratio:` | `"16-9"` (default), `"4-3"` | only if the room demands it |

Everything in a deck is sized relative to one base number, so `density:` rescales
titles, bullets, figures and logos together. That is also why you should almost
never write `text(size: 12pt)` by hand — it breaks the rhythm.

---

## 7. Logos

- Get the official originals (never redraw or re-create them — they are
  registered trademarks):
  ```bash
  python3 assets/logo/fetch-logos.py          # university: 30 files
  python3 assets/logo/make-plain.py           # the text-free mark
  python3 assets/logo/measure-logos.py        # geometry the theme needs
  python3 assets/logo/fetch-logos.py --unit sci --unit chem    # school logos
  ```
- **Pass a path, not `image(...)`**:
  `logo: "/assets/logo/primary/aalto-black-quote.pdf"`. The theme then sizes the
  *visible* logo and aligns it to the margin. The originals carry Aalto's clear
  space inside the file, so a hand-sized `image(height: 1.6em)` renders about
  40 % too small and floats off the margin.
- Black logo on light backgrounds, white on dark. For
  `#title-slide(dark: true, logo: "/assets/logo/tertiary/aalto-fi-se-en-white-quote.pdf")`.
- Title slides use the wide trilingual lock-up (like Aalto's own template);
  content and section slides use the bare mark. Details in
  [`assets/logo/README.md`](../assets/logo/README.md).

**The Aalto Scientific Computing hexagon logo.** For team material (Triton
included — there is no separate Triton logo) the ASC hexagons sit in
`assets/logo/scicomp/`:

```bash
python3 assets/logo/fetch-scicomp.py          # 3 variants: black, white, black-on-white-plate
python3 assets/logo/measure-logos.py          # geometry the theme needs
```

Use it via `org-logo: scicomp-logo()` (co-brand top-right on the title and
closing slides) or `section-art: scicomp-logo(colour: "white")` (right-hand
panel on section slides). `scicomp-logo()` returns the black variant for
light backgrounds; `colour: "white"` the one for dark/coloured backgrounds.

---

## 8. Speaker notes and presenting

```typst
#speaker-note[Ask about the DSC ramp rate here, then skip to slide 12 if short on time.]
```

Notes are written into the PDF and picked up by presenter tools:

```bash
pdfpc decks/my-talk/main.pdf      # notes + next slide + timer, dual-screen
```

Anything else works too — the output is a normal PDF. Two habits that pay:
**export the PDF you present from** (so a rebuild cannot surprise you on the
machine), and put the deck plus the PDF on a USB stick as well as in your mail.

---

## 9. Troubleshooting

| message | what happened |
|---|---|
| `path would escape the project root` | use root paths like `/assets/logo/…`, or run the build from the project folder |
| `unknown variable: x` | missing `#import` line in that section file |
| logo missing or tiny | file not in `theme/logo-metrics.typ` → run `measure-logos.py` |
| `file not found (searched at …/assets/logo/…)` | typo in the logo path, or you have not run `fetch-logos.py` on this machine |
| nothing builds but no error | a `#pause` swallowed your content — check you did not put one inside a heading |
| `Touying` download fails | first run needs network; or copy `~/.cache/typst` from another machine |
| preview in VS Code differs from the CLI | Tinymist needs the project root: set `tinymist.rootPath` to this folder |

---

## 10. When the template is not enough

1. Look in `demo/sections/` — most things you want are demonstrated there.
2. Typst is small and readable: <https://typst.app/docs/reference/>. Anything
   valid in Typst is valid inside a slide.
3. The slide engine is Touying: <https://touying.app/> (its `#only`, `#uncover`,
   `#meanwhile`, themes and layouts all work here).
4. Ask an agent to write the slide — the sources are plain text, and
   `README.md` has a *For agents* section with the build command and the gotchas.
   Keep unpublished results off cloud tools.
5. If something is missing often enough, it belongs in `theme/aalto.typ`, not in
   your deck. That is how this template grows.
