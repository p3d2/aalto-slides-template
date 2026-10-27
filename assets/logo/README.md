# Logo assets — official originals

These are the **official Aalto University logo originals**, downloaded from
the logo generator (<https://aaltologo.fi/>). Per the brand guidelines they
must **never be redrawn, altered or recreated** — use them exactly as provided,
with clear space around them. Nothing here is edited; the files are byte-identical
to what the generator serves (the `*.pdf` files are gitignored, so a fresh clone
gets them with one command: `python3 assets/logo/fetch-logos.py`).

## Get them

```bash
python3 assets/logo/fetch-logos.py                    # university set (30 files)
python3 assets/logo/make-plain.py                     # + the text-free mark (6)
python3 assets/logo/fetch-logos.py --unit sci         # School of Science
python3 assets/logo/fetch-logos.py --unit chem --unit sci
python3 assets/logo/fetch-logos.py --list             # catalogue, no downloads
python3 assets/logo/measure-logos.py                  # regenerate theme/logo-metrics.typ
```

`fetch-logos.py` pulls from the generator's own endpoints (`files_<unit>.json` +
`dl.php`) and writes the files below; `make-plain.py` derives `mark/` from
`primary/`; `measure-logos.py` renders each PDF and measures how much of its
page box is actually ink — see *Clear space* below.
Run it again whenever you add a logo, and don't hand-edit `theme/logo-metrics.typ`.

## The logo system (brand.aalto.fi → visual guidelines → logo)

Three "A" logomarks — **A?** (question), **A"** (quote), **A!** (exclaim) — used
randomly, or purposefully (A" when talks are the message, A? for a question,
A! for gravity). Default for a talk: **quote**. Each mark comes in black (for
light backgrounds) and white (for dark ones), in four lock-ups:

| Dir | Lock-up | Site calls it | Languages |
|---|---|---|---|
| `primary/` | mark + `Aalto University` on one line below | `..._21_...` | EN, FI (`-fi-`), SE (`-se-`) |
| `secondary/` | mark + trilingual name, three rows below | `FI-SE-EN_21` | FI-SE-EN (`-fi-se-en-`) |
| `tertiary/` | mark + trilingual name to the right | `FI-SE-EN_13` | FI-SE-EN |
| `mark/` | **the logomark alone, no text** | *not served* — derived, see below | — |

File names: `aalto-<lang-><colour>-<mark>.pdf`, e.g. `primary/aalto-fi-black-quote.pdf`,
`tertiary/aalto-fi-se-en-white-question.pdf`. School logos are the same with the
school in the name (`aalto-sci-black-quote.pdf`) once you fetch them.

### mark/ — the text-free logomark

The brand system defines a "plain" mark (brand.aalto.fi → logo → *Identifier
versions*) and Aalto's own PowerPoint uses it everywhere: small in the
bottom-left corner of content slides, oversized on the "Kiitos / Thank you"
slide. The generator only serves lock-ups that carry the wordmark, so there is
no official file to download.

`make-plain.py` derives it **without touching the artwork**: in the primary PDFs
the mark and the wordmark are two vertically separated ink bands, so it measures
the mark band and rewrites only that page's `/MediaBox` to its rectangle — a
page-box crop, byte-for-byte identical content streams, no redraw, no recolour,
padded to the original length so the xref stays valid. Cross-check: the derived
A! is 79.5 × 59.6 pt (ratio 1.334); Aalto's own vector mark in `blank.pptx` is
30.4 × 22.7 pt (ratio 1.339).

```bash
python3 assets/logo/make-plain.py      # writes mark/ (6 files: 3 marks × 2 colours)
python3 assets/logo/measure-logos.py   # then re-measure
```

(For reference, aaltologo.fi also serves `assets/images/aalto_logo_white.svg`
— the A" mark alone, white, 3 paths, no text. It is official, but only one mark
in one colour, so we do not depend on it.)

The generator also lists a single-language "13" (small/horizontal) university
logo. Aalto **discontinued** it — `dl.php` answers with a notice PDF — so
`fetch-logos.py` skips it. (Schools still publish their horizontal version.)

## Clear space: why the theme measures its logos

The official PDFs ship with the brand's clear space **inside the page box**, so
the visible lock-up is much smaller than the box and offset within it:

