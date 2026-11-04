// ── 2 · What the assistant is — 8 min ──────────────────────────────────────
// System prompt + supporting files, NOT a trained model (transparency,
// updatability). What it does: intake → guidance → APL-ready notes → routing.
// What it does NOT: no final DMPs, no legal advice, doesn't replace
// Privacy Office/DPO. Output structure A–E maps 1:1 to APL fields.
#import "../../../theme/aalto.typ": *

= What the assistant is

== Aalto Project List (APL), making compliance useful

#figure(image("../figures/apl.pdf", width: 80%,
          alt: "Diagram: the researcher’s proposal passes through APL -- personal data, compliance and ethics, export control and procurement checks -- to the institutional signatory and on to the funding agency."),
          caption: none, numbering: none)

#text(size: 0.75em)[
  APL is Aalto’s platform for externally funded research, education proposals and projects:
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
    let DASH = (x: 0.2, y: 0.0, w: 0.6, ratio: 1927/1215)
    let dh = DASH.w * w / DASH.ratio / h
    let da(fx, fy) = ((DASH.x + fx * DASH.w) * w, (DASH.y + fy * dh) * h)
    place(top + left, dx: DASH.x * w, dy: DASH.y * h,
      image("../figures/dashboard.png", width: DASH.w * w,
        alt: "Screenshot: Aalto AI Assistant start page -- sidebar with Prompt Book, conversations and the quota counter, message box with Private chat and Advanced settings, model menu top left"))

    // ── callouts: each with its own height (5th tuple element, fraction of
    // the slide area), may overlap the dashboard. They shared one CALH until
    // 2026-11-03; Pedro tunes each look by hand, so each gets its own knob.
    // Tuple: (path, x, y, width/height ratio, height) — all in slide fractions.
    let CALLOUTS = (
      ("../figures/prompt.png",   -0.04, 0.0, 933 / 570, 0.25),
      ("../figures/model.png",    0.42, -0.10, 340 / 237, 0.36),
      ("../figures/settings.png", 0.800, 0.13, 852 / 668, 0.34),
    )
    // one alt per callout, in CALLOUTS order
    let ALTS = (
      "Screenshot: the Prompt Book categories — System prompts, AI Use Cases, By Data Type, By Study Techniques",
      "Screenshot: the language-model menu — four GPT tiers with their knowledge cutoffs, newest December 2025",
      "Screenshot: per-conversation advanced settings — system prompt field (27 of 250 000 characters), level of reasoning, maximum output tokens 128 000",
    )
    for (i, (p, cx, cy, cr, ch)) in CALLOUTS.enumerate() {
      place(top + left, dx: cx * w, dy: cy * h,
        image(p, height: ch * h,
          alt: ALTS.at(i)))
    }
    // point on a callout edge: "left"/"right" → f along its height;
    // "bottom" → f along its width
    let callout-edge(n, side, f) = {
      let (p, cx, cy, cr, ch) = CALLOUTS.at(n)
      let cw = ch * h * cr / w
      if side == "right"       { ((cx + cw) * w, (cy + f * ch) * h) }
      else if side == "left"   { (cx * w, (cy + f * ch) * h) }
      else                     { ((cx + f * cw) * w, (cy + ch) * h) }
    }

    // ── red highlight boxes on the dashboard (image fractions) ──
    for (a, b) in (
      ((0.02, 0.27), (0.16, 0.32)),   // “Prompt Book” button
      ((0.5, 0.74), (0.58, 0.79)),   // “GPT5 ▾” model selector
      ((0.705, 0.74), (0.74, 0.79)),   // “Advanced settings” chip
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
    connect(callout-edge(0, "right", 0.5), "right", da(0.02, 0.295), "left")
    connect(callout-edge(1, "left", 0.5), "left", da(0.5, 0.765), "left")
    connect(da(0.74, 0.765), "right", callout-edge(2, "left", 0.5), "left")

    // ── labels (width-constrained blocks; strong = accent via the theme) ──
    place(top + left, dx: -0.040 * w,
      dy: callout-edge(0, "bottom", 0.5).at(1) + 0.015 * h,
      text(size: 0.62em)[*Curated prompts*])
    place(top + left, dx: 0.67 * w, dy: -0.13 * h,
      block(width: 0.25 * w, {
        set text(size: 0.62em)
        [*GPT 6.1 Sol* and *GPT 6.1 Terra* (model cutoffs April & June 2026), other models -- and the *Aalto.fi ChatBot*]
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

== How does an AI chatbot work?

#v(1em)
#align(center)[
  #image("../figures/ai_model.pdf", width: 90%, alt: "Diagram: your prompt and the system prompt enter the chatbot interface, a large language model processes them, and the chatbot returns a structured answer.")
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

#v(2em)
#align(center)[
  #grid(
    column-gutter: 2em,
    columns: 2,
    figure(image("../figures/systemVIEW.png", height: 10em,
            alt: "Screenshot: RDMASSISTANT.md open in a plain-text editor with line numbers and syntax colourWs -- the instructions are ordinary readable prose"),
            caption: [RDMASSISTANT.md in Notepad++], numbering: none),
    figure(image("../figures/systemMD.png", height: 10em,
            alt: "Screenshot: the same RDMASSISTANT.md rendered by a markdown viewer -- headings, bold runs and links laid out as a document"),
            caption: [The same file in a markdown viewer], numbering: none)
  )
]

== RDM assistant features

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