// ── this deck's helper set — the tweak layer (see kit/deckkit.typ) ──────────
// Figures are referenced by *name* — fig("swiss_researcher") — and resolved
// via figures/manifest.json. After adding / renaming / replacing anything in
// figures/, re-run:
//     python3 kit/scan-figures.py decks/20261126_ASC_ppt
// A missing name renders a labelled placeholder instead of breaking the build.

#import "../../kit/deckkit.typ": make-deck

#let d = make-deck(json("figures/manifest.json"))
#let fig = d.fig
#let K = d.K
