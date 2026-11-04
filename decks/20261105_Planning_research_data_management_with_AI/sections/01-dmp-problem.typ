// ── 1 · Opening: the DMP problem — 5 min ───────────────────────────────────
// From lecture-framing.md: DMPs written too late, alone, in "funder language".
// One-slide positioning: Assistant = coach · APL = system of record · you stay
// in control. Opening poll: who has written a DMP? who uses APL?
// TODO (outline OK first): turn each `==` into a claim, then write bodies.
#import "../../../theme/aalto.typ": *
// Shared deck palette (neutral surfaces, hairlines, body inks) — brand tokens
// from theme/tokens.typ, so a section file never invents an rgb() of its own.
#import "../../../kit/deckkit.typ": fill-card-soft, line-hair, ink-body, ink-emph, poll-body

== Which task keeps bothering you?

#v(2em)
#poll-body(
  options: (
    text(size: 0.82em)[Knowing which file is the latest version],
    text(size: 0.82em)[Writing down the details of an experiment/simulation],
    text(size: 0.82em)[Filling the DMP form for a proposal],
    text(size: 0.82em)[Answering others *where's your data?*],
  ),
  join: "https://presemo.aalto.fi/rdmwai/",
  columns: 1,   // four stacked options read better next to the QR than 2×2
  hint: [Anonymous. You can vote for more than one option.],
)

== Why DMPs feel like an unwanted chore

#align(center, [DMPs are often written])
#grid(
  columns: 3,
  column-gutter: 3.5em,
  figure(image("../figures/aiDMP1.pdf", width: 90%,
          alt: "Cartoon: a researcher clutching their head at a submission countdown showing 42 seconds; on the checklist behind them, field breakthrough and page limit are ticked and Data Management Plan is not."),
          caption: [too late...], numbering: none),
  figure(image("../figures/aiDMP2.pdf", width: 90%,
          alt: "Cartoon: a researcher at a laptop picturing the project timeline — year 1 known at about 50 GB of documents and statistics, years 2 to 4 question marks for volume, data type, sensitivity and openness."),
          caption: [alone...], numbering: none),
  figure(image("../figures/aiDMP3.pdf", width: 90%,
          alt: "Cartoon: a researcher in a lab reading a DMP that quotes “in accordance with the interoperability provisions”, wondering whether the data goes to the cloud or on a USB stick."),
          caption: [in funder language...], numbering: none),
)
// Pedro 2026-11-02: the outcome line is not needed — the three captions
// carry the claim. Commented, not deleted, in case the dry run misses it.
// #align(center, [*Outcome:* a compliance exercise, not a plan researchers actually use!])

// Small gray credit line, pinned to the bottom and bottom-aligned with the
// corner logo and the page number (the theme's `credit-line` drops the text
// box — descenders included — onto the logo's ink bottom edge).
#credit-line[Images © 2026 Pedro Silva. Licensed under CC BY 4.0.]

== What to consider when starting a project

