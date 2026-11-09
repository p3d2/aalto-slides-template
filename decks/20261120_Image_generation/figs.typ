// ── this deck's helper set — the tweak layer (see kit/deckkit.typ) ──────────
// Every slide builder below is data-in, layout-out: change a title, cut a
// round, rename a figure — never re-flow a slide.
//
// After adding / renaming / replacing anything in figures/, re-run:
//     python3 kit/scan-figures.py decks/20261120_Image_generation
// Slides reference figures by *name* (the manifest knows the extension), so a
// vector export silently replaces a raster one, and a missing name renders a
// labelled placeholder instead of breaking the build.

#import "../../kit/deckkit.typ": make-deck
// `cast` is the size-free shadow wrapper — one word, in any context:
//   #cast(image("x.png", height: 10em))              a picture
//   #figure(cast(image("x.pdf", width: 100%)), caption: […])
//   #cast[ <a table, a code card, anything> ]
// (There is deliberately no `show image` rule: it leaks into the theme's page
// background and rings the corner logo — measured, see kit/deckkit.typ.)
#import "../../kit/deckkit.typ": cast

// card-size is pinned to 0.6em because that is what this deck has ALWAYS
// rendered: until 2026-11-02 the kit hard-coded the card body size and ignored
// the knob. The knob now works, and 0.6em keeps every chat slide exactly as
// rehearsed (the kit default 0.74em would re-flow them).
#let d = make-deck(json("figures/manifest.json"), k: (card-size: 0.6em))
//
// Want to retune the deck? Pass knobs to make-deck — one line, no layout edits:
//   #let d = make-deck(json("figures/manifest.json"), k: (img-h: 6em, reveal: true))
// Knobs (defaults in kit/deckkit.typ):
//   img-h 5.2em · ladder-h 4.2em · single-h 6.2em   figure heights
//   reveal false        results / prompt rounds appear on a click
//   show-source true    false hides every credit line (clean rehearsal deck)
//   prompt-label · answer-label · card-size
//   fig-shadow none     true = the kit `cast` behind every figure. Left off here
//                       and asked for per slide instead (`shadow: true`), because
//                       it grows each box by 4.5pt and a light ring on an accent
//                       slide is a frame, not a shadow.
//   Or wrap anything yourself, no size needed:
//     #cast(image("x.png", height: 10em))
//     #figure(cast(image("x.pdf", width: 100%)), caption: […])

#let fig = d.fig
#let cell = d.cell
#let pair = d.pair
#let ladder = d.ladder
#let row = d.row
#let shot = d.shot
#let shots = d.shots
#let in-out = d.in-out
#let room = d.room
#let K = d.K
#let promptline = d.promptline
#let answerline = d.answerline
#let pill = d.pill
#let pills = d.pills
#let code-block = d.code-block
#let ic = d.ic
#let takeaway = d.takeaway
#let verdict = d.verdict
#let spec-table = d.spec-table
#let note = d.note
#let credit = d.credit
#let example = d.example
#let chat-example = d.chat-example
