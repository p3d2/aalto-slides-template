// ── ASC deck — slide bodies ──────────────────────────────────────────────────
// Headings drive the deck: `== Title` → one slide (the demo convention — no
// `#slide[...]` wrapper needed; `#only`/`#pause` sit directly under the
// heading). Colours come from the brand tokens via kit/deckkit.typ's palette;
// figures are referenced by *name* via figs.typ (figures/manifest.json).
//
// Design rules for this deck:
//   · one accent (CHEM green — this is CHEM material) for highlights:
//     active states, badges, section slides; structure (numbers, links,
//     eyebrows) = ink-emph navy; cards/dividers = the neutral palette
//   · deliberate exception: the service-tier timeline gives each tier one
//     school colour as an identity (a spectrum of services, not affiliation)
//   · never ad-hoc rgb() — everything from the brand tokens
#import "../../../theme/aalto.typ": *
#import "../../../kit/deckkit.typ": *
#import "../figs.typ": *

// ── deck accent (CHEM) ───────────────────────────────────────────────────────
#let accent = school-colours.chem
#let accent-dark = school-colours-dark.chem
#let accent-pale = accent.lighten(85%)

// ── 1 · Common pitfalls — three subslides, one spotlight figure each ─────────

#let step-item(n, title, subtitle, active) = {
  let selected = n == active
  let upcoming = n > active
  box(
    width: 100%,
    radius: 6pt,
    fill: if selected { accent.lighten(88%) } else { fill-card },
    stroke: if selected { 1.5pt + accent } else { none },
    inset: 0.55em,
    stack(
      dir: ttb,
      spacing: 0.15em,
      text(
        size: 0.65em,
        weight: "bold",
        fill: if upcoming { ink-muted } else { aalto-black },
      )[#title],
      text(
        size: 0.48em,
        fill: if upcoming { ink-muted } else { ink-body },
      )[#subtitle],
    ),
  )
}

#let spotlight-scene(active) = {
  let imgs = ("swiss_researcher", "2res1pro", "knowledge_loss")
  v(0.45em)
  grid(
    columns: (1fr, 1.5fr),
    column-gutter: 1.15em,
    align: horizon,

    // Left: the three pitfalls, the active one spotlighted in the accent
    stack(
      dir: ttb,
      spacing: 0.5em,
      step-item(
        1,
        [1. Too many hats],
        [We hire people to do science, but expect them to be their own IT support, data manager, and AI expert.],
        active,
      ),
      step-item(
        2,
        [2. Two Labs, same headache],
        [Two groups a floor apart can lose weeks stuck on the exact same problem.],
        active,
      ),
      step-item(
        3,
        [3. Disconnected starts],
        [A student / PhD / Postdoc takes long to train and leaves data and code behind nobody else understands.],
        active,
      ),
    ),

    // Right: uncluttered visual stage for the current figure
    box(
      width: 100%,
      height: 8.8cm,
      align(center + horizon)[
        #fig(imgs.at(active - 1), w: 95%, h: 95%)
      ],
    ),
  )
}

== Common pitfalls of research

#only(1, spotlight-scene(1))
#only(2, spotlight-scene(2))
#only(3, spotlight-scene(3))

// ── 2 · What we deliver — statement + metric, numbered list ──────────────────

== We make research faster and better

#v(0.7em)
#grid(
  columns: (1fr, 1.35fr),
  column-gutter: 1.55em,
  align: top + left,

  // LEFT: editorial statement + sober metric card
  stack(
    dir: ttb,
    spacing: 0.9em,
    stack(
      dir: ttb,
      spacing: 0.45em,
      block(
        text(size: 0.8em, weight: "bold", fill: aalto-black)[
          There is too much information for one person to master all of computing and lead their own research.
        ]
      ),
      v(1em),
      block(
        text(size: 0.6em, fill: ink-body)[
          We take care of the software engineering so researchers can stay focused on their science.
        ]
      ),
    ),
    stat-card(
      [5× time saved],
      [Researchers report a 5× time benefit, comparing the hours we spend to the academic time they save.],
    ),
  ),

  // RIGHT: numbered list with hairline dividers
  stack(
    dir: ttb,
    spacing: 0.55em,
    numbered-item(
      "01",
      [Avoid struggling with solved problems],
      [Because we work across departments, we spot common roadblocks early and share working fixes to your group.],
    ),
    hairline(),
    numbered-item(
      "02",
      [Code that others can run],
      [We help turn fragile, one-off scripts into clean, shareable tools that collaborators and new students can use on day one.],
    ),
    hairline(),
    numbered-item(
      "03",
      [Bring old scripts back to present],
      [When an important codebase breaks after someone leaves, we help untangle, update, and rescue it for new projects.],
    ),
    hairline(),
    numbered-item(
      "04",
      [Smooth handovers when people change],
      [Better workflows and documentation mean outgoing personnel offboard cleanly, and new hires catch up in days, not months.],
    ),
  ),
)

