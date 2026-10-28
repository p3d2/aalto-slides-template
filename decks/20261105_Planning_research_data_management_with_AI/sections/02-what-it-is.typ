// ── 2 · What the assistant is — 8 min ──────────────────────────────────────
// System prompt + supporting files, NOT a trained model (transparency,
// updatability). What it does: intake → guidance → APL-ready notes → routing.
// What it does NOT: no final DMPs, no legal advice, doesn't replace
// Privacy Office/DPO. Output structure A–E maps 1:1 to APL fields.
#import "../../../theme/aalto.typ": *

= What the assistant is

== APL -- Aalto Project List, making compliance useful

#figure(image("../figures/apl.pdf", width: 80%,
          alt: "Cartoon:"),
          caption: none, numbering: none)

#text(size: 0.8em)[
  APL is Aalto’s platform for externally funded research and education proposals and projects:
  - (From 2026) Every new project gets a short compliance questionnaire (personal data, procurements, IT security, export control, ...)
  - All proposals are saved to APL before submission to the funding agency, approvals & budget checked
  - Login = Aalto employee ID + Authentication
  - Support provided by Research Services #link("mailto:apl@aalto.fi") (more at #link("https://www.aalto.fi/en/services/aalto-project-list")[*aalto-project-list*])
]
#credit-line[Images © 2026 Pedro Silva. Licensed under CC BY 4.0.]

== Aalto AI Assistant

#{
  layout(size => {
    let w = size.width
    let h = size.height
    let conn = aalto-red-dark
    let stroke-w = 2.2pt

    // ── dashboard frame (slide-area fractions) ──
    let DASH = (x: 0.2, y: 0.0, w: 0.6, ratio: 763 / 423)
    let dh = DASH.w * w / DASH.ratio / h
    let da(fx, fy) = ((DASH.x + fx * DASH.w) * w, (DASH.y + fy * dh) * h)
    place(top + left, dx: DASH.x * w, dy: DASH.y * h,
      image("../figures/dashboard.png", width: DASH.w * w,
        alt: "Dashboard of the Aalto AI Assistant chat app at ai.aalto.fi"))

    // ── callouts: one shared height, may overlap the dashboard ──
    let CALH = 0.36
    let CALLOUTS = (
      ("../figures/prompt.png",   -0.05, 0.0, 344 / 294),
      ("../figures/model.png",    0.50, -0.250, 340 / 237),
      ("../figures/settings.png", 0.800, 0.13, 408 / 392),
    )
    for (p, cx, cy, cr) in CALLOUTS {
      place(top + left, dx: cx * w, dy: cy * h,
        image(p, height: CALH * h,
          alt: "Detail screenshot of the Aalto AI Assistant"))
    }
    // point on a callout edge: "left"/"right" → f along its height;
    // "bottom" → f along its width
    let callout-edge(n, side, f) = {
      let (p, cx, cy, cr) = CALLOUTS.at(n)
      let cw = CALH * h * cr / w
      if side == "right"       { ((cx + cw) * w, (cy + f * CALH) * h) }
      else if side == "left"   { (cx * w, (cy + f * CALH) * h) }
      else                     { ((cx + f * cw) * w, (cy + CALH) * h) }
    }

    // ── red highlight boxes on the dashboard (image fractions) ──
    for (a, b) in (
      ((0.0, 0.31), (0.2, 0.36)),   // “Prompt Book” button
      ((0.24, 0.215), (0.32, 0.265)),   // “GPT5 ▾” model selector
      ((0.58, 0.905), (0.74, 0.955)),   // “Advanced settings” chip
    ) {
      let (x1, y1) = da(a.at(0), a.at(1))
      let (x2, y2) = da(b.at(0), b.at(1))
      place(top + left, dx: x1, dy: y1,
        rect(width: x2 - x1, height: y2 - y1, radius: 3pt,
          stroke: stroke-w + conn, fill: none))
    }

    // ── smooth connectors: one cubic Bézier, axis-aligned handles ──
    // from/to name the side the curve leaves/enters ("left" etc.)
    let connect(p0, from, p1, to) = {
      let dx = p1.at(0) - p0.at(0)
      let dy = p1.at(1) - p0.at(1)
      let k = calc.max(calc.abs(dx), calc.abs(dy)) * 0.35
      let off = d => if d == "left"   { (-k, 0pt) }
        else if d == "right" { (k, 0pt) }
        else if d == "top"   { (0pt, -k) }
        else                 { (0pt, k) }
      let c1 = (p0.at(0) + off(from).at(0), p0.at(1) + off(from).at(1))
      let c2 = (p1.at(0) + off(to).at(0),   p1.at(1) + off(to).at(1))
      let pts = (p0, c1, c2, p1)
      let x0 = calc.min(..pts.map(q => q.at(0)))
      let y0 = calc.min(..pts.map(q => q.at(1)))
      let rel = pts.map(q => (q.at(0) - x0, q.at(1) - y0))
      place(top + left, dx: x0, dy: y0,
        curve(fill: none, stroke: stroke-w + conn,
          curve.move(rel.at(0)),
          curve.cubic(rel.at(1), rel.at(2), rel.at(3))))
    }
    connect(callout-edge(0, "right", 0.5), "right", da(0.0, 0.335), "left")
    connect(callout-edge(1, "left", 0.5),    "left", da(0.32, 0.24), "right")
    connect(da(0.74, 0.93),               "right", callout-edge(2, "left", 0.5), "left")

    // ── labels (width-constrained blocks; strong = accent via the theme) ──
    place(top + left, dx: -0.040 * w,
      dy: callout-edge(0, "bottom", 0.5).at(1) + 0.015 * h,
      text(size: 0.62em)[*Curated prompts*])
    place(top + left, dx: 0.78 * w, dy: -0.180 * h,
      block(width: 0.25 * w, {
        set text(size: 0.62em)
        [*GPT 5.5* (most capable; cutoff Dec 2025), other models --
         and the *Aalto.fi ChatBot*]
      }))
    place(top + left, dx: 0.820 * w, dy: 0.50 * h,
      block(width: 0.20 * w, {
        set text(size: 0.62em)
        [Per-conversation *system prompt*, level of reasoning, token cap]
      }))
    place(top + left, dx: 0pt, dy: calc.min((DASH.y + dh + 0.05) * h, 0.9 * h),
      block(width: w, align(center, {
        set text(size: 0.72em)
        [Aalto AI Assistant is a chat-based application powered by large language models]
      })))
  })
}
#credit-line[#link("https://ai.aalto.fi/")[*ai.aalto.fi*]]

