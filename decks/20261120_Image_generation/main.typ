// ── Image generation with AI ────────────────────────────────────────────────
// 20 Nov 2026 · Aalto "AI in research work" training (slot TODO)
// PORT of section 4.1 of ppts/2026_04_28_AI_and_Research_Work.pptx (old slides
// 45–64), Enrico Glerean & Pedro Silva, CC-BY, DOI 10.5281/zenodo.14032261.
// Companion deck to ../20261119_Prompt_engineering (sections 2 + 3).
//
// ⚠ STRUCTURE DRAFT — OUTLINE.md must be OK'd by Pedro before slide bodies are
//   written. `==` titles are the claims from OUTLINE.md §2; the original
//   PowerPoint titles ("4.1. How does AI generate images? (diffusion model)")
//   are in the comments with their old slide numbers.
//
// Build:  ./slides deck 20261120_Image_generation
// Watch:  ./slides watch-deck 20261120_Image_generation
// Figures: python3 figures/src/extract-figures.py   (re-extracts + resizes from
//   the pptx — see figures/README.md; never delete files in figures/ by glob)

#import "@preview/touying:0.8.0": *
#import "../../theme/aalto.typ": *

#show: aalto-theme.with(
  accent: aalto-blue,   // university-level training, same series as the 19 Nov
                      // deck. aalto-yellow was tried first and does not work:
                      // the theme derives #alert (every *bold* word) and the
                      // title rule from the accent, so bold body text renders
                      // olive-on-white and the rule nearly disappears.
                      // TODO: aalto-red, or school-colours.chem / .sci if this
                      // is one school's session.
  density: "default",   // TODO: roomy for a lecture hall (then shorten the title)
  mark: "exclaim",     // matches the 19 Nov deck — one series, one mark
  config-info(
    title: [Image generation with AI],                      // TODO
    subtitle: [AI in research work],  // TODO
    author: [Pedro Santos Silva],          // TODO
    date: datetime(year: 2026, month: 11, day: 22),
    institution: [Aalto University],
    short-title: [],
    logo: "/assets/logo/primary/aalto-black-quote.pdf",
  ),
)

#title-slide(
  config: config-page(margin: (top: 3.2em, bottom: 1.6em, x: 2.6em)),
  logo: "/assets/logo/tertiary/aalto-fi-se-en-black-quote.pdf",
)

#include "sections/01-why-use-AI.typ"
#include "sections/02-how-to-use-AI.typ"
#include "sections/03-where-to-start.typ"
#include "sections/04-hands-on.typ"
#include "sections/05-limits.typ"

#thanks-slide(
  word: [Kiitos!], // TODO
  contact: (
    "Pedro Santos Silva · Aalto University", // TODO confirm
    //"Materials: DOI 10.5281/zenodo.14032261 (CC-BY) · TODO contact lines",
  ),
)
