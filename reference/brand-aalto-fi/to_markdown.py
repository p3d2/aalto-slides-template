#!/usr/bin/env python3
"""Convert the mirrored Prismic documents (prismic/documents/*.json) into readable
Markdown under pages/, mirroring the site's URL structure. Re-runnable, offline."""
import json, glob, os, re, collections

HERE = os.path.dirname(os.path.abspath(__file__))
DOCS = os.path.join(HERE, 'prismic', 'documents')
PAGES = os.path.join(HERE, 'pages')
os.makedirs(PAGES, exist_ok=True)

IMG_SUFFIX = ('.png', '.jpg', '.jpeg', '.gif', '.webp', '.svg')
ASSET_SUFFIX = ('.pdf', '.zip', '.docx', '.pptx', '.ai', '.eps', '.ttf', '.otf', '.woff', '.woff2', '.mp4', '.csv', '.json', '.fig', '.sketch')

def rt(blocks):
    """Prismic rich text -> markdown."""
    out, items, ordered = [], [], None
    def flush():
        nonlocal items, ordered
        if items:
            mark = '1.' if ordered else '-'
            out.append('\n'.join(f'{mark} {i}' for i in items) + '\n')
            items, ordered = [], None
    for b in blocks or []:
        if not isinstance(b, dict) or 'type' not in b:
            continue
        t, text = b['type'], (b.get('text') or '').strip()
        spans = b.get('spans') or []
        # apply spans (bold/em/hyperlink) — simple, non-nesting-safe rendering
        if spans and text:
            marks = [''] * (len(text) + 1)
            for s in sorted(spans, key=lambda s: -(s['end'] - s['start'])):
                a, e, st = s['start'], s['end'], s.get('type')
                if a < 0 or e > len(text) or a >= e:
                    continue
                if st in ('strong', 'em'):
                    ch = '**' if st == 'strong' else '*'
                    marks[a], marks[e] = ch, ch
                elif st == 'hyperlink':
                    d = s.get('data') or {}
                    url = d.get('url') or (d.get('uid') and f"/{d['uid'].lstrip('_').replace('_', '/')}") or ''
                    if url:
                        marks[a] = '['
                        marks[e] = f']({url})'
            text = ''.join(marks[i] + c for i, c in enumerate(text))
        if t.startswith('heading'):
            flush()
            lvl = min(int(t[-1]) + 1, 6)
            if text:
                out.append('#' * lvl + ' ' + text + '\n')
        elif t == 'paragraph':
            if text:
                (items if ordered is not None else out).append(text + ('\n' if ordered is None else ''))
        elif t == 'list-item':
            if ordered is None or ordered is True:
                flush(); ordered = False
            items.append(text)
        elif t == 'o-list-item':
            if ordered is None or ordered is False:
                flush(); ordered = True
            items.append(text)
        elif t == 'preformatted':
            flush(); out.append('```\n' + (b.get('text') or '') + '\n```\n')
        elif t == 'image':
            flush()
            url = b.get('url') or ''
            out.append(f'![{b.get("alt") or ""}]({url})\n')
            if b.get('copyright'):
                out.append(f'<!-- credit: {b["copyright"]} -->\n')
        elif t == 'embed':
            flush()
            out.append(f'[embed]({(b.get("oembed") or {}).get("embed_url","")})\n')
    flush()
    return '\n'.join(x for x in out if x is not None)

# Slice fields that only describe how the website renders the block — folded into
# a single `<!-- layout: ... -->` comment instead of cluttering the text.
LAYOUT_KEYS = {'theme', 'alignment', 'align', 'tiles_per_row', 'skim', 'aspect_ratio',
               'image_aspect_ratio', 'columns', 'columns_mobile', 'variant', 'size',
               'position', 'direction', 'layout', 'background', 'show_', 'sticky'}

media = []          # (url, kind, page)
SKIP_KEYS = ('link_type', 'isBroken', 'key', 'id', 'tags', 'first_publication_date',
             'last_publication_date', 'dimensions', 'edit', 'copyright', 'alt', 'type',
             'slug', 'lang', 'href', 'url_')

