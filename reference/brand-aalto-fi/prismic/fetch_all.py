#!/usr/bin/env python3
"""Download every document from the Aalto brand library Prismic repo (public read token
extracted from the site bundle). Saves raw JSON per document + an index. Re-runnable."""
import json, os, re, sys, urllib.parse, urllib.request

HERE = os.path.dirname(os.path.abspath(__file__))
TOK = open(os.path.join(HERE, '.token')).read().strip()
ROOT_URL = f"https://Aalto-Master-Design-System.cdn.prismic.io/api/v2?access_token={urllib.parse.quote(TOK)}"
SEARCH = "https://aalto-master-design-system.cdn.prismic.io/api/v2/documents/search"
OUT = os.path.join(HERE, 'documents')
os.makedirs(OUT, exist_ok=True)

def get(url):
    req = urllib.request.Request(url, headers={'User-Agent': 'brand-library-mirror/1.0'})
    with urllib.request.urlopen(req, timeout=60) as r:
        return json.load(r)

root = get(ROOT_URL)
json.dump(root, open(os.path.join(HERE, 'api-root.json'), 'w'), indent=1)
master = next(r['ref'] for r in root['refs'] if r['id'] == 'master')
json.dump(root['bookmarks'], open(os.path.join(HERE, 'bookmarks.json'), 'w'), indent=1)
print('bookmarks:', len(root['bookmarks']))

docs, page, n = [], SEARCH + f"?access_token={urllib.parse.quote(TOK)}&ref={master}&pageSize=100&orderings=[document.first_publication_date]", 0
while page:
    d = get(page)
    docs += d['results']
    n += 1
    page = d.get('next_page')
    if page and 'access_token' not in page:
        page += f"&access_token={urllib.parse.quote(TOK)}"
    print(f"  page {n}: {len(d['results'])} docs (total {len(docs)})", file=sys.stderr)

index = []
def slug(s):
    return re.sub(r'[^A-Za-z0-9._-]+', '-', s or '').strip('-').lower()[:80] or 'untitled'

seen = {}
for d in docs:
    key = f"{d['type']}__{slug(d.get('uid') or d.get('first_publication_date'))}"
    if key in seen:
        seen[key] += 1
        key = f"{key}-{seen[key]}"
    else:
        seen[key] = 1
    fn = key + '.json'
    json.dump(d, open(os.path.join(OUT, fn), 'w'), indent=1, ensure_ascii=False)
    index.append({'file': fn, 'id': d['id'], 'uid': d.get('uid'), 'type': d['type'],
                  'tags': d.get('tags'), 'lang': d.get('lang'),
                  'first_publication_date': d.get('first_publication_date'),
                  'last_publication_date': d.get('last_publication_date')})
index.sort(key=lambda r: (r['type'], r['uid'] or ''))
json.dump(index, open(os.path.join(HERE, 'index.json'), 'w'), indent=1, ensure_ascii=False)
from collections import Counter
for t, c in sorted(Counter(i['type'] for i in index).items()):
    print(f"{c:4d}  {t}")
print('total', len(index))
