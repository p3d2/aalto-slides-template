// ── this deck's helper set — the tweak layer (see kit/deckkit.typ) ─────────
// Every builder below is data-in, layout-out: change a title, cut a round,
// rename a figure — never re-flow a slide.
//
// After adding / renaming / replacing anything in figures/, re-run:
//     python3 kit/scan-figures.py decks/20261105_Planning_research_data_management_with_AI
// Slides reference figures by *name* (the manifest knows the extension), so a
// vector export silently replaces a raster one, and a missing name renders a
// labelled placeholder instead of breaking the build.

#import "../../kit/deckkit.typ": make-deck

// Three prompt/answer rounds + a takeaway do not fit at the kit default card
// size; one knob, every chat slide follows.
#let d = make-deck(json("figures/manifest.json"), k: (card-size: 0.62em))
//
// Knobs (defaults in kit/deckkit.typ):
//   fig-h 3in · img-h 5.2em · ladder-h 4.2em · single-h 6.2em   figure heights
//   body-h 10.4cm       the measured content area under a heading at "default"
//   reveal false        results / prompt rounds appear on a click
//   show-source true    false hides every credit line (clean rehearsal deck)
//   prompt-label · answer-label · card-size

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