// ── 3 · How do we do it — engagement modes × domains matrix ──────────────────

// Left-hand row label (engagement mode + its share of the work)
#let row-label(title, pct) = block(
  height: 1.5cm,
  align(horizon)[
    #grid(
      columns: (1fr, auto),
      column-gutter: 0.3em,
      align: bottom,
      block(text(size: 0.53em, weight: "bold", fill: aalto-black)[#title]),
      block(text(size: 0.5em, weight: "bold", fill: ink-emph)[#pct]),
    )
  ],
)

// One domain column: header + share, then three example rows on hairlines
#let domain-column(title, pct, item1, item2, item3) = panel(
  stack(
    dir: ttb,
    spacing: 0.45em,
    grid(
      columns: (1fr, auto),
      align: bottom,
      block(text(size: 0.58em, weight: "bold", fill: aalto-black)[#title]),
      block(text(size: 0.55em, weight: "bold", fill: ink-emph)[#pct]),
    ),
    block(height: 1.5cm, align(horizon)[#text(size: 0.48em, fill: aalto-black)[#item1]]),
    hairline(weight: 0.5pt),
    block(height: 1.5cm, align(horizon)[#text(size: 0.48em, fill: aalto-black)[#item2]]),
    hairline(weight: 0.5pt),
    block(height: 1.5cm, align(horizon)[#text(size: 0.48em, fill: aalto-black)[#item3]]),
  ),
  inset: 0.65em,
)

== How do we do it?

#v(0.5em)
#grid(
  columns: (3.8cm, 1fr, 1fr, 1fr),
  column-gutter: 0.55em,
  align: top,

  // LEFT: how we help (60% + 20% + 20% = 100%)
  box(
    width: 100%,
    inset: (top: 0.65em, bottom: 0.65em, right: 0.2em),
    stack(
      dir: ttb,
      spacing: 0.45em,
      block(text(size: 0.58em, weight: "bold", fill: ink-body)[How we help]),
      row-label([Do it for you], [60%]),
      hairline(weight: 0.5pt),
      row-label([Do it with you], [20%]),
      hairline(weight: 0.5pt),
      row-label([Guide you], [20%]),
    ),
  ),

  // The three domains (50% + 35% + 15% = 100%)
  domain-column(
    [Programming],
    [50%],
    [Build a custom data collection platform for an upcoming study.],
    [Package your code and publish it as a reusable Python library.],
    [Fresh eyes to help untangle and fix a stubborn bug.],
  ),
  domain-column(
    [Workflows & HPC],
    [35%],
    [Automate your entire analysis pipeline across all input files.],
    [Speed up slow simulation or analysis code so it finishes before the deadline.],
    [Show you how to run parallel jobs on Triton or LUMI GPUs.],
  ),
  domain-column(
    [Data & Sharing],
    [15%],
    [Clean, anonymize, and prepare data for an open data release.],
    [Set up a structured database and connect your scripts to it.],
    [Advise on fast, reliable file formats for heavy datasets.],
  ),
)

#v(0.65em)

// Funding split bar
#box(
  width: 100%,
  stroke: 0.8pt + line-hair,
  radius: 6pt,
  inset: (x: 0.7em, y: 0.45em),
  grid(
    columns: (auto, 1fr, auto),
    column-gutter: 0.9em,
    align: horizon,
    block(text(size: 0.5em, weight: "bold", fill: ink-emph)[85% base-funded]),
    block(
      text(size: 0.46em, fill: ink-body)[
        Daily drop-in Garage (*15%*) and days-to-weeks projects (*70%*) are free to labs via Aalto base funding. Only long-term projects (*15%*) are billed to grants.
      ]
    ),
    block(text(size: 0.45em, weight: "bold", fill: ink-body)[scicomp.aalto.fi/rse]),
  ),
)

// ── 4 · Start using our services — training + LLM gateway panels ─────────────

// One training course row: tag chip + title + description. The chip column
// has a fixed width so the titles line up in a column (auto-width chips make
// each row start at a different x). The description gets its own column, so a
// wrapped second line hangs under the description's start — not under the
// title — and its leading is set on the description's own small text size.
#let training-item(tag-label, title, desc) = box(
  width: 100%,
  fill: aalto-white,
  radius: 4pt,
  inset: (x: 0.4em, y: 0.35em),
  stroke: 0.5pt + line-hair,
  grid(
    columns: (2.2em, auto, 1fr),
    gutter: (0.0em, 0.5em),
    align: (left + horizon, left + horizon, left + horizon),
    tag(tag-label),
    text(size: 0.5em, weight: "bold", fill: aalto-black)[#title],
    {
      set par(leading: 0.45em)
      text(size: 0.43em, fill: ink-muted)[#desc]
    },
  ),
)

== Start using our services today

#v(0.45em)
#grid(
  columns: (1fr, 1.1fr),
  column-gutter: 0.65em,
  align: top,

  // LEFT: open training courses — header block, then the course list. The
  // stack spacing separates them (a plain flow left the list glued to the
  // intro text); 0.55em between rows fills the 10.4cm panel, whose height
  // matches the right panel (equal-height cards).
  panel(
    height: 10.4cm,
    stack(
      dir: ttb,
      spacing: 1.0em,
      [
        #eyebrow([CULTURE & LITERACY])
        #v(0.1em)
        #text(size: 0.65em, weight: "bold", fill: aalto-black)[Hands-On Training at Scale]
        #v(0.1em)
        #text(size: 0.43em, fill: ink-muted)[
          Livestreamed, open-access workshops raising baseline competence across all schools.
        ]
      ],
      stack(
        dir: ttb,
        spacing: 0.7em,
        training-item("HPC", [HPC Kickstart], [Triton cluster onboarding & Slurm batch scaling.]),
        training-item("GIT", [CodeRefinery], [Modular, tested, and reproducible research code.]),
        training-item("ML", [Practical Deep Learning], [PyTorch GPU profiling & distributed training.]),
        training-item("FAIR", [Data Releases], [Curated metadata & citable Zenodo DOIs.]),
      ),
    ),
  ),

  // RIGHT: Aalto LLM gateway & sovereign AI
  panel(
    height: 10.4cm,
    [
      #grid(
        columns: (1fr, auto),
        align: horizon,
        [
          #eyebrow([SECURITY & INFRASTRUCTURE], colour: accent)
          #v(0.1em)
          #text(size: 0.65em, weight: "bold", fill: aalto-black)[Aalto LLM Gateway]
        ],
        tag("llm-gateway.aalto.fi", colour: accent),
      )
      #grid(
        columns: (8cm, 1fr),
        column-gutter: 0.5em,
        align: horizon,
        box(
          width: 8cm,
          height: 8cm,
          radius: 4pt,
          clip: true,
          align(center + horizon)[#fig("ai_out", w: 8cm, h: 8cm)],
        ),
        stack(
          dir: ttb,
          spacing: 0.9em,
          bullet-item(
            [Zero IP leakage],
            [Unpublished work never trains external models.],
            colour: accent,
          ),
          bullet-item(
            [AI agent tooling],
            [Safe API routing for terminal agents, local models, and automated pipelines (moat).],
            colour: accent,
          ),
          bullet-item(
            [Institutional quota],
            [Ensure fair, accountable, and cost-controlled usage of LLMs across the university.],
            colour: accent,
          ),
        ),
      )
    ],
  ),
)

// ── 5 · Service tiers — one identity colour per tier, four subslides ─────────

// Each tier keeps its own school colour (spectrum of services — the one
// deliberate exception to the deck's single-accent rule).
#let tier-colors = (
  school-colours.eng,
  school-colours.chem,
  school-colours.arts,
  school-colours.sci,
)

// Progress dots: filled with the tier colour up to the active tier, pale after
#let timeline(active) = grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  column-gutter: 0pt,
  align: center + horizon,
  ..range(4).map(i => {
    let colour = tier-colors.at(i)
    let n = i + 1
    let selected = n == active
    let completed = n < active
    box(
      width: 100%,
      height: 0.32cm,
      align(center + horizon)[
        #circle(
          radius: if selected { 0.23cm } else { 0.19cm },
          fill: if n > active { colour.lighten(85%) } else { colour },
          stroke: if selected {
            1.3pt + aalto-black
          } else if completed {
            0.8pt + colour
          } else {
            0.8pt + colour.lighten(85%)
          },
        )
      ],
    )
  }),
)

#let tier(n, label, heading, description, active) = {
  let colour = tier-colors.at(n - 1)
  let selected = n == active
  let completed = n < active
  let upcoming = n > active
  let text-color = if upcoming { ink-muted } else { aalto-black }
  box(
    width: 100%,
    height: 4cm,
    radius: 5pt,
    fill: if selected {
      colour.lighten(85%)
    } else if completed {
      fill-card
    } else {
      fill-card-soft
    },
    stroke: if selected { 1.2pt + colour } else { none },
    inset: 0.45em,
    [
      #text(
        size: 0.45em,
        weight: if selected { "bold" } else { "regular" },
        fill: if upcoming { ink-muted } else { accent-on-white(colour) },
      )[#raw(label)]
      #v(0.15em)
      #text(size: 0.65em, weight: "bold", fill: text-color)[#heading]
      #v(0.15em)
      #text(size: 0.5em, fill: text-color)[#description]
    ],
  )
}

#let tier-scene(active) = stack(
  dir: ttb,
  spacing: 1.2em,

  // Connector line from first to last dot centre
  v(1.4em),
  box(
    width: 100%,
    height: 0.32cm,
    {
      place(
        top + left,
        dx: 3.2cm,
        dy: 0.15cm,
        line(length: 100% - 6.4cm, stroke: 1.2pt + aalto-gray.lighten(50%)),
      )
      timeline(active)
    },
  ),

  v(2.8em),
  grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    column-gutter: 0.45em,
    align: top,
    tier(
      1,
      "TIER 1 / DAILY 13:00",
      [SciComp Garage],
      [Low-threshold Zoom & chat help every day at 13:00. Zero cost.],
      active,
    ),
    tier(
      2,
      "TIER 2 / DAYS-WEEKS",
      [Short projects],
      [Start via ticket or Garage. Hands-on coding & scaling at no cost to you.],
      active,
    ),
    tier(
      3,
      "TIER 3 / >1 MONTH",
      [Long projects],
      [Dedicated RSE time for major work, with budget agreement.],
      active,
    ),
    tier(
      4,
      "TIER 4 / PRE-AWARD",
      [Grant co-applying],
      [Partner with us when applying for grants to scope & budget RSE support.],
      active,
    ),
  ),
)

== How do we operate?

#only(1, tier-scene(1))
#only(2, tier-scene(2))
#only(3, tier-scene(3))
#only(4, tier-scene(4))

// ── 6 · Who we are ───────────────────────────────────────────────────────────

== Who we are: Research Software Engineers (RSEs)

#v(2em)
#grid(
  columns: (1.25fr, 1fr),
  column-gutter: 1.3em,
  align: horizon,

  // LEFT: who the RSEs are + a quiet call to action
  stack(
    dir: ttb,
    spacing: 0.5em,
    numbered-item(
      "01",
      [Scientists who specialize in software],
      [We have *research* backgrounds ourselves, but our job is building reliable code, data pipelines, and tools.],
    ),
    hairline(),
    numbered-item(
      "02",
      [Part of Science-IT (Aalto Scientific Computing)],
      [Science-IT provides the heavy computing infrastructure (Triton) for the whole university. The RSE team is the hands-on human support inside it.],
    ),
    hairline(),
    numbered-item(
      "03",
      [Bridging researchers and university services],
      [Hosted in the School of Science, we serve every School and work closely with IT and Research Services.],
    ),
    v(0.5em),
    box(
      width: 100%,
      fill: fill-card,
      radius: 6pt,
      inset: (x: 0.65em, y: 0.5em),
      grid(
        columns: (1fr, auto),
        align: horizon,
        stack(
          dir: ttb,
          spacing: 0.2em,
          block(text(size: 0.6em, weight: "bold", fill: aalto-black)[Come talk to us any workday at 13:00]),
          v(0.5em),
          block(text(size: 0.5em, fill: ink-body)[Drop into the daily SciComp Garage on Zoom.]),
        ),
        block(text(size: 0.6em, weight: "bold", fill: ink-emph)[#link("scicomp.aalto.fi/rse")]),
      ),
    ),
  ),

  // RIGHT: the Science-IT org diagram
  box(
    width: 100%,
    height: 8.0cm,
    radius: 8pt,
    clip: true,
    align(center + horizon)[#fig("whatisSCI-IT", w: 100%, h: 100%)],
  ),
)
