#!/usr/bin/env python3
"""Measure how much of each official Aalto logo PDF is actually *ink*.

The originals from aaltologo.fi ship with the brand's clear space baked into
the page box: asking Typst for `height: 1.6em` renders a 1.6em *box* whose
visible lock-up is only ~59-84 % of that, and whose ink does not start at the
box's left edge. This script measures the real ink rectangle of every PDF under
`assets/logo/` and writes `theme/logo-metrics.typ`, which the theme uses to
turn `height:` into the visible logo height and to align the ink to a corner.

    python3 assets/logo/measure-logos.py        # from the project root

Method: render each PDF into a box of known size on a mid-grey page (works for
black *and* white logos), then find the bounding box of non-grey pixels. Only
the stdlib + `typst` on PATH are needed.
"""
import glob, os, re, struct, subprocess, sys, zlib

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..'))
LOGO_DIR = os.path.join(ROOT, 'assets', 'logo')
OUT = os.path.join(ROOT, 'theme', 'logo-metrics.typ')
WORK = os.path.join(ROOT, '.scratch', 'logo-metrics')
BOX, PAD, PPI = 200.0, 60.0, 72.0          # pt / pt / dpi (PPI=72 → 1px = 1pt)


# ── PDF page box / SVG viewBox ───────────────────────────────────────────────
def page_size(path):
    d = open(path, 'rb').read()
    if path.lower().endswith('.svg'):
        m = re.search(rb'viewBox\s*=\s*["\']\s*([-\d.]+)\s+([-\d.]+)\s+([-\d.]+)\s+([-\d.]+)', d)
        assert m, f'{path}: no viewBox found'
        _, _, w, h = (float(v) for v in m.groups())
        return w, h
    m = re.search(rb'/MediaBox\s*\[\s*([-\d.]+)\s+([-\d.]+)\s+([-\d.]+)\s+([-\d.]+)', d)
    x0, y0, x1, y1 = (float(v) for v in m.groups())
    return x1 - x0, y1 - y0


# ── minimal PNG reader (8-bit RGB/RGBA, stdlib only) ─────────────────────────
def png_pixels(path):
    d = open(path, 'rb').read()
    assert d[:8] == b'\x89PNG\r\n\x1a\n', f'{path} is not a PNG'
    pos, w, h, depth, ctype, idat = 8, 0, 0, 0, 0, []
    while pos < len(d):
        ln, tag = struct.unpack('>I4s', d[pos:pos + 8])
        chunk = d[pos + 8:pos + 8 + ln]
        if tag == b'IHDR':
            w, h, depth, ctype = struct.unpack('>IIBB', chunk[:10])
        elif tag == b'IDAT':
            idat.append(chunk)
        elif tag == b'IEND':
            break
        pos += 12 + ln
    assert depth == 8 and ctype in (2, 6), f'{path}: unsupported PNG ({depth}bit, ctype {ctype})'
    bpp = 3 if ctype == 2 else 4
    raw = zlib.decompress(b''.join(idat))
    stride = w * bpp
    out, prev = bytearray(stride * h), bytearray(stride)
    for y in range(h):
        base = y * (stride + 1)
        line = bytearray(raw[base + 1:base + 1 + stride])
        ft = raw[base]
        for x in range(stride):
            a = line[x - bpp] if x >= bpp else 0
            b = prev[x]
            c = prev[x - bpp] if x >= bpp else 0
            if ft == 1:
                line[x] = (line[x] + a) & 255
            elif ft == 2:
                line[x] = (line[x] + b) & 255
            elif ft == 3:
                line[x] = (line[x] + ((a + b) >> 1)) & 255
            elif ft == 4:
                p = a + b - c
                pa, pb, pc = abs(p - a), abs(p - b), abs(p - c)
                line[x] = (line[x] + (a if (pa <= pb and pa <= pc) else (b if pb <= pc else c))) & 255
        out[y * stride:(y + 1) * stride] = line
        prev = line
    return w, h, out, bpp


