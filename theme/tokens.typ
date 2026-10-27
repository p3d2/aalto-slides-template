// ─────────────────────────────────────────────────────────────────────────────
// GENERATED FILE — do not edit by hand.
// Aalto design tokens as Typst constants, produced from the official brand
// library tokens (brand.aalto.fi) by
//   reference/brand-aalto-fi/build_tokens.py
// Source: reference/brand-aalto-fi/tokens/design-tokens*.json
// px→pt at 1px = 0.75pt. See reference/brand-aalto-fi/notes/design-tokens.md.
// ─────────────────────────────────────────────────────────────────────────────

// Brand (university) colours
#let brand-colours = (
  aaltoRed1: rgb("#fd6360"),
  aaltoRed2: rgb("#501f1e"),
  aaltoYellow1: rgb("#f7e159"),
  aaltoYellow2: rgb("#6c6227"),
  aaltoBlue1: rgb("#46a5ff"),
  aaltoBlue2: rgb("#183856"),
  aaltoBlack1: rgb("#000000"),
  aaltoBlack2: rgb("#e0e0e0"),
)

// School signature colours — use only for that school's material
#let school-colours = (
  eng1: rgb("#dc6ade"),
  eng2: rgb("#472247"),
  elec1: rgb("#a987ff"),
  elec2: rgb("#392d56"),
  chem1: rgb("#5dd089"),
  chem2: rgb("#255236"),
  arts1: rgb("#ffc341"),
  arts2: rgb("#6c531b"),
  biz1: rgb("#9bd84c"),
  biz2: rgb("#3f581f"),
  sci1: rgb("#ff8d4f"),
  sci2: rgb("#5f341d"),
)

// Neutrals (the design system uses neutral.8 as "black", neutral.9 is pure black)
#let neutral-colours = (
  "1": rgb("#ffffff"),
  "2": rgb("#fafafa"),
  "3": rgb("#f2f2f2"),
  "4": rgb("#e0e0e0"),
  "5": rgb("#505050"),
  "6": rgb("#212121"),
  "7": rgb("#1c1c1c"),
  "8": rgb("#151515"),
  "9": rgb("#000000"),
  white: rgb("#ffffff"),
  black: rgb("#151515"),
)

// Tints: darker variants of the brand/school colours
#let tint-colours = (
  whiteTint1: rgb("#e5e5e5"),
  whiteTint2: rgb("#d9d9d9"),
  whiteTint3: rgb("#cccccc"),
  whiteTint4: rgb("#999999"),
  blackTint1: rgb("#2c2c2c"),
  blackTint2: rgb("#383838"),
  blackTint3: rgb("#444444"),
  blackTint4: rgb("#737373"),
  aaltoRedTint1: rgb("#e45956"),
  aaltoRedTint2: rgb("#d75452"),
  aaltoRedTint3: rgb("#ca4f4d"),
  aaltoRedTint4: rgb("#983b3a"),
  aaltoYellowTint1: rgb("#deca50"),
  aaltoYellowTint2: rgb("#d2bf4c"),
  aaltoYellowTint3: rgb("#c6b447"),
  aaltoYellowTint4: rgb("#948735"),
  aaltoBlueTint1: rgb("#3f94e5"),
  aaltoBlueTint2: rgb("#3c8cd9"),
  aaltoBlueTint3: rgb("#3884cc"),
  aaltoBlueTint4: rgb("#2a6399"),
  aaltoBlackTint1: rgb("#1a1a1a"),
  aaltoBlackTint2: rgb("#262626"),
  aaltoBlackTint3: rgb("#333333"),
  aaltoBlackTint4: rgb("#666666"),
  engTint1: rgb("#c65fc8"),
  engTint2: rgb("#bb5abd"),
  engTint3: rgb("#b055b2"),
  engTint4: rgb("#844085"),
  elecTint1: rgb("#987ae5"),
  elecTint2: rgb("#9073d9"),
  elecTint3: rgb("#876ccc"),
  elecTint4: rgb("#655199"),
  chemTint1: rgb("#54bb7b"),
  chemTint2: rgb("#4fb174"),
  chemTint3: rgb("#4aa66e"),
  chemTint4: rgb("#387d52"),
  artsTint1: rgb("#e5af3b"),
  artsTint2: rgb("#d9a637"),
  artsTint3: rgb("#cc9c34"),
  artsTint4: rgb("#997527"),
  bizTint1: rgb("#8bc244"),
  bizTint2: rgb("#84b841"),
  bizTint3: rgb("#7cad3d"),
  bizTint4: rgb("#5d822e"),
  sciTint1: rgb("#e57f47"),
  sciTint2: rgb("#d97843"),
  sciTint3: rgb("#cc713f"),
  sciTint4: rgb("#99552f"),
)

