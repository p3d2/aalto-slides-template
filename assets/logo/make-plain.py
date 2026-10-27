#!/usr/bin/env python3
"""Derive the text-free Aalto logomark ("university level, plain") from the
official lock-up originals — without touching a single point of artwork.

Why this exists: the brand logo system defines a plain mark (brand.aalto.fi →
logo → "Identifier versions"), and Aalto's own PowerPoint uses it oversized on
its "Kiitos / Thank you" slide and small on every content slide. But the logo
generator (aaltologo.fi) only serves lock-ups that carry the wordmark, so the
mark is not downloadable.

What we do instead: the primary PDFs draw the mark and the wordmark as two
vertically separated ink bands inside one page box. We measure the *mark* band
and rewrite only the page's `/MediaBox` to its rectangle. The content stream,
paths and colour operators are copied byte-for-byte — this is a page-box crop,
not a redraw, not a recolour, not a modification of the trademark itself.
Byte length is preserved, so the PDF's xref table stays valid.

    python3 assets/logo/make-plain.py         # writes assets/logo/mark/
    python3 assets/logo/measure-logos.py      # then re-measure (padding ≈ 0 now)

Output: mark/aalto-<colour>-<mark>.pdf for the three marks in black and white
(6 files). Language is irrelevant — there is no text left.
"""
import os, re, subprocess, sys, importlib.util

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.abspath(os.path.join(HERE, '..', '..'))
SRC = os.path.join(HERE, 'primary')
OUT = os.path.join(HERE, 'mark')
WORK = os.path.join(ROOT, '.scratch', 'logo-mark')
BOX, PAD = 200.0, 60.0          # render width / page margin, in pt (= px @72ppi)

# reuse the renderer + PNG decoder from the sibling script
_spec = importlib.util.spec_from_file_location('measure_logos', os.path.join(HERE, 'measure-logos.py'))
ml = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(ml)
ml.BOX, ml.PAD, ml.WORK = BOX, PAD, WORK


def bands(png):
    """Contiguous horizontal ink bands of a rendered logo, in px from the top."""
    w, h, px, bpp = ml.png_pixels(png)
    # colour-agnostic: any pixel far from the mid-grey ground is ink
    rows = []
    for y in range(h):
        row = y * w * bpp
        rows.append(any(abs(px[row + x * bpp] - 128) > 40 or abs(px[row + x * bpp + 1] - 128) > 40
                        or abs(px[row + x * bpp + 2] - 128) > 40 for x in range(w)))
    out, start = [], None
    for y, v in enumerate(rows):
        if v and start is None:
            start = y
        elif not v and start is not None:
            out.append((start, y - 1))
            start = None
    if start is not None:
        out.append((start, h - 1))
    return w, out


def mark_rect(pdf):
    """Ink rectangle of the mark band, in PDF points (origin bottom-left)."""
    pw, ph = ml.page_size(pdf)
    png = ml.render(pdf, os.path.basename(pdf))
    w, bs = bands(png)
    if len(bs) < 2:
        sys.exit(f'{pdf}: expected mark + wordmark bands, found {bs}')
    top, bottom = bs[0]                       # first band = the mark
    scale = pw / BOX
    # x extent of the mark: scan only its own rows
    px_w, px_h, data, bpp = ml.png_pixels(png)
    xs = [x for y in range(top, bottom + 1) for x in range(px_w)
          if abs(data[y * px_w * bpp + x * bpp] - 128) > 40
          or abs(data[y * px_w * bpp + x * bpp + 1] - 128) > 40
          or abs(data[y * px_w * bpp + x * bpp + 2] - 128) > 40]
    x0, x1 = (min(xs) - PAD) * scale, (max(xs) - PAD + 1) * scale
    y1, y0 = ph - (top - PAD) * scale, ph - (bottom + 1 - PAD) * scale
    return (x0, y0, x1, y1), (bs[1][0] - bottom) * scale     # rect, gap to wordmark


def rewrite_media_box(src, dst, rect):
    """Replace /MediaBox with the crop, padded to the identical byte length."""
    d = open(src, 'rb').read()
    m = re.search(rb'/MediaBox\s*\[\s*[-\d.]+\s+[-\d.]+\s+[-\d.]+\s+[-\d.]+\s*\]', d)
    if not m:
        sys.exit(f'{src}: no plain-text /MediaBox found')
    old = m.group(0)
    # MediaBox is [lowerLeftX lowerLeftY upperRightX upperRightY], not w/h
    # 0.1 pt precision: invisible, and keeps the box string short enough to
    # overwrite the original without moving a single xref offset
    x0, y0, x1, y1 = (round(v, 1) for v in rect)
    new = b'/MediaBox[%g %g %g %g]' % (x0, y0, x1, y1)
    if len(new) > len(old):
        sys.exit(f'{src}: new MediaBox is {len(new) - len(old)} bytes longer, '
                 'xref would break — refusing to write a damaged PDF')
    new = new[:-1] + b' ' * (len(old) - len(new)) + b']'
    open(dst, 'wb').write(d[:m.start()] + new + d[m.end():])
    return len(old), len(new)


def main():
    os.makedirs(OUT, exist_ok=True)
    made = []
    for name in sorted(os.listdir(SRC)):
        if not name.endswith('.pdf') or not name.startswith('aalto-'):
            continue                      # skip -fi-/-se-: the mark has no text
        if re.match(r'aalto-(fi|se)-', name):
            continue
        src = os.path.join(SRC, name)
        rect, gap = mark_rect(src)
        dst = os.path.join(OUT, name)
        old_len, new_len = rewrite_media_box(src, dst, rect)
        pw, ph = ml.page_size(src)
        print(f'  mark/{name:32} ink {rect[2]-rect[0]:6.2f} x {rect[3]-rect[1]:5.2f} pt '
              f'(page was {pw:.1f} x {ph:.1f}, gap to wordmark {gap:.1f} pt, '
              f'MediaBox {old_len} == {new_len} bytes)')
        made.append(dst)
    print(f'\n{len(made)} mark-only files in {os.path.relpath(OUT, ROOT)}')
    print('next: python3 assets/logo/measure-logos.py   # regenerate theme/logo-metrics.typ')


if __name__ == '__main__':
    main()
