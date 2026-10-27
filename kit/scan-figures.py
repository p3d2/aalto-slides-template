#!/usr/bin/env python3
"""Scan a deck's figures/ folder and write figures/manifest.json for deckkit.

    python3 kit/scan-figures.py decks/20261120_Image_generation [more decks…]

Why: the slides reference figures by *name*, not by file — `fig("erodium-lines")`
— so swapping a raster for a vector export, or dropping in a new picture, never
touches a slide. This script is the only place that knows the extensions.

It also means a missing file is not a build error: an unknown name renders a
labelled placeholder, so a slide can be written before the picture exists.

Preference when one name has several formats (vector first):
    pdf > svg > png > webp > jpg > jpeg
"""
import json
import os
import re
import struct
import sys

PRIORITY = ["pdf", "svg", "png", "webp", "jpg", "jpeg"]


def dims(path):
    """Best-effort pixel/page size, for debugging only (never used for layout)."""
    try:
        with open(path, "rb") as fh:
            head = fh.read(64 * 1024)
    except OSError:
        return None
    if head[:8] == b"\x89PNG\r\n\x1a\n":
        return list(struct.unpack(">II", head[16:24]))
    if head[:2] == b"\xff\xd8":  # JPEG: scan for a SOF marker
        i = 2
        while i < len(head) - 9:
            if head[i] != 0xFF:
                i += 1
                continue
            marker = head[i + 1]
            if marker in (0xC0, 0xC1, 0xC2, 0xC3, 0xC5, 0xC6, 0xC7,
                          0xC9, 0xCA, 0xCB, 0xCD, 0xCE, 0xCF):
                h, w = struct.unpack(">HH", head[i + 5:i + 9])
                return [w, h]
            i += 2 + struct.unpack(">H", head[i + 2:i + 4])[0]
    text = head.decode("latin-1", "replace")
    m = re.search(r"<svg[^>]*\bviewBox=\"[\d.\-]+ ([\d.\-]+) ([\d.\-]+)", text)
    if m:
        return [float(m.group(1)), float(m.group(2))]
    m = re.search(rb"/MediaBox\s*\[\s*[\d.\-]+\s+[\d.\-]+\s+([\d.]+)\s+([\d.]+)", head)
    if m:
        return [float(m.group(1)), float(m.group(2))]
    return None


def scan(deck_dir, project_root):
    fig_dir = os.path.join(deck_dir, "figures")
    if not os.path.isdir(fig_dir):
        print(f"  no figures/ in {deck_dir}, skipped")
        return
    by_stem = {}
    for name in sorted(os.listdir(fig_dir)):
        p = os.path.join(fig_dir, name)
        if not os.path.isfile(p):
            continue
        stem, ext = os.path.splitext(name)
        ext = ext[1:].lower()
        if ext not in PRIORITY or stem == "manifest":
            continue
        by_stem.setdefault(stem, {})[ext] = name
    manifest = {
        # root-absolute (Typst --root = project root) so the slides never care
        # which file they are in.
        "_dir": "/" + os.path.relpath(os.path.abspath(fig_dir), project_root) + "/",
        "_generated_by": "kit/scan-figures.py — do not edit, re-run instead",
    }
    collisions = []
    for stem, variants in sorted(by_stem.items()):
        chosen = next(e for e in PRIORITY if e in variants)
        manifest[stem] = {
            "file": variants[chosen],
            "ext": chosen,
            "dims": dims(os.path.join(fig_dir, variants[chosen])),
        }
        if len(variants) > 1:
            collisions.append((stem, chosen, sorted(variants)))
    out = os.path.join(fig_dir, "manifest.json")
    with open(out, "w") as fh:
        json.dump(manifest, fh, indent=1, sort_keys=True)
        fh.write("\n")
    print(f"  {len(by_stem)} figures -> {out}")
    for stem, chosen, variants in collisions:
        print(f"    note: {stem} has {variants}, using {chosen}")


def main():
    root = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
    decks = sys.argv[1:] or [
        os.path.join("decks", d) for d in sorted(os.listdir(os.path.join(root, "decks")))
        if os.path.isdir(os.path.join(root, "decks", d, "figures"))
    ]
    for d in decks:
        deck_dir = d if os.path.isabs(d) else os.path.join(root, d)
        print(f"scanning {os.path.relpath(deck_dir, root)}")
        scan(deck_dir, root)


if __name__ == "__main__":
    main()
