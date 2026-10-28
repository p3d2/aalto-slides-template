# brand.aalto.fi — offline mirror

A local, plain-text copy of the **Aalto University brand library**
(<https://brand.aalto.fi>), captured so the slides theme can be built and
audited against the real brand guidelines without a browser or network.

> This is **not** a copy of Aalto's official PowerPoint template
> (`example/blank.pdf` is kept only as a reference). The slides theme in
> `theme/` is our own Typst/Touying design, built *from the guidelines*.

## What is inside

| Path | What it is |
|---|---|
| `INDEX.md` | Site map: every page, grouped by section, with titles + last-published dates |
| `pages/` | **136 pages as readable Markdown**, mirroring the site URL structure (e.g. `pages/brand/visual-guidelines/type.md` ↔ <https://brand.aalto.fi/brand/visual-guidelines/type>) |
| `prismic/` | Raw CMS documents (`documents/*.json`), the API root, bookmarks, the media list, and the route map |
| `prismic/fetch_all.py` | Re-downloads every document from the Prismic CMS |
| `site/` | The SPA shell: `index.html`, the JS/CSS bundles and every lazy-loaded chunk |
| `tokens/` | The **official design tokens** (`design-tokens.json` = atomic "base", `design-tokens-1.json` = semantic "alias"), extracted from the JS bundle |
| `notes/design-tokens.md` | Human-readable digest of the tokens (type scale, colours, spacing, aspect ratios) |
| `media/` | Downloaded images/assets referenced by the pages (`media/index.tsv` maps url → file) |
| `build_index.py` | Rebuilds `INDEX.md` from the raw documents |
| `build_tokens.py` | Rebuilds `notes/design-tokens.md` **and** `../../theme/tokens.typ` |
| `download_media.py` | Downloads page media (skips expiring Vimeo/YouTube video links) |
| `to_markdown.py` | Converts raw documents → `pages/*.md` |
| `refresh.sh` | Runs all of the above in order |

## Regenerate everything

```bash
./refresh.sh            # full re-fetch + rebuild (needs network)
```

Individual steps (all offline except `fetch_all.py`):

```bash
cd prismic && python3 fetch_all.py && cd ..   # 1. pull CMS docs
python3 to_markdown.py                        # 2. docs → pages/*.md
python3 build_index.py                        # 3. INDEX.md
python3 build_tokens.py                       # 4. tokens digest + theme/tokens.typ
python3 download_media.py                     # 5. images/assets → media/
```

## Provenance & the access token

The site is a React SPA backed by a **Prismic** CMS. The repository name and a
**read-only public access token** are embedded in the site's own JavaScript
bundle (`site/assets/index-CBudMlQL.js`); `fetch_all.py` reads that token from
`prismic/.token` (kept out of git via the parent `.gitignore`). The token is
public by design (the CMS is published anonymously) — if it ever rotates,
re-extract it from the bundle with:

```bash
grep -o 'MC5[A-Za-z0-9._-]\{20,\}' site/assets/index-*.js | head -1
```

Retrieved **2026-10-15**, language `en-eu` (English). The Finnish (`fi`)
translations are not mirrored.

## What the mirror tells us (the bits the theme uses)

- **Typeface** — Inter for everything (Bold + Regular primary), Besley as the
  serif complement, Source Code Pro for code. Arial/Georgia are only Office
  fallbacks. See `pages/brand/visual-guidelines/type.md`.
- **Type rules** — max **three** type sizes per surface, titles larger than
  body, left-aligned ragged-right, no ALL CAPS, headlines in Inter Bold with
  tight tracking (−25 for headlines, −50 for expressive).
- **Colours** — university Blue `#46A5FF`, Red `#FD6360`, Yellow `#F7E159`;
  six school colours (never mixed); black/white + greys are the key colours.
  Brand colours are designed for **black** foreground text. Full tables in
  `notes/design-tokens.md`.
- **Tokens** — the atomic scale (font sizes 14–64 px, line heights, letter
  spacing, spacing, aspect ratios, breakpoints) and the composite type styles
  are in `tokens/`, generated into `theme/tokens.typ`.
- **Logo** — registered trademark; only the official originals (already in
  `assets/logo/`), never redrawn. See `pages/brand/visual-guidelines/logo.md`.

## What is deliberately *not* here

- The Aalto **icon font** (`aalto-icons`) ships as a base64 WOFF inside the CSS
  bundle but its name→codepoint map lives only in the Figma "Aalto Icons"
  library (login-gated). Icon names are listed in `tokens/design-tokens.json →
  icon`; for slides, prefer inline SVGs.
- The **Figma** design-system files and the **materialbank** assets (login).
- **Videos** — the brand site links Vimeo/YouTube with expiring signed URLs;
  `download_media.py` skips them.
