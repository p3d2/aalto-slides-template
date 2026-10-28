#!/usr/bin/env python3
"""Download every image/asset referenced by the mirrored brand pages.

Source list: prismic/media.json (built by to_markdown.py). Files land in
media/ with their Prismic basename; media/index.tsv maps url -> local path.
Re-runnable and incremental (existing non-empty files are skipped).

Usage:  python3 download_media.py [--kind asset|image|all] [--limit N]
"""
import json, os, re, sys, urllib.request, urllib.parse, collections

HERE = os.path.dirname(os.path.abspath(__file__))
rows = json.load(open(os.path.join(HERE, 'prismic', 'media.json')))
OUT = os.path.join(HERE, 'media')
os.makedirs(OUT, exist_ok=True)

kind = 'all'
limit = None
args = sys.argv[1:]
for i, a in enumerate(args):
    if a == '--kind': kind = args[i + 1]
    if a == '--limit': limit = int(args[i + 1])

def local_name(r):
    base = os.path.basename(urllib.parse.urlparse(r['url']).path)
    base = urllib.parse.unquote(base)
    base = re.sub(r'[^A-Za-z0-9._+-]+', '_', base)[:120]
    return base

# Signed Vimeo/YouTube redirect URLs expire and videos are huge — skip by default.
VIDEO_HOSTS = ('player.vimeo.com', 'youtube.com', 'youtu.be', 'vimeo.com')
def is_video(r):
    u = r['url'].lower()
    return u.endswith('.mp4') or u.endswith('.webm') or any(h in u for h in VIDEO_HOSTS)

sel = [r for r in rows if (kind == 'all' or r['kind'] == kind) and not is_video(r)]
if limit:
    sel = sel[:limit]

index, ok, skipped, failed = [], 0, 0, 0
for n, r in enumerate(sel, 1):
    name = local_name(r)
    dest = os.path.join(OUT, name)
    # avoid collisions between same-named files from different URLs
    if any(i['file'] == os.path.relpath(dest, HERE) for i in index):
        stem, ext = os.path.splitext(name)
        name, dest = f'{stem}-{n}{ext}', os.path.join(OUT, f'{stem}-{n}{ext}')
    if os.path.exists(dest) and os.path.getsize(dest) > 0:
        skipped += 1
    else:
        try:
            req = urllib.request.Request(r['url'], headers={'User-Agent': 'brand-library-mirror/1.0'})
            with urllib.request.urlopen(req, timeout=90) as resp, open(dest, 'wb') as f:
                f.write(resp.read())
            ok += 1
        except Exception as e:
            failed += 1
            print(f'FAIL {r["url"][:100]}: {e}', file=sys.stderr)
            continue
    index.append({'file': os.path.relpath(dest, HERE), 'kind': r['kind'], 'page': r['page'], 'url': r['url']})
    if n % 25 == 0:
        print(f'  {n}/{len(sel)} (ok {ok}, cached {skipped}, fail {failed})', file=sys.stderr)

with open(os.path.join(OUT, 'index.tsv'), 'w') as f:
    f.write('file\tkind\tpage\turl\n')
    for i in index:
        f.write(f'{i["file"]}\t{i["kind"]}\t{i["page"]}\t{i["url"]}\n')
sizes = collections.Counter()
for i in {x['file']: x for x in index}.values():
    p = os.path.join(HERE, i['file'])
    if os.path.exists(p):
        sizes[i['kind']] += os.path.getsize(p)
print(f'downloaded {ok}, cached {skipped}, failed {failed}, total {len(index)} files')
for k, v in sizes.items():
    print(f'  {k}: {v/1e6:.1f} MB')