== How does an AI chatbot works?

#v(-1em)
#align(center)[
  #image("../figures/ai_model.pdf", width: 90%, alt: "Cartoon:")
]
#v(-1.5em)
#text(size: 0.72em)[
  The *system prompt*:
  - is not a separately trained model
  - can be run on a general purpose LLM
  - is transparent: you can read exactly what it is instructed to 
  - is updatable: Data Agents maintain it as services change but you can also modify it
]
#credit-line[Images © 2026 Pedro Silva. Licensed under CC BY 4.0.]

== The data management assistant system prompt

#align(center)[
  #grid(
    column-gutter: 3.5em,
    columns: 2,
    figure(image("../figures/systemMD.png", height: 13em,
            alt: "Cartoon"),
            caption: [RDMASSISTANT.MD], numbering: none),
    figure(image("../figures/systemVIEW.png", height: 13em,
            alt: "Cartoon: a lone researcher at a laptop, trying to guess the volume, sensitivity and retention of four years of unknown data."),
            caption: [#text(weight: "bold")[M]ark#text(weight: "bold")[D]own], numbering: none)
  )
]

== DM assistant features

#grid(
  columns: (1fr, 1fr),
  column-gutter: 20pt,
  
  // Left: Numbered List
  text(size: 0.82em)[
  + *Step-by-step process*: project, data types, your role (staff vs. student), funder
  + *Provides help and advices*: storage, personal data, ethics, licensing, repositories, funder requirements
  + *APL-ready draft notes*: text you can insert into APL
  + *Select the services you should check*: sensitive topics go to the right Aalto service
  + *Responds in the language you write in*: FI / SV / EN
  ],
  
  // Right: Check / Wrong Marks
  text(size: 0.82em)[
    
    #text(fill: red, weight: "bold")[✗] Does not write your final DMP

    #text(fill: red, weight: "bold")[✗] Does not give legal advice or definitive GDPR conclusions

    #text(fill: red, weight: "bold")[✗] Does not replace the Privacy Office or the Data Protection Officer

    #text(fill: green, weight: "bold")[✓] Everything it produces -> draft planning notes 
  ]
)