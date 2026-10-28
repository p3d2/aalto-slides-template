#!/usr/bin/env python3
"""Build INDEX.md: every mirrored page, grouped by site section, with title,
last-publication date, local path and live URL. Also renders the side-menu trees
so the site hierarchy is visible offline. Re-runnable, offline."""
import json, glob, os, re, collections

HERE = os.path.dirname(os.path.abspath(__file__))
DOCS = os.path.join(HERE, 'prismic', 'documents')

def path_from_uid(uid):
    p = uid.lstrip('.').replace('_', '/').replace('.', '/')
    return re.sub(r'/+', '/', p).strip('/') or 'index'

def rt_text(blocks):
    return ' '.join((b.get('text') or '') for b in blocks or [] if isinstance(b, dict)).strip()

def title_of(d):
    """First heading/paragraph text in the document, else the slug."""
    def hunt(node, depth=0):
        if depth > 6: return None
        if isinstance(node, list):
            for b in node:
                if isinstance(b, dict):
                    if b.get('type', '').startswith('heading') and (b.get('text') or '').strip():
                        return b['text'].strip()
                    r = hunt(b, depth + 1)
                    if r: return r
        elif isinstance(node, dict):
            for k, v in node.items():
                if k in ('image', 'img_size_xs', 'img_size_s', 'img_size_m', 'img_size_l',
                         'img_size_xl', 'img_size_xxl', 'edit', 'dimensions'):
                    continue
                r = hunt(v, depth + 1)
                if r: return r
        return None
    return hunt(d.get('data') or {}) or d.get('slugs', ['?'])[0]

docs = {}
for f in sorted(glob.glob(os.path.join(DOCS, '*.json'))):
    d = json.load(open(f))
    uid = d.get('uid') or d['id']
    docs[uid] = {'title': title_of(d), 'type': d['type'], 'path': path_from_uid(uid),
                 'date': (d.get('last_publication_date') or '')[:10], 'tags': d.get('tags') or []}

# side-menu trees (site hierarchy)
menus = []
for f in sorted(glob.glob(os.path.join(DOCS, 'design_system_sidemenu*.json'))):
    d = json.load(open(f))
    section = (d.get('uid') or '').lstrip('_')
    lines = [f'### `{section}` side menu\n']
    for s in (d['data'].get('body') or []):
        p = s.get('primary') or {}
        head = rt_text(p.get('section_title'))
        link = p.get('section_title_link') or {}
        uid = link.get('uid')
        ref = f' → `{uid}`' if uid else ''
        lines.append(f'- **{head}**{ref}')
        for it in s.get('items') or []:
            lab = rt_text(it.get('section_link_label'))
            l = it.get('section_link') or {}
            if not lab:
                continue
            hidden = ' _(hidden)_' if it.get('hidden') else ''
            ref = f' → `{l.get("uid")}`' if l.get('uid') else ''
            lines.append(f'  - {lab}{ref}{hidden}')
    menus.append('\n'.join(lines))

# top navigation
nav = []
for f in glob.glob(os.path.join(DOCS, 'top_navigation*.json')):
    d = json.load(open(f))
    for s in (d['data'].get('body') or []):
        p = s.get('primary') or {}
        lab = rt_text(p.get('link_label'))
        l = p.get('link') or {}
        if lab:
            u = l.get('uid')
            nav.append(f'- **{lab}** (`{p.get("domain")}`, theme `{p.get("default_theme")}`)'
                       + (f' → `{u}`' if u else ''))

groups = collections.defaultdict(list)
for uid, m in docs.items():
    top = m['path'].split('/')[0] if '/' in m['path'] else '(top level)'
    groups[top].append((m['path'], uid, m))

L = [f'# brand.aalto.fi — offline mirror index',
     '',
     f'{len(docs)} documents mirrored from the Prismic CMS behind <https://brand.aalto.fi>',
     f'(repository `Aalto-Master-Design-System`, language `en-eu`).',
     '',
     'Regenerate everything with `./refresh.sh` (see README.md).',
     '',
     '## Top navigation', '', *nav, '',
     '## Side menus', '', *menus, '',
     '## All pages', '']
for g in sorted(groups, key=lambda g: (g == '(top level)', g)):
    L.append(f'### {g}\n')
    L.append('| Page | Title | Type | Last published |')
    L.append('|---|---|---|---|')
    for path, uid, m in sorted(groups[g]):
        anchor = uid.lstrip('_').replace('.', '')
        L.append(f'| [`{path}`]({os.path.relpath(os.path.join(HERE,"pages",path+".md"), HERE)}) '
                 f'| {m["title"]} | {m["type"]} | {m["date"]} |')
    L.append('')
open(os.path.join(HERE, 'INDEX.md'), 'w').write('\n'.join(L))
json.dump({uid: m for uid, m in docs.items()}, open(os.path.join(HERE, 'prismic', 'pages.json'), 'w'), indent=1)
print(f'INDEX.md: {len(docs)} pages, {len(groups)} groups, {len(menus)} menus')