| Lock-up | page ratio | ink as % of the box |
|---|---|---|
| `primary/` (EN) | 1.141 | 63.5 % w × 59.3 % h |
| `secondary/` | 1.087 | 67.0 % w × 66.9 % h |
| `tertiary/` | ~3.0 | 83.5 % w × 54.2 % h |
| `mark/` | 1.33–1.63 | 100 % × 100 % (tight by construction) |

So a plain `image(logo, height: 1.6em)` renders a 1.6em box whose lock-up is
~0.95em tall and floats ~0.3em away from the corner — the old "logo looks tiny
and misplaced" bug.

`theme/aalto.typ` fixes this with the generated `theme/logo-metrics.typ`:
**`logo-image()` takes the height you want for the *visible* logo and grows +
slides the box so the ink, not the page, sits where you place it.** Give the
theme a *path string* (not `image()` content) and it does this for you.

## Wiring into a deck

```typst
#show: aalto-theme.with(
  mark: "exclaim",   // optional: force the logomark deck-wide (question|quote|exclaim)
  config-info(
    ...,
    // Paths start at the project root (the build uses `--root .`): the theme
    // opens the file itself, so it can size and ink-align the visible lock-up.
    logo: "/assets/logo/primary/aalto-black-quote.pdf",
  ),
)

#title-slide(logo: "/assets/logo/tertiary/aalto-fi-se-en-black-quote.pdf")
```

Placement and size are the theme's job (`logo-sizes` / `logo-margins` in
`theme/aalto.typ`, derived from Aalto's own PowerPoint template):

| Slide | lock-up | corner | visible height | measured on our canvas |
|---|---|---|---|---|
| title | tertiary | top-left | 8.4 % of the slide height | 8.24 %, top 6.44 %, left 6.12 % |
| content | `mark/` — bare logomark | bottom-left | 4.2 % | 4.44 %, bottom gap 5.91 % |
| section | `mark/` | bottom-left | 4.2 % | 4.44 %, bottom gap 5.91 % |
| thanks | `mark/` | vertically centred, left on the margin | 34 % (default `mark-height: 8em`) | 33.4 %, top = bottom gap ≈ 33 % |

(Official: title 8.41 %/6.30 %/3.34 %, content 4.21 %/5.89 %/3.34 %. We align
the logo with our own text block at 2.6 em instead of Aalto's raw 3.34 % margin,
so the logo and the copy share an edge. The corner is the bare mark because that
is what Aalto's own template puts there; `corner: "primary"` in the theme brings
the wordmark back.)

- `#title-slide(dark: true, logo: "/assets/logo/tertiary/aalto-fi-se-en-white-quote.pdf")`
  — white logo for the black title slide; the mark on dark section/focus slides
  must match the background the same way.
- The logo is drawn as a **page background**, so it is anchored to the page
  corner and never moves with a slide's margins.
- `focus-slide` deliberately carries no logo (its background may be dark or a
  brand colour; a corner logo would fight the statement).

## Aalto Scientific Computing hexagons (`scicomp/`)

The team's own logo — three hexagons carrying A·S·C — brands all ASC material,
Triton included (there is no separate Triton logo). It is not an Aalto
trademark, so it lives outside the aaltologo.fi pipeline:

```bash
python3 assets/logo/fetch-scicomp.py     # from AaltoSciComp/scicomp-docs on GitHub
python3 assets/logo/measure-logos.py     # measure like the rest
```

| File | Variant |
|---|---|
| `scicomp/asc-black.svg` | black ink, transparent — light backgrounds, incl. brand-colour section slides (derived from the white original by a colour swap; paths untouched) |
| `scicomp/asc-white.svg` | white ink, transparent — dark backgrounds |
| `scicomp/asc-background.svg` | black ink on a white plate — busy/dark photos |

The theme exposes them as `scicomp-logo()` / `scicomp-logo(colour: "white")`
and uses them via `org-logo:` (co-brand top-right on title + closing slides)
and `section-art:` (right-hand panel on section slides). `measure-logos.py`
measures SVGs too (viewBox geometry), so `logo-image()` ink-aligns them like
the Aalto PDFs.

## Provenance

`fetch-logos.py` records the generator's own names when run; the mapping for the
university set is `<dir>/aalto-…` ← `Aalto-yliopisto_<LANG>_<SIZE>_<COLOUR>_<mark#>.pdf`
with mark `1 = question (A?)`, `2 = quote (A")`, `3 = exclaim (A!)`. The files
are vector PDFs exported by Adobe Illustrator (no rasterised logos inside); the
six originally downloaded by hand match the script's output md5 for md5.
