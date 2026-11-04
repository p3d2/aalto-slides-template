// ── Planning research data management with AI ──────────────────────────────

#import "@preview/touying:0.8.0": *
#import "../../theme/aalto.typ": *

#show: aalto-theme.with(
  accent: aalto-blue, // university-level webinar (not one school's material)
  // density: "roomy" overflows this two-line title onto a second page (the
  // title block is 2.2em + fixed spacing vs a ~19.7em page at 24pt base) —
  // keep "default" (20pt) or shorten the title before switching back.
  density: "compact",
  hex: (text: "RDM\n \n&\n \nOpen\n Science", thanks: true, sections: "numbers"),
  // hex: "plan+AI", // light | dark — pick one
  // mark: "exclaim", // question (A?) | quote (A") | exclaim (A!) — pick one
  config-info(
    title: [Planning research data management with AI],
    subtitle: [The Aalto AI Data Management Assistant],
    author: [Pedro Santos Silva, PhD · Aalto Scientific Computing],
    date: datetime(year: 2026, month: 11, day: 3),
    institution: [Aalto University],
    short-title: none,
    // A *path*, not image(): the theme sizes the visible lock-up and ink-aligns
    // it to the margins. Paths start at the project root — "/assets/…".
    logo: "/assets/logo/primary/aalto-black-quote.pdf",
  ),
)

// The wide trilingual lock-up top-left, like the official template.
// The two-line talk title + subtitle + meta block is ~0.5em taller than the
// theme's fixed 3.2em bottom margin allows, so the meta line overflowed onto
// a second page — tighten the bottom margin for this slide only.
#title-slide(
  config: config-page(margin: (top: 3.2em, bottom: 1.6em, x: 2.6em)),
  logo: "/assets/logo/tertiary/aalto-fi-se-en-black-quote.pdf",
)

// One file per framing segment (lecture-framing.md §60-min structure).
// Restructured 2026-11-02: the two live demos share 04-demo.typ (ChatBot, then
// Terra), and the wrap-up takeaways moved into 07. Segments 5 and 6 have no
// file of their own yet — add the include back when they do.
#include "sections/01-dmp-problem.typ"   // 5 min  — opening + poll
#include "sections/02-what-it-is.typ"    // 8 min  — assistant = prompt + files
#include "sections/03-two-tools.typ"     // 8 min  — models + setup workflow
#include "sections/04-demo.typ"          // 20 min — live demos: ChatBot, then Terra
#include "sections/05-limits-and-takeaways.typ" // 7 min — limits, safe use, takeaways

// Closing slide: oversized bare logomark, like Aalto's own "Thank you".
// It stays on screen through the Q&A, so the links live here rather than only
// on the wrap-up slide. `contact` = who to write to, `info` = where things are.
#thanks-slide(
  word: [Kiitos!],
  contact: (
    [*Pedro Santos Silva* · Aalto Scientific Computing],
    [pedro.silva\@aalto.fi],
    [Enrico Glerean, Antti Rousi, Jannika Rinnejärvi, Emrecan Gulay]
  ),
  info: [
    #link("https://ai.aalto.fi/")[*ai.aalto.fi*] -- Aalto AI Assistant #linebreak()
    #link("https://ai.aalto.fi/promptbook")[*Prompt Book*] -- the master prompt #linebreak()
    #link("https://www.aalto.fi/en/services/aalto-project-list")[*APL*] -- where the DMP lives #linebreak()
    #link("https://www.aalto.fi/en/services/aalto-ai-assistant")[*What may go in*] -- the rules #linebreak()
    #link("mailto:researchdata@aalto.fi")[*researchdata\@aalto.fi*] -- data support
  ],
)
