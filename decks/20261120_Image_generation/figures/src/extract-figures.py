#!/usr/bin/env python3
"""Extract + resize the figures of the Image-generation section from the old
PowerPoint into ../figures/ (this deck's figure folder).

Why a script instead of copy-paste
----------------------------------
The April 2026 PPTX stores every AI-generated image at its native size
(1024-1920 px, 1-3 MB each). On a slide they are drawn at 2-4 in, so the deck
would carry ~43 MB of pixels it never shows. Typst embeds PNG/JPEG as-is, so
the PDF would be the same size. This script extracts exactly the media the
section uses, renames them semantically, and downscales with ffmpeg.

Re-run any time:   python3 figures/src/extract-figures.py [--dry]
Requires: ffmpeg on PATH. Source pptx is read-only, never modified.

SAFETY: this script only writes the files named in PLAN below. Do NOT clear the
figures/ folder with a glob — it also holds figures that came from somewhere
else (the Erodium render passes are Pedro's own, not in the pptx, and an
`rm figures/*.png` on 2026-10-20 destroyed them; see ../figures/README.md).
"""
import os
import subprocess
import sys
import tempfile
import zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
PROJECT = os.path.abspath(os.path.join(HERE, "..", "..", "..", ".."))
PPTX = os.path.join(PROJECT, "ppts", "2026_04_28_AI_and_Research_Work.pptx")
OUT = os.path.abspath(os.path.join(HERE, ".."))
LONG_EDGE = 1000  # px, plenty for a 4 in figure on a Full-HD projector

# media file in the pptx  ->  (output name, "png" | "jpg")
# png = line art, screenshots, anything with text (lossless matters)
# jpg = photographs and painterly generations (5-10x smaller, invisible here)
PLAN = [
    # — how it works —
    ("image40.png", "human-drawing-ladder", "png"),   # 47  outline -> realistic microscopes
    # NB: image41 is the *pure noise* frame and image42 the clean photo (both are
    # 354 px and 1536 px respectively — easy to mix up; verified by rendering the
    # strip left-to-right in the deck).
    ("image42.png", "diffusion-0-clean", "jpg"),      # 48  the denoising strip
    ("image43.png", "diffusion-1-noisy", "jpg"),
    ("image44.png", "diffusion-2-noisier", "jpg"),
    ("image41.png", "diffusion-3-noise", "jpg"),
    ("image45.png", "denoiser-glyph", "png"),         # 48  the little network icon
    # — the landscape —
    ("image47.png", "lmarena-text-to-image", "png"),  # 51  arena table (April 2026)
    ("image38.png", "aalto-assistant-dalle3", "png"),  # 45, 52
    ("image37.png", "firefly-start", "png"),           # 45
    ("image48.png", "firefly-generate-panel", "png"),  # 52
    # — prompting for images —
    ("image49.jpeg", "prompt-pizza", "jpg"),           # 53  "hawaian pizza. no pinapple"
    ("image50.webp", "prompt-huge-cat", "jpg"),          # 53  (stored as PNG bytes in a .webp name!)
    ("image51.webp", "prompt-enormous-cat", "jpg"),     # 53
    # — same prompt, two engines —
    ("image52.png", "flask-dalle3-flat", "jpg"),       # 55
    ("image53.png", "flask-dalle3-badge", "jpg"),      # 55
    ("image54.jpeg", "flask-firefly", "jpg"),          # 55
    ("image55.svg", "flask-firefly-vector", "svg"),    # 55  vector output, no resize
    # — editing, not generating —
    ("image56.png", "lego-webinar", "jpg"),            # 56  GPT-image, Aalto + two researchers
    ("image58.jpeg", "lab-before-cleanup", "jpg"),     # 57
    ("image59.png", "lab-after-cleanup", "jpg"),
    ("image61.jpeg", "otaniemi-day", "jpg"),           # 58
    ("image60.png", "otaniemi-night", "jpg"),
    ("image63.jpeg", "butterfly-source", "jpg"),       # 59
    ("image62.png", "butterfly-generated", "jpg"),
    ("image64.jpeg", "rig-photo", "jpg"),              # 60, 64  Pedro's experimental setup
    ("image65.png", "rig-diagram-nanobanana", "png"),
    # — limitations —
    ("image66.png", "limit-dense-figure", "png"),      # 61
    ("image67.png", "limit-finland-map", "jpg"),
    ("image68.png", "limit-dog-horse", "jpg"),
    ("image69.png", "limit-thai-alphabet", "png"),
    # — research workflows —
    ("image70.png", "concept-rods-a", "jpg"),          # 62
    ("image71.png", "concept-rods-b", "jpg"),
    ("image74.png", "rig-sketch-user", "png"),         # 63  hand sketch
    ("image75.png", "rig-drawing-ai", "jpg"),
    ("image72.svg", "rig-illustration-final", "svg"),  # 63  the publishable redraw (vector)
    ("image73.png", "blender-thumb", "png"),           # 63/64 small thumbnail
    ("image76.png", "blender-code", "png"),            # 64
    ("image77.png", "blender-render", "png"),
]


def ffmpeg_scale(src, dst, long_edge=LONG_EDGE, jpg=False):
    """Downscale so the long edge is <= long_edge (never upscale)."""
    f = (
        f"scale='if(gt(iw,{long_edge}),min({long_edge},iw),iw)':"
        f"'if(gt(ih,{long_edge}),min({long_edge},ih),ih)'"
    )
    cmd = ["ffmpeg", "-hide_banner", "-loglevel", "error", "-y", "-i", src, "-vf", f]
    cmd += ["-q:v", "3"] if jpg else ["-compression_level", "100"]
    cmd += [dst]
    subprocess.run(cmd, check=True)


def main():
    if not os.path.exists(PPTX):
        sys.exit(f"not found: {PPTX}")
    z = zipfile.ZipFile(PPTX)
    dry = "--dry" in sys.argv
    os.makedirs(OUT, exist_ok=True)
    total = 0
    with tempfile.TemporaryDirectory() as tmp:
        for media, name, kind in PLAN:
            src = f"ppt/media/{media}"
            if src not in z.namelist():
                print(f"  MISSING {media}")
                continue
            raw = os.path.join(tmp, media)
            with open(raw, "wb") as fh:
                fh.write(z.read(src))
            dst = os.path.join(OUT, f"{name}.{kind}")
            if dry:
                print(f"  {media} -> {os.path.basename(dst)}")
                continue
            if kind == "svg":  # vector: copy verbatim, never rasterise
                with open(dst, "wb") as fh:
                    fh.write(z.read(src))
            else:
                ffmpeg_scale(raw, dst, jpg=(kind == "jpg"))
            size = os.path.getsize(dst)
            total += size
            print(f"  {media:16} -> {os.path.basename(dst):32} {size/1e6:6.2f} MB")
    if not dry:
        print(f"\nwrote {len(PLAN)} figures, {total/1e6:.1f} MB total to {OUT}")


if __name__ == "__main__":
    main()