#v(-2em)
#{
  let c-header = aalto-dark                 // pillar header bar
  let c-title  = aalto-black                // card titles
  let c-border = line-hair                  // card + panel hairline
  let c-bg     = fill-card-soft             // pillar panel fill
  let c-body   = ink-body                   // card copy
  let c-sub    = neutral-colours.at("4")    // pillar subtitle, ON the dark bar

  let c-blue = tint-colours.aaltoBlueTint4   // I   People & Culture
  let c-gold = tint-colours.aaltoYellowTint4 // II  Data Architecture
  let c-navy = ink-emph                      // III Tech & Workflows (blue.2)
  let c-red  = tint-colours.aaltoRedTint4    // IV  Trust & Openness

  // Individual checklist card (stretches evenly via 1fr row height)
  let rdm-card(num, title, accent, body) = block(
    width: 100%,
    height: 100%,
    fill: white,
    stroke: (left: 2.5pt + accent, rest: 0.5pt + c-border),
    radius: (right: 3pt, left: 0pt),
    inset: (x: 7pt, y: 5pt),
    [
      #grid(
        columns: (auto, 1fr),
        column-gutter: 5pt,
        align: horizon,
        box(
          fill: accent,
          radius: 1.5pt,
          inset: (x: 4pt, y: 2pt),
          text(fill: white, weight: "bold", size: 9pt)[#num]
        ),
        text(weight: "bold", size: 9pt, fill: c-title, tracking: -0.1pt)[#title]
      )
      #set text(size: 8pt, fill: c-body)
      #set par(leading: 0.6em)
      #v(-2em)
      #body
    ]
  )

  // Architectural Pillar with solid top bar & Equal-Height (1fr) card distribution
  let pillar(roman, title, subtitle, accent, c1, c2, c3) = block(
    width: 100%,
    height: 100%,
    fill: c-bg,
    stroke: (top: 3.5pt + accent, rest: 0.5pt + c-border),
    radius: (bottom: 4pt, top: 0pt),
    inset: 5.5pt,
    grid(
      columns: (1fr,),
      rows: (auto, 1fr, 1fr, 1fr),
      row-gutter: 5pt,
      block(
        width: 100%,
        fill: c-header,
        radius: 2.5pt,
        inset: (x: 7pt, y: 4.5pt),
        [
          #grid(
            columns: (auto, 1fr),
            column-gutter: 5pt,
            align: horizon,
            text(fill: accent.lighten(25%), weight: "black", size: 14pt)[#roman],
            text(fill: white, weight: "bold", size: 11pt, tracking: 0.4pt)[#upper(title)]
          )
          #v(-15pt)
          #text(fill: c-sub, size: 9pt)[#subtitle]
        ]
      ),
      c1,
      c2,
      c3,
    )
  )

  // Master 4-Column Container (fills 100% of the 3/4 vertical slide box)
  block(
    width: 100%,
    height: 82%,
    grid(
      columns: (1fr, 1fr, 1fr, 1fr),
      rows: (1fr,),
      column-gutter: 7pt,

      // PILLAR I
      pillar("I", "People & Culture", "Accountability, skills & budget", c-blue,
        rdm-card("01", "Roles & Responsibilities", c-blue, [
          - *PI* $->$ ultimate accountability, allocates resources
          - Data, lab & equip managers, on(off)boarding, ...
          - *Aalto services* & set communication channels
        ]),
        rdm-card("02", "Training & support", c-blue, [
          - Schedule annual RDM refresh; invite *Aalto Services* experts for targeted training
          - Complete *Workday* trainings
          - Periodic group newsletter + RDM trainings
        ]),
        rdm-card("03", "Budget & resources", c-blue, [
          - *Estimate:*
            - storage ($"TB" times "time" = "€€€"$)
            - staff time for curation and trainings
            - repository fees
        ])
      ),

      // PILLAR II
      pillar("II", "Data Architecture", "Inventory, metadata & structure", c-gold,
        rdm-card("04", "Data inventory", c-gold, [
          - List data types, volume estimated, sensitivity level, ...
        ]),
        rdm-card("05", "Documentation & metadata", c-gold, [
          - Set minimum practice per dataset; adopt discipline standard
          - Mandatory metadata by experiments
          - Assign persistent IDs when publishing
          - Use (e-)lab notebooks, logbooks & inventory tools
        ]),
        rdm-card("06", "File- & folder-structure rules", c-gold, [
          - Define common rules for group storing data
        ])
      ),

      // PILLAR III
      pillar("III", "Tech & Workflows", "Pipelines, storage & retention", c-navy,
        rdm-card("07", "Version control & workflows", c-navy, [
          - Use *Git/Gitlab* for code
          - Define experiment pipelines (keep raw data intact): \
            #v(1.5pt)
            `raw` $->$ `processing` $->$ `analysis` $->$ `production`
        ]),
        rdm-card("08", "Storage & backup", c-navy, [
          - Use *approved Aalto services only*; no research data on personal laptops
          - Use appropriate spaces (sensitive data, backups in place, ...)
        ]),
        rdm-card("09", "Long-term preservation", c-navy, [
          - Set rules for deleting or keeping data, and the amount of time
          - Set *data cleaning days*
        ])
      ),

      // PILLAR IV
      pillar("IV", "Trust & Openness", "Ethics, access & FAIR sharing", c-red,
        rdm-card("10", "Ethics & legal", c-red, [
          - Check for *GDPR*, chemical hazard, and other risk-assessments
          - Record license / IP owner for every dataset
          - Plan embargo and anonymization if needed
        ]),
        rdm-card("11", "Security & access control", c-red, [
          - Set a role-based permission system
          - Remove leavers promptly
        ]),
        rdm-card("12", "Sharing & publication", c-red, [
          - *FAIR-compliance*; attach `README` + metadata
          - Add data availability statements to papers
        ])
      )
    )
  )
}
#credit-line[Read more at #link("https://www.aalto.fi/en/services/research-data-management-rdm")[*aalto.fi/en/services/research-data-management-rdm*]]

