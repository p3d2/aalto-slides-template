// Demo deck — shows every feature of the Aalto slides theme.
// Build:  make demo        (or: typst compile --font-path fonts demo/main.typ)
// Watch:  make watch-demo

#import "@preview/touying:0.8.0": *
#import "../theme/aalto.typ": *

#show: aalto-theme.with(
  accent: aalto-blue, // university-level; for a school use e.g. school-colours.sci
  // mark: "exclaim", // force the logomark deck-wide: "question" A? | "quote" A" | "exclaim" A!
  // Co-brand: a second logo top-right on the title and closing slides, at the
  // same height/top line as the Aalto lock-up. The ASC hexagons come from
  // assets/logo/scicomp/ (python3 assets/logo/fetch-scicomp.py).
  org-logo: scicomp-logo(),
  // Bottom-left corner of content/section slides: "mark" (Aalto only, default),
  // "asc" (hexagons only) or "both" (Aalto + ASC; corner-rule: adds a grey divider).
  corner: "both",
  corner-rule: false, // no divider line between the two corner logos
  // The line under each slide title: "dash" (default), "none", or "progress"
  // — a full-width rule that fills as the deck advances.
  title-rule: "progress",
  // section-art: scicomp-logo(colour: "white"), // optional image/content on every section slide
  config-info(
    title: [Aalto slides template],
    subtitle: [Typst + Touying deck scaffold following the Aalto visual identity],
    author: [Pedro Santos Silva],
    date: datetime.today(),
    institution: [Aalto University],
    // Official logo originals live in assets/logo/ (see its README). Give the
    // theme a *path* and it sizes the visible lock-up + aligns its ink to the
    // margins; pass a white one to #title-slide(dark: true).
    logo: "/assets/logo/primary/aalto-black-quote.pdf",
  ),
)

// Title slide: the wide trilingual lock-up, like the official template.
#title-slide(logo: "/assets/logo/tertiary/aalto-fi-se-en-black-quote.pdf")

// The deck is assembled from multiple source files:
#include "sections/01-intro.typ"
#include "sections/02-layouts.typ"
#include "sections/03-dynamics.typ"
