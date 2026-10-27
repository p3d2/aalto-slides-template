// ─────────────────────────────────────────────────────────────────────────────
// GENERATED FILE — do not edit by hand.
// Geometry of the official Aalto logo originals in assets/logo/.
// Produced by:  python3 assets/logo/measure-logos.py
//
// The originals carry the brand's clear space *inside* the PDF page, so the
// visible lock-up is smaller than the box and offset within it. For each file
// (keyed by "<lockup>/<filename>.pdf"):
//   ratio   page width / height
//   l, r    empty left / right padding, as a fraction of the page width
//   t, b    empty top / bottom padding, as a fraction of the page height
// The theme uses these to make `height:` mean the *visible* logo height and to
// align the ink (not the box) with a slide corner.
// ─────────────────────────────────────────────────────────────────────────────

#let logo-metrics = (
  "mark/aalto-black-exclaim.pdf": (ratio: 1.3339, l: 0.0000, r: 0.0000, t: 0.0000, b: -0.0004),
  "mark/aalto-black-question.pdf": (ratio: 1.6258, l: 0.0000, r: 0.0000, t: 0.0000, b: 0.0001),
  "mark/aalto-black-quote.pdf": (ratio: 1.5151, l: 0.0000, r: 0.0000, t: 0.0000, b: 0.0000),
  "mark/aalto-white-exclaim.pdf": (ratio: 1.3339, l: 0.0000, r: 0.0000, t: 0.0000, b: -0.0004),
  "mark/aalto-white-question.pdf": (ratio: 1.6258, l: 0.0000, r: 0.0000, t: 0.0000, b: 0.0001),
  "mark/aalto-white-quote.pdf": (ratio: 1.5151, l: 0.0000, r: 0.0000, t: 0.0000, b: 0.0000),
  "primary/aalto-black-exclaim.pdf": (ratio: 1.1410, l: 0.1850, r: 0.1800, t: 0.2054, b: 0.2013),
  "primary/aalto-black-question.pdf": (ratio: 1.1410, l: 0.1850, r: 0.1800, t: 0.2054, b: 0.2013),
  "primary/aalto-black-quote.pdf": (ratio: 1.1410, l: 0.1850, r: 0.1800, t: 0.2054, b: 0.2013),
  "primary/aalto-fi-black-exclaim.pdf": (ratio: 1.0844, l: 0.1950, r: 0.1900, t: 0.2060, b: 0.2030),
  "primary/aalto-fi-black-question.pdf": (ratio: 1.0844, l: 0.1950, r: 0.1900, t: 0.2006, b: 0.2030),
  "primary/aalto-fi-black-quote.pdf": (ratio: 1.0844, l: 0.1950, r: 0.1900, t: 0.2060, b: 0.2030),
  "primary/aalto-fi-white-exclaim.pdf": (ratio: 1.0844, l: 0.1900, r: 0.1900, t: 0.2060, b: 0.2030),
  "primary/aalto-fi-white-question.pdf": (ratio: 1.0844, l: 0.1900, r: 0.1900, t: 0.2006, b: 0.2030),
  "primary/aalto-fi-white-quote.pdf": (ratio: 1.0844, l: 0.1900, r: 0.1900, t: 0.2060, b: 0.2030),
  "primary/aalto-se-black-exclaim.pdf": (ratio: 1.2791, l: 0.1650, r: 0.1650, t: 0.2047, b: 0.2197),
  "primary/aalto-se-black-question.pdf": (ratio: 1.2791, l: 0.1650, r: 0.1650, t: 0.2047, b: 0.2197),
  "primary/aalto-se-black-quote.pdf": (ratio: 1.2791, l: 0.1650, r: 0.1650, t: 0.2047, b: 0.2197),
  "primary/aalto-se-white-exclaim.pdf": (ratio: 1.2791, l: 0.1650, r: 0.1650, t: 0.2047, b: 0.2197),
  "primary/aalto-se-white-question.pdf": (ratio: 1.2791, l: 0.1650, r: 0.1650, t: 0.2047, b: 0.2197),
  "primary/aalto-se-white-quote.pdf": (ratio: 1.2791, l: 0.1650, r: 0.1650, t: 0.2047, b: 0.2197),
  "primary/aalto-white-exclaim.pdf": (ratio: 1.1410, l: 0.1850, r: 0.1800, t: 0.2054, b: 0.2013),
  "primary/aalto-white-question.pdf": (ratio: 1.1410, l: 0.1850, r: 0.1800, t: 0.2054, b: 0.2013),
  "primary/aalto-white-quote.pdf": (ratio: 1.1410, l: 0.1850, r: 0.1800, t: 0.2054, b: 0.2013),
  "scicomp/asc-background.svg": (ratio: 0.9899, l: 0.0000, r: 0.0000, t: 0.0000, b: 0.0002),
  "scicomp/asc-black.svg": (ratio: 0.9899, l: 0.0000, r: 0.0000, t: 0.0000, b: 0.0002),
  "scicomp/asc-white.svg": (ratio: 0.9899, l: 0.0000, r: 0.0000, t: 0.0000, b: 0.0002),
  "secondary/aalto-fi-se-en-black-exclaim.pdf": (ratio: 1.0872, l: 0.1650, r: 0.1650, t: 0.1740, b: 0.1574),
  "secondary/aalto-fi-se-en-black-question.pdf": (ratio: 1.0872, l: 0.1650, r: 0.1650, t: 0.1740, b: 0.1574),
  "secondary/aalto-fi-se-en-black-quote.pdf": (ratio: 1.0872, l: 0.1650, r: 0.1650, t: 0.1740, b: 0.1574),
  "secondary/aalto-fi-se-en-white-exclaim.pdf": (ratio: 1.0872, l: 0.1650, r: 0.1650, t: 0.1740, b: 0.1574),
  "secondary/aalto-fi-se-en-white-question.pdf": (ratio: 1.0872, l: 0.1650, r: 0.1650, t: 0.1740, b: 0.1574),
  "secondary/aalto-fi-se-en-white-quote.pdf": (ratio: 1.0872, l: 0.1650, r: 0.1650, t: 0.1740, b: 0.1574),
  "tertiary/aalto-fi-se-en-black-exclaim.pdf": (ratio: 2.9238, l: 0.0850, r: 0.0850, t: 0.2631, b: 0.2106),
  "tertiary/aalto-fi-se-en-black-question.pdf": (ratio: 3.0558, l: 0.0800, r: 0.0800, t: 0.2597, b: 0.2055),
  "tertiary/aalto-fi-se-en-black-quote.pdf": (ratio: 3.0108, l: 0.0850, r: 0.0800, t: 0.2559, b: 0.2022),
  "tertiary/aalto-fi-se-en-white-exclaim.pdf": (ratio: 2.9238, l: 0.0850, r: 0.0850, t: 0.2631, b: 0.1960),
  "tertiary/aalto-fi-se-en-white-question.pdf": (ratio: 3.0558, l: 0.0800, r: 0.0800, t: 0.2597, b: 0.2055),
  "tertiary/aalto-fi-se-en-white-quote.pdf": (ratio: 3.0108, l: 0.0850, r: 0.0800, t: 0.2559, b: 0.2022),
)