def ink_bbox(path, key=128, tol=40):
    """Bounding box (px) of pixels that differ from the mid-grey background."""
    w, h, px, bpp = png_pixels(path)
    lo_x, lo_y, hi_x, hi_y = w, h, -1, -1
    for y in range(h):
        row = y * w * bpp
        for x in range(w):
            i = row + x * bpp
            if (abs(px[i] - key) > tol or abs(px[i + 1] - key) > tol
                    or abs(px[i + 2] - key) > tol):
                lo_x, hi_x = min(lo_x, x), max(hi_x, x)
                lo_y, hi_y = min(lo_y, y), max(hi_y, y)
    assert hi_x >= 0, f'nothing drawn in {path}'
    return lo_x, lo_y, hi_x, hi_y


# ── render one logo into a known box ─────────────────────────────────────────
def render(pdf, name):
    os.makedirs(WORK, exist_ok=True)
    typ = os.path.join(WORK, name + '.typ')
    png = os.path.join(WORK, name + '.png')
    open(typ, 'w').write(
        '#set page(width: %gpt, height: %gpt, margin: 0pt)\n' % (BOX + 2 * PAD, BOX + 2 * PAD)
        + '#rect(width: 100%, height: 100%, fill: luma(128))\n'
        + '#place(top + left, dx: %gpt, dy: %gpt, image("%s", width: %gpt))\n'
          % (PAD, PAD, os.path.relpath(pdf, WORK).replace(os.sep, '/'), BOX))
    subprocess.run(['typst', 'compile', '--root', ROOT,
                    '--font-path', os.path.join(ROOT, 'fonts'),
                    '--ppi', str(PPI), '-f', 'png', typ, png], check=True)
    return png


def main():
    files = sorted(glob.glob(os.path.join(LOGO_DIR, '*', '*.pdf'))
                   + glob.glob(os.path.join(LOGO_DIR, '*', '*.svg')))
    if not files:
        sys.exit(f'no logos under {LOGO_DIR} — run fetch-logos.py first')
    entries = []
    for pdf in files:
        key = os.path.relpath(pdf, LOGO_DIR).replace(os.sep, '/')
        pw, ph = page_size(pdf)
        lo_x, lo_y, hi_x, hi_y = ink_bbox(render(pdf, os.path.basename(pdf)))
        # box occupies px [PAD, PAD+BOX]; rendered height keeps the page aspect
        box_h = ph * BOX / pw
        l = lo_x - PAD
        r = (PAD + BOX) - (hi_x + 1)
        t = lo_y - PAD
        b = (PAD + box_h) - (hi_y + 1)
        entries.append((key, pw / ph, l / BOX, r / BOX, t / box_h, b / box_h))
        print(f'  {key:48} ratio {pw / ph:5.3f}  ink {100 * (1 - l / BOX - r / BOX):5.1f}%w '
              f'× {100 * (1 - t / box_h - b / box_h):5.1f}%h')

    with open(OUT, 'w') as fh:
        fh.write("""// ─────────────────────────────────────────────────────────────────────────────
// GENERATED FILE — do not edit by hand.
// Geometry of the official Aalto logo originals in assets/logo/.
// Produced by:  python3 assets/logo/measure-logos.py
//
// The originals carry the brand's clear space *inside* the PDF page, so the
// visible lock-up is smaller than the box and offset within it. For each file
// (keyed by "<lockup>/<filename>.pdf"):
//   ratio   page width / height
//   l, r    empty left / right padding, as a fraction of the page width
//   t, b    empty top / bottom padding, as a fraction of the page height
// The theme uses these to make `height:` mean the *visible* logo height and to
// align the ink (not the box) with a slide corner.
// ─────────────────────────────────────────────────────────────────────────────

#let logo-metrics = (
""")
        for key, ratio, l, r, t, b in entries:
            fh.write(f'  "{key}": (ratio: {ratio:.4f}, l: {l:.4f}, r: {r:.4f}, '
                     f't: {t:.4f}, b: {b:.4f}),\n')
        fh.write(')\n')
    print(f'\nwrote {os.path.relpath(OUT, ROOT)} ({len(entries)} logos)')


if __name__ == '__main__':
    main()
