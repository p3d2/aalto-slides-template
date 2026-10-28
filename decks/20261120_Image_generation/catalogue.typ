// ── catalogue.typ — the perishable half of this deck ────────────────────────
// Every model name, access route, capability claim and "as of" date that appears
// in a slide lives HERE and nowhere else. Next year: edit the entries below,
// bump VERIFIED, re-run the examples you care about. Nothing else knows what a
// model is called.
//
//   capabilities  = STABLE. Six things image generators can do.
//   tools         = PERISHABLE. This year's answer to "which one, then?"
//
// The tool columns are the questions that actually separate the products now
// that all of them draw well: can you get it at Aalto · what happens to the
// images you upload · can it edit a picture you already have · what does it hand
// back · are the weights public. `checked` marks what YOU must verify before the
// talk — anything with ⚠ was copied from vendor docs or press, not tested here.

#let VERIFIED = "November 2026"   // bump this when you re-check the list below

#import "../../theme/aalto.typ": *
// "not verified by us" marker. A real ⚠ glyph renders as a filled triangle in
// Inter, so use a red ! instead — it survives the projector and the printout.
#let check = text(fill: aalto-red-dark, weight: "bold", [!])

// ── the six capabilities (stable; used by the scenario slides) ──────────────
#let capabilities = (
  (
    id: "generate",
    label: [Words in, picture out],
    scenario: [You need an image of something that does not exist],
    tools: ("midjourney", "firefly", "ideogram"),
    watch: [You get what this kind of picture usually looks like — not what your
      sentence says.],
  ),
  (
    id: "edit",
    label: [Change a picture you already have],
    scenario: [Your photo is right except for the cables and the clutter],
    tools: ("gpt-image", "firefly", "flux"),
    watch: [What it did not touch stays yours; what it touched is a new claim.],
  ),
  (
    id: "reference",
    label: [Learn from the images you attach],
    scenario: [Keep my setup, my face, my building, my style],
    tools: ("gpt-image", "gemini"),
    watch: [It keeps the gist, not the geometry. Check labels and counts.],
  ),
  (
    id: "style",
    label: [Same content, different register],
    scenario: [Make my rig photo look like a schematic],
    tools: ("gemini", "firefly"),
    watch: [One style word does more work than three adjectives.],
  ),
  (
    id: "structured",
    label: [Diagrams, labels, vectors],
    scenario: [I need a figure with parts A–E that survives review],
    tools: ("firefly", "ideogram"),
    watch: [This is where it fails most: dense small text, invented labels,
      wrong order.],
  ),
  (
    id: "code",
    label: [Ask for code, not pixels],
    scenario: [I want a 3D illustration I can re-render and cite],
    tools: ("gemini", "gpt-image"),
    watch: [Editable, reproducible, citable — the only one you can fully defend.],
  ),
)

// ── this year's tools ───────────────────────────────────────────────────────
// access   : how an Aalto researcher gets it tomorrow
// uploads  : what happens to the images *you* send in  (the question they ask)
// edits    : can it change a picture you give it
// gives    : what comes back
// open     : are the weights public (→ you can run it, log it, reproduce it)
// legacy   : true → hidden from the live table, kept for the history slide
#let tools = (
  "gpt-image": (
    name: [GPT Image], maker: [OpenAI],
    access: [*Aalto AI Assistant* · ChatGPT],
    uploads: [Aalto/API: private · personal: opt out #check],
    edits: [yes, multi-turn in place],
    gives: [PNG, transparent, 4K],
    open: [no],
    checked: "2026-11 · verify the ChatGPT toggle",
  ),
  "gemini": (
    name: [Gemini Image], maker: [Google],
    access: [*Aalto AI Assistant* · Gemini app],
    uploads: [Aalto: private · free app: may train #check],
    edits: [yes, up to 14 reference images],
    gives: [PNG 4K, SynthID watermark],
    open: [no],
    checked: "2026-11 · the “Nano Banana” name may already be gone",
  ),
  "firefly": (
    name: [Adobe Firefly], maker: [], // "Adobe" is already in the name!
    access: [Creative Cloud],
    uploads: [no training on your uploads #check],
    edits: [yes, inside Photoshop],
    gives: [PNG + vector, layers],
    open: [no],
    checked: "2026-11 · verify Aalto entitlement",
  ),
  "midjourney": (
    name: [Midjourney], maker: [],
    access: [personal subscription],
    uploads: [public by default · Stealth tier opts out #check],
    edits: [region + subject control],
    gives: [PNG, high aesthetic finish],
    open: [no],
    checked: "2026-11",
  ),
  "ideogram": (
    name: [Ideogram], maker: [],
    access: [web · API],
    uploads: [cloud terms #check],
    edits: [limited (inpainting/remix)],
    gives: [PNG, strong text rendering],
    open: [open weights (v4)],
    checked: "2026-11 · v4 open weights: confirm size + licence",
  ),
  "flux": (
    name: [FLUX], maker: [Black Forest Labs],
    access: [local GPU · API],
    uploads: [local: stays on your machine],
    edits: [yes (Fill / Redux variants)],
    gives: [PNG + scriptable pipeline],
    open: [open weights (dev/schnell)],
    checked: "2026-11 · name the exact variant you show",
  ),
  "sd-comfy": (
    name: [Stable Diffusion + ComfyUI], maker: [open-source ecosystem],
    access: [local GPU],
    uploads: [local: stays on your machine],
    edits: [yes + ControlNet / LoRA],
    gives: [PNG + reproducible workflow JSON],
    open: [open weights],
    checked: "2026-11",
  ),
  "dalle3": (
    name: [DALL-E 3], maker: [OpenAI],
    access: [retired from the GPT-Image line],
    uploads: [—], edits: [—], gives: [—], open: [no],
    checked: "was current in the April 2026 version of this deck",
    legacy: true,
  ),
)

// ── the bits slides use ─────────────────────────────────────────────────────
/// tool("gpt-image") → its name. A typo prints in red rather than as a blank.
#let tool(id, field: none) = {
  let t = tools.at(id, default: none)
  if t == none {
    text(fill: aalto-red-dark, weight: "bold", [unknown tool: #id])
  } else if field != none {
    t.at(field, default: [—])
  } else {
    t.name
  }
}

/// The live rows for the tool table, in the order above, legacy entries removed.
#let live-tools = tools.values().filter(t => t.at("legacy", default: false) != true)

/// "as of November 2026" — put it on every slide that names a product.
#let asof-date = [as of #VERIFIED]
#let asof(body: []) = text(size: 0.62em, fill: aalto-gray,
  if body != [] { [#body · ] }[#asof-date])
