# Talk outline — fill this BEFORE writing slides

The worksheet behind `docs/making-a-talk.md` §1–3. It lands in every new deck
(`./slides new <name>`); the answers here become the deck's structure. Nothing
on this page ends up in the PDF — it is for you (and for an agent helping you).

## 1. The four lines

- **Ask** — what should this audience *do, decide or believe* when I stop talking?
- **Room** — who is there, what do they know, what do they believe that I contradict?
- **Slot** — minutes including Q&A: ______ → content-slide budget ≈ slot ÷ 1.75: ______
- **One sentence** — the whole talk, repeatable afterwards by a first-year:

If any line is empty, the talk is not ready to be built. Then stop; do not open
`main.typ` yet.

## 2. Claims, in speaking order

These become the `==` slide titles. Read them back as a list: it must be an
**argument**, not a table of contents (the titles-only test).

1. the problem, in their terms
2. what is missing / what everyone assumes
3. **your claim, said out loud and early**
4. how you know — method, one slide
5. evidence — one slide per finding
6. …
7. what it does **not** show
8. the ask

## 3. Per-slide plan

| # | title (a claim, not a topic) | evidence | figure | reveal / note |
|---|---|---|---|---|
| 1 | | | | |
| 2 | | | | |
| 3 | | | | |

Rules while filling: ≤ 6 bullets ≤ 2 lines each · one hero figure per slide ·
numbers that are the point get their own `#focus-slide` · a paragraph means a
handout, not a slide.

## 4. Logistics → `main.typ`

- date / venue / projector: **Thu 26 Nov 2026** · venue TODO · projector TODO
- accent (school colour? one school only): `accent: aalto-blue` ← TODO, university-level vs `school-colours.chem` / `.sci` / `.eng`
- room → density (`roomy` hall · `default` seminar · `compact` methods): `density: default` ← TODO
- logomark (`"quote"` A" · `"question"` A? · `"exclaim"` A!): `mark:` TODO (unset → whatever the `logo:` path names, currently A")
- language of the logo (EN / FI / SE / trilingual): trilingual tertiary on the title slide, black mark in the corner ← TODO if FI room
- contact lines for the Kiitos slide: TODO — `rse@aalto.fi` + The Garage (`scicomp.aalto.fi/help/garage/`) if this is ASC/RSE material
- questions you expect → back-pocket slides *after* `#thanks-slide`:

> **Scaffold state (2026-10-22).** `./slides deck 20261126_ASC_ppt` builds: 6 pages
> (title · section · 2 demo slides incl. the `#pause` subslide · two-column
> example · Kiitos), 0 warnings. `sections/01-main.typ` is still the template
> example — delete it once §2 has claims in it. Note: this deck deliberately
> leaves `short-title:` out, so the footer is empty (Aalto's own template style).

## 5. Before you present (`docs/making-a-talk.md` §13)

- [ ] titles alone read as an argument
- [ ] squint / 25 %-zoom test passed
- [ ] figures labelled, units stated, sources cited
- [ ] `#pause` matches what you actually say
- [ ] preliminary data marked as preliminary
- [ ] rehearsed aloud once, with a timer
- [ ] PDF exported and named `talk-YYYY-MM-DD.pdf`, on a stick and in the outbox