// Atomic type scale (pt)
#let font-sizes = (
  "1": 10.5pt,
  "2": 12.0pt,
  "3": 13.5pt,
  "4": 15.0pt,
  "5": 18.0pt,
  "6": 24.0pt,
  "7": 48.0pt,
)

#let line-heights = (
  "1": 12.0pt,
  "2": 18.0pt,
  "3": 21.0pt,
  "4": 24.0pt,
  "5": 30.0pt,
  "6": 36.0pt,
  "7": 54.0pt,
)

#let letter-spacings = (
  "1": 0.0pt,
  "2": -0.75pt,
  "3": -1.5pt,
)

// Spacing scale (pt)
#let spacing = (
  "1": 3.0pt,
  "2": 6.0pt,
  "3": 12.0pt,
  "4": 18.0pt,
  "5": 24.0pt,
  "6": 30.0pt,
  "7": 36.0pt,
  "8": 42.0pt,
  "9": 48.0pt,
  "10": 60.0pt,
  "11": 72.0pt,
  "12": 84.0pt,
  "13": 96.0pt,
)

// Composite type styles, desktop values (the web "media:desktop" tier,
// which is the right reference for a full-screen slide).
#let type-styles = (
  title: (
    h1: (size: 48pt, leading: 54pt, tracking: -1.5pt, weight: "bold"),
    h2: (size: 24pt, leading: 36pt, tracking: -0.75pt, weight: "bold"),
    h3: (size: 18pt, leading: 21pt, tracking: 0pt, weight: "bold"),
  ),
  body: (
    extra_large: (size: 18pt, leading: 30pt, tracking: 0pt, weight: "regular"),
    large: (size: 15pt, leading: 24pt, tracking: 0pt, weight: "regular"),
    default: (size: 13.5pt, leading: 21pt, tracking: 0pt, weight: "regular"),
    default_bold: (size: 13.5pt, leading: 21pt, tracking: 0pt, weight: "bold"),
    small: (size: 12pt, leading: 18pt, tracking: 0pt, weight: "regular"),
    small_bold: (size: 12pt, leading: 18pt, tracking: 0pt, weight: "bold"),
    extra_small: (size: 10.5pt, leading: 12pt, tracking: 0pt, weight: "regular"),
    code: (size: 13.5pt, leading: 21pt, tracking: 0pt, weight: "regular"),
    condensed: (size: 13.5pt, leading: 18pt, tracking: 0pt, weight: "regular"),
    button: (size: 12pt, leading: 12pt, tracking: 0pt, weight: "bold"),
    accent: (size: 15pt, leading: 18pt, tracking: 0pt, weight: "bold"),
  ),
)

// Aspect ratios from the tokens (hd = the slide canvas)
#let aspects = (
  hd: 16 / 9,
  sd: 4 / 3,
  cinemascope: 2.35 / 1,
  hdPortrait: 9 / 16,
  sdPortrait: 3 / 4,
  cinemascopePortrait: 1 / 2.35,
  square: 1 / 1,
)
