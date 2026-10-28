// ── Planning research data management with AI ──────────────────────────────
// Aalto AI Data Management Assistant webinar — Thu 5 Nov 2026, 13:00–14:30
// (60 min lecture + 30 min Q&A) · planner task TASK-015
// Source of truth for structure: ~/projects/aalto-ai-dm-assistant-webinar/
//   lecture-framing.md (8 segments) — fill OUTLINE.md, get Pedro's OK,
//   THEN write slide bodies. Build: ./slides deck 20261105_Planning_research_data_management_with_AI
//   Watch:  ./slides watch-deck 20261105_Planning_research_data_management_with_AI

#import "@preview/touying:0.8.0": *
#import "../../theme/aalto.typ": *

#show: aalto-theme.with(
  accent: aalto-blue, // university-level webinar (not one school's material)
  // density: "roomy" overflows this two-line title onto a second page (the
  // title block is 2.2em + fixed spacing vs a ~19.7em page at 24pt base) —
  // keep "default" (20pt) or shorten the title before switching back.
  density: "default",
  // mark: "exclaim", // question (A?) | quote (A") | exclaim (A!) — pick one
  config-info(
    title: [Planning research data management with AI],
    subtitle: [The Aalto AI Data Management Assistant],
    author: [Pedro Santos Silva],
    date: datetime(year: 2026, month: 11, day: 5),
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

// One file per framing segment (lecture-framing.md §60-min structure):
#include "sections/01-dmp-problem.typ"   // 5 min  — opening + poll
#include "sections/02-what-it-is.typ"    // 8 min  — assistant = prompt + files
#include "sections/03-two-tools.typ"     // 8 min  — ChatGPT vs aalto.fi chatbot
#include "sections/04-demo-one.typ"      // 10 min — live demo: the conversation
#include "sections/05-good-user.typ"     // 7 min  — how to work with it
#include "sections/06-demo-two-apl.typ"  // 10 min — live demo: chat → APL
#include "sections/07-privacy-limits.typ"// 7 min  — what NOT to paste
#include "sections/08-wrapup.typ"        // 5 min  — takeaways + QR/links

// Closing slide: oversized bare logomark, like Aalto's own "Thank you".
#thanks-slide(
  word: [Kiitos!],
  contact: (
    "Pedro Santos Silva · Aalto University",
    "TODO@aalto.fi · https://ai.aalto.fi/", // TODO: real contact lines
  ),
)
