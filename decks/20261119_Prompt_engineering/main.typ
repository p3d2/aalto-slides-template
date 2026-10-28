// ── Prompt engineering & generative AI in the academic workflow ─────────────
// 19 Nov 2026 · Aalto "AI in research work" training (slot TODO)
// PORT of sections 2 + 3 of ppts/2026_04_28_AI_and_Research_Work.pptx
// (Enrico Glerean & Pedro Silva, CC-BY, DOI 10.5281/zenodo.14032261) into the
// Aalto Typst theme. Old slide numbers are kept in the section files.
//
// ⚠ STRUCTURE DRAFT — OUTLINE.md must be OK'd by Pedro before slide bodies are
//   written. The `==` titles below are the claims from OUTLINE.md §2; the
//   originals ("General principles of good prompts (I)", …) are in comments.
//
// Build:  ./slides deck 20261119_Prompt_engineering
// Watch:  ./slides watch-deck 20261119_Prompt_engineering

#import "@preview/touying:0.8.0": *
#import "../../theme/aalto.typ": *

#show: aalto-theme.with(
  accent: aalto-blue, // university-level training, not one school's material
                      // TODO: school-colours.sci / .chem if this is a school session
  density: "default", // TODO: "roomy" for a lecture hall — but a 2-line title then
                      // overflows onto a second page (theme limit; shorten title first)
  mark: "question",   // A? — the old deck's own framing; TODO Pedro's preference
  config-info(
    title: [Prompt engineering and generative AI in the academic workflow], // TODO
    subtitle: [AI in research work · parts 2 and 3],                        // TODO
    author: [Enrico Glerean · Pedro Santos Silva],                          // TODO
    date: datetime(year: 2026, month: 11, day: 19),
    institution: [Aalto University],
    short-title: [Prompt engineering & Gen AI in the workflow],
    // A *path*, not image(): the theme sizes the visible lock-up and ink-aligns
    // it to the margins. Root-absolute — see assets/logo/README.md.
    logo: "/assets/logo/primary/aalto-black-quote.pdf",
  ),
)

#title-slide(
  // Tighten the bottom margin: the two-line title + subtitle + meta block is
  // taller than the theme's fixed 3.2em bottom margin (known theme limit).
  config: config-page(margin: (top: 3.2em, bottom: 1.6em, x: 2.6em)),
  logo: "/assets/logo/tertiary/aalto-fi-se-en-black-quote.pdf",
)

#include "sections/01-prompt-engineering.typ"   // old 18–22
#include "sections/02-academic-workflow.typ"    // old 23–38, 40–41

#thanks-slide(
  word: [Kiitos!], // TODO: "Thank you!" if the room is not Finnish
  contact: (
    "Enrico Glerean · Pedro Santos Silva · Aalto University", // TODO confirm
    // Attribution for the ported material — keep it (CC-BY requires it).
    "Materials: DOI 10.5281/zenodo.14032261 (CC-BY) · TODO contact lines",
  ),
)

// ── Backup: after the closing slide, so they never count against the slot ───
#include "sections/03-backup.typ"   // old 29 (R Monte Carlo) + old 33 (ffmpeg)
