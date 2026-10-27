// ── ASC presentation — 26 Nov 2026 ─────────────────────────────────────────
// RSE pitch to CHEM: who we are, what we do, how to engage.
// Build:  ./slides deck 20261126_ASC_ppt
// Watch:  ./slides watch-deck 20261126_ASC_ppt
// Figures: referenced by name via figs.typ (figures/manifest.json — re-run
//          kit/scan-figures.py after touching figures/).

#import "@preview/touying:0.8.0": *
#import "../../theme/aalto.typ": *

#show: aalto-theme.with(
  accent: school-colours.chem, // CHEM material → the school colour is the deck accent
  mark: "exclaim", // logomark deck-wide: question (A?) | quote (A") | exclaim (A!)
  // Co-brand: the ASC hexagons top-right on the title and closing slides
  // (assets/logo/scicomp/, fetched by assets/logo/fetch-scicomp.py).
  org-logo: scicomp-logo(),
  // Bottom-left corner of content/section slides: "mark" (Aalto only,
  // default), "asc" (hexagons only) or "both" (Aalto + ASC). corner-rule:
  // true draws the thin grey divider between the two corner logos.
  corner: "both",
  corner-rule: true,
  title-rule: "none",
  config-info(
    title: [Research Software Engineers],
    subtitle: [RSEs for CHEM],
    author: none,
    date: datetime(year: 2026, month: 11, day: 26),
    institution: [Aalto Scientific Computing · Aalto University],
    // Give the theme a *path*, not image(): it then sizes the visible lock-up
    // and aligns its ink with the slide margins (the originals carry the brand
    // clear space inside the file). See assets/logo/README.md.
    logo: "/assets/logo/primary/aalto-black-quote.pdf",
  ),
)

// The title slide uses the wide trilingual lock-up top-left; content and
// section slides show the bare text-free logomark bottom-left (like Aalto's own
// template). For #title-slide(dark: true) pass a white logo instead of a black one.
#title-slide(logo: "/assets/logo/tertiary/aalto-fi-se-en-black-quote.pdf")

// One file per talk section keeps the deck modular and agent-editable:
#include "sections/01-main.typ"

// Closing slide: bare logomark on the left, contact lines on the right;
// the ASC hexagons appear top-right via `org-logo:` above.
#thanks-slide(
  word: [Kiitos!],
  corner: "mark",
  contact: ("Marijn van Vliet · Patricia Hernandez Leon · Pedro Santos Silva · Aalto University", [#link("rse@aalto.fi") · #link("scicomp.aalto.fi/help/garage/")]),
)

// Q&A slide — intentionally AFTER the closing slide: the talk ends on Kiitos!,
// then the room opens for questions on this section slide. Do not remove.
= How can we work together?
