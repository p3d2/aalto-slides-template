// ── 1 · Opening: the DMP problem — 5 min ───────────────────────────────────
// From lecture-framing.md: DMPs written too late, alone, in "funder language".
// One-slide positioning: Assistant = coach · APL = system of record · you stay
// in control. Opening poll: who has written a DMP? who uses APL?
// TODO (outline OK first): turn each `==` into a claim, then write bodies.
#import "../../../theme/aalto.typ": *

= The DMP problem

// Poll slide (announce link/question here when the poll format is decided)
== Opening poll: where are you?

- Who has written a DMP? Who uses APL?

== Why DMPs feel like an unwanted chore

#align(center, [DMPs are often written])
#grid(
  columns: 3,
  column-gutter: 3.5em,
  figure(image("../figures/aiDMP1.pdf", width: 90%,
          alt: "Cartoon showing a researcher desperate to submit a proposal, with 42 seconds left, and no data management plan yet."),
          caption: [too late...], numbering: none),
  figure(image("../figures/aiDMP2.pdf", width: 90%,
          alt: "Cartoon: a lone researcher at a laptop, trying to guess the volume, sensitivity and retention of four years of unknown data."),
          caption: [alone...], numbering: none),
  figure(image("../figures/aiDMP3.pdf", width: 90%,
          alt: "Cartoon: a researcher reading a DMP form full of funder jargon, wondering between a cloud service or a USB stick."),
          caption: [in funder language...], numbering: none),
)
#align(center, [*Outcome:* a compliance exercise, not a plan researchers actually use!])

// Small gray credit line, pinned to the bottom and bottom-aligned with the
// corner logo and the page number (the theme's `credit-line` drops the text
// box — descenders included — onto the logo's ink bottom edge).
#credit-line[Images © 2026 Pedro Silva. Licensed under CC BY 4.0.]

== What to consider when starting a project

#v(-2em)
#{
  // Official high-contrast architectural palette
  let c-ink    = rgb("#1A1A1A")
  let c-slate  = rgb("#475569")
  let c-border = rgb("#CBD5E1")
  let c-bg     = rgb("#F8FAFC")

  let c-blue   = rgb("#0055A5") // Pillar 1: Governance & Resources
  let c-teal   = rgb("#008272") // Pillar 2: Structure & Metadata
  let c-navy   = rgb("#002D5A") // Pillar 3: Workflows & Storage
  let c-red    = rgb("#EE3124") // Pillar 4: Compliance & Openness

  // Compact inline technical tag for pipelines/code.
  // Fonts must exist for Typst — it does NOT resolve generic "monospace".
  // Source Code Pro is the brand code face, bundled in fonts/ (variable, like
  // Inter); DejaVu Sans Mono is the system fallback.
  let tag(txt) = box(
    fill: rgb("#F1F5F9"),
    stroke: 0.5pt + rgb("#94A3B8"),
    radius: 2pt,
    inset: (x: 3.5pt, y: 1.5pt),
    baseline: 10%,
    text(font: ("Source Code Pro", "DejaVu Sans Mono"), size: 6.4pt, weight: "medium", fill: c-ink, txt)
  )

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
          text(fill: white, weight: "bold", size: 6.8pt)[#num]
        ),
        text(weight: "bold", size: 8.2pt, fill: c-ink, tracking: -0.1pt)[#title]
      )
      #set text(size: 7.2pt, fill: rgb("#334155"))
      #set par(leading: 0.36em)
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
        fill: c-ink,
        radius: 2.5pt,
        inset: (x: 7pt, y: 4.5pt),
        [
          #grid(
            columns: (auto, 1fr),
            column-gutter: 5pt,
            align: horizon,
            text(fill: accent.lighten(25%), weight: "black", size: 8pt)[#roman],
            text(fill: white, weight: "bold", size: 8pt, tracking: 0.4pt)[#upper(title)]
          )
          #v(-10pt)
          #text(fill: rgb("#94A3B8"), size: 6.5pt)[#subtitle]
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
    height: 80%,
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
        rdm-card("11", "Training & support", c-blue, [
          - Schedule annual RDM refresh; invite *Aalto Services* experts for targeted training
          - Complete *Workday* trainings
          - Periodic group newsletter + RDM trainings
        ]),
        rdm-card("12", "Budget & resources", c-blue, [
          - *Estimate:*
            - storage ($"TB" times "time" = "€€€"$)
            - staff time for curation and trainings
            - repository fees
        ])
      ),

      // PILLAR II
      pillar("II", "Data Architecture", "Inventory, metadata & structure", c-teal,
        rdm-card("02", "Data inventory", c-teal, [
          - List data types, volume estimated, sensitivity level, ...
        ]),
        rdm-card("03", "Documentation & metadata", c-teal, [
          - Set minimum #tag("README") per dataset; adopt discipline standard
          - Mandatory metadata fields by experiments
          - Assign persistent IDs when publishing
          - Use (e-)lab notebooks, logbooks & inventory tools
        ]),
        rdm-card("04", "File- & folder-structure rules", c-teal, [
          - Define common rules for group storing data
        ])
      ),

      // PILLAR III
      pillar("III", "Tech & Workflows", "Pipelines, storage & retention", c-navy,
        rdm-card("05", "Version control & workflows", c-navy, [
          - Use *Git/Gitlab* for code
          - Define experiment pipelines (keep raw data intact): \
            #v(1.5pt)
            #tag("raw") $->$ #tag("processing") $->$ #tag("analysis") $->$ #tag("production")
        ]),
        rdm-card("06", "Storage & backup", c-navy, [
          - Use *approved Aalto services only*; no research data on personal laptops
          - Use appropriate spaces (sensitive data, backups in place, ...)
        ]),
        rdm-card("07", "Long-term preservation", c-navy, [
          - Set rules for deleting or keeping data, and the amount of time
          - Set *data cleaning days*
        ])
      ),

      // PILLAR IV
      pillar("IV", "Trust & Openness", "Ethics, access & FAIR sharing", c-red,
        rdm-card("09", "Ethics & legal", c-red, [
          - Check for *GDPR*, chemical hazard, and other risk-assessments
          - Record license / IP owner for every dataset
          - Plan embargo and anonymization if needed
        ]),
        rdm-card("10", "Security & access control", c-red, [
          - Set a role-based permission system
          - Remove leavers promptly
        ]),
        rdm-card("08", "Sharing & publication", c-red, [
          - *FAIR-compliance*; attach #tag("README") + metadata
          - Add data availability statements to papers
        ])
      )
    )
  )
}
#credit-line[Read more at #link("https://www.aalto.fi/en/services/research-data-management-rdm")[*aalto.fi/en/services/research-data-management-rdm*]]