def walk(node, path, out, uid):
    """Generic traversal of Prismic slice/field data."""
    if isinstance(node, dict):
        if node.get('url') and isinstance(node['url'], str) and re.match(r'https?://[^./]+\.', node['url']):
            u = node['url']
            kind = 'image' if u.lower().split('?')[0].endswith(IMG_SUFFIX) else (
                   'asset' if u.lower().split('?')[0].endswith(ASSET_SUFFIX) else 'link')
            media.append((u, kind, uid))
            out.append(f'**{path or "file"}:** <{u}>' + (f'  \n_{node["alt"]}_' if node.get('alt') else '') + '\n')
            return
        if 'link_type' in node and node['link_type'] not in (None, 'Any'):
            if node.get('url'):
                out.append(f'**{path or "link"}:** <{node["url"]}>\n')
            elif node.get('uid'):
                out.append(f'**{path or "link"}:** internal `{node["uid"]}`\n')
            return
        for k, v in node.items():
            if k in SKIP_KEYS or k.startswith('img_size'):
                continue
            if isinstance(v, (dict, list)) or (isinstance(v, str) and v.strip()):
                walk(v, f'{path}.{k}' if path else k, out, uid)
    elif isinstance(node, list):
        if node and all(isinstance(b, dict) and 'type' in b and ('text' in b or b['type'] in ('image','embed')) for b in node):
            md = rt(node)
            if md.strip():
                out.append(md)
            return
        if node and all(isinstance(b, dict) and 'slice_type' in b for b in node):
            for s in node:
                st = s.get('slice_type', 'slice')
                out.append(f'\n<!-- slice: {st}{"/"+s["slice_label"] if s.get("slice_label") else ""} -->\n')
                p = s.get('primary')
                if isinstance(p, dict):
                    walk(p, st, out, uid)
                for i, it in enumerate(s.get('items') or []):
                    if it:
                        walk(it, f'{st}[{i}]', out, uid)
            return
        for i, v in enumerate(node):
            walk(v, f'{path}[{i}]', out, uid)
    elif isinstance(node, str):
        if node.strip() and not re.match(r'^(Document|Web|Media|Any)$', node.strip()):
            leaf = path.rsplit('.', 1)[-1].split('[')[0]
            if leaf in LAYOUT_KEYS:
                out.append(f'@@layout {leaf}={node.strip()}@@')   # folded, see flush_layout()
            else:
                out.append(f'**{path}:** {node.strip()}\n')

def fold_layout(md):
    """Collect consecutive @@layout k=v@@ markers into one HTML comment."""
    out, buf = [], []
    for line in md.split('\n'):
        if line.startswith('@@layout '):
            buf.append(line[len('@@layout '):].removesuffix('@@'))
        else:
            if buf:
                out.append('<!-- layout: ' + ', '.join(buf) + ' -->')
                buf = []
            out.append(line)
    if buf:
        out.append('<!-- layout: ' + ', '.join(buf) + ' -->')
    return '\n'.join(out)

def path_from_uid(uid):
    p = uid.lstrip('.').replace('_', '/').replace('.', '/')
    return re.sub(r'/+', '/', p).strip('/') or 'index'

routes = {}
for f in sorted(glob.glob(os.path.join(DOCS, '*.json'))):
    d = json.load(open(f))
    uid = d.get('uid') or d['id']
    body = []
    walk(d.get('data') or {}, '', body, uid)
    md = f"# {path_from_uid(uid)}\n\n<!-- prismic type: {d['type']} · uid: {uid} · lang: {d.get('lang')} ·\n     last published: {d.get('last_publication_date')} · source: https://brand.aalto.fi/{path_from_uid(uid)} -->\n\n"
    md += fold_layout('\n'.join(x for x in body if x and x.strip()))
    rel = path_from_uid(uid) + '.md'
    os.makedirs(os.path.dirname(os.path.join(PAGES, rel)) or PAGES, exist_ok=True)
    open(os.path.join(PAGES, rel), 'w').write(md)
    routes[rel] = d['type']

# media inventory (dedup)
seen, rows = {}, []
for u, kind, uid in media:
    base = u.split('?')[0]
    if base in seen:
        continue
    seen[base] = True
    rows.append({'url': u, 'kind': kind, 'page': uid,
                 'name': os.path.basename(base)})
json.dump(rows, open(os.path.join(HERE, 'prismic', 'media.json'), 'w'), indent=1)
json.dump(routes, open(os.path.join(HERE, 'prismic', 'routes.json'), 'w'), indent=1)
c = collections.Counter(r['kind'] for r in rows)
print(f'pages: {len(routes)}  media: {len(rows)}  {dict(c)}')
