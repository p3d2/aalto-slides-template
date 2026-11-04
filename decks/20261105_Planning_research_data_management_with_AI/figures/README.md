# figures/ — where every picture in this deck lives

Reference a figure **relative to the file that uses it**:

| from | path |
|---|---|
| `sections/*.typ` | `../figures/tga-batch3.svg` |
| `main.typ` | `figures/tga-batch3.svg` |

```typst
#figure(image("../figures/tga-batch3.svg", width: 100%,
              alt: "TGA trace: mass loss starts at 700 degrees C"),
        caption: [TGA trace, batch 3.])
```

## Conventions

- **Vector first**: SVG or PDF for plots, schemes, diagrams — crisp at any size and
  tiny in the deck. PNG only for photos/microscopy (export ≥ 2× the slide size).
- **Keep the source that makes it.** If a figure is generated (matplotlib, R,
  TikZ, Illustrator), put the script/source in `figures/src/` next to its output,
  so "fix the axis label" is a re-export, not a redraw. Name them the same:
  `figures/tga-batch3.svg` ← `figures/src/tga-batch3.py`.
- **Names**: kebab-case, say what it is, add the iteration if you revise:
  `tga-batch3.svg`, `setup-photo-v2.jpg`. Never `fig1.png`, `new-final.png`.
- **Draw for the room, not for the paper.** A journal export (6 pt labels,
  one-column width) is unreadable on a screen: bigger type, fewer gridlines,
  direct labels instead of a legend box, one accent colour + greys.
- **While it does not exist yet**, put a branded placeholder on the slide so the
  layout is final and the hole is visible:
  `#figure-placeholder(label: [AFM height image], ratio: 16/10)`
- **Accessibility**: always give `image(..., alt: …)` a one-line description, and
  never encode meaning in colour alone (add shape, dash or a direct label).
- **Palette**: for data visualisation follow the brand guidance —
  `reference/brand-aalto-fi/pages/brand/visual-guidelines/data-visualisation.md`
  (offline mirror) or brand.aalto.fi. Brand colours take black text on top.
- One hero figure per slide; two only when the slide is *about* comparing them,
  and then the title says what is compared.
