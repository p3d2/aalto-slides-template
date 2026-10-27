#!/usr/bin/env python3
"""Fetch the Aalto Scientific Computing (ASC) hexagon logo originals.

Source: the team's own documentation repo, AaltoSciComp/scicomp-docs (GitHub):
    _static/logo-hexagons-02-compact-background.svg   black ink on a white plate
    _meta/logo-hexagons-02-compact-white.svg          all-white, transparent

Written to assets/logo/scicomp/:
    asc-background.svg   byte-identical original (black on white plate — for
                         busy/dark photos where the plate keeps it legible)
    asc-white.svg        byte-identical original (white — for dark backgrounds)
    asc-black.svg        DERIVED from asc-white.svg by a mechanical colour swap
                         (#fff -> #000), giving black ink on a transparent
                         background — for light slides, incl. brand-colour
                         section slides where the white plate would show.
                         Paths are untouched; nothing is redrawn.

    python3 assets/logo/fetch-scicomp.py
    python3 assets/logo/measure-logos.py     # afterwards, as always

There is no separate "Triton" logo: scicomp.aalto.fi and every AaltoSciComp
repo brand Triton material with this same ASC hexagon lock-up.
"""
import os
import urllib.request

HERE = os.path.dirname(os.path.abspath(__file__))
OUT = os.path.join(HERE, 'scicomp')
RAW = 'https://raw.githubusercontent.com/AaltoSciComp/scicomp-docs/master/'
FILES = {
    'asc-background.svg': RAW + '_static/logo-hexagons-02-compact-background.svg',
    'asc-white.svg': RAW + '_meta/logo-hexagons-02-compact-white.svg',
}


def main():
    os.makedirs(OUT, exist_ok=True)
    for name, url in FILES.items():
        dest = os.path.join(OUT, name)
        print(f'  {url}\n    -> {os.path.relpath(dest, HERE)}')
        with urllib.request.urlopen(url) as r, open(dest, 'wb') as fh:
            fh.write(r.read())

    # derive the transparent black variant from the white original
    src = open(os.path.join(OUT, 'asc-white.svg')).read()
    black = src.replace('#fff', '#000').replace(
        'asc_logo_white_nimbussans', 'asc_logo_black_nimbussans')
    with open(os.path.join(OUT, 'asc-black.svg'), 'w') as fh:
        fh.write(black)
    print('  derived asc-black.svg (colour swap of asc-white.svg)')


if __name__ == '__main__':
    main()
