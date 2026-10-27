#!/usr/bin/env python3
"""Download the official Aalto logo originals from https://aaltologo.fi.

The brand rules say: only the official originals, never redrawn. This script
fetches them straight from the generator's own file store, so the local copies
are byte-identical to what the site serves (verified: the six files that were
downloaded by hand in the browser match `dl.php` output exactly, md5 for md5).

    ./fetch-logos.py                      # university set (default)
    ./fetch-logos.py --unit sci --unit chem
    ./fetch-logos.py --list               # show the catalogue, download nothing

Layout produced (see README.md for the full provenance table):

    primary/     mark + "Aalto University" on one line   (site: "..._21_...")
    secondary/   mark + trilingual name, 3 rows stacked  (site: "FI-SE-EN_21")
    tertiary/    mark + trilingual name, to the right    (site: "FI-SE-EN_13")

The generator also offers a single-language "13" (small/horizontal) version;
Aalto discontinued it and dl.php returns a notice PDF instead, so we skip it.
"""
import argparse, json, os, re, ssl, sys, urllib.request

BASE = 'https://aaltologo.fi'
UNITS = {  # values are the generator's FolderIds, scraped from aaltologo.fi
    'uni':   ('WtL2', 'Aalto University'),
    'arts':  ('qBQb', 'School of Arts, Design and Architecture'),
    'elec':  ('RKfg', 'School of Electrical Engineering'),
    'sci':   ('6fcM', 'School of Science'),
    'eng':   ('9s9B', 'School of Engineering'),
    'chem':  ('VR7S', 'School of Chemical Engineering'),
    'biz':   ('bD_j', 'School of Business'),
}
MARKS = {'1': 'question', '2': 'quote', '3': 'exclaim'}   # A?  A"  A!
HERE = os.path.dirname(os.path.abspath(__file__))
UA = {'User-Agent': 'Mozilla/5.0 (compatible; aalto-logo-fetch)',
      'Referer': BASE + '/'}


def get(url, binary=False):
    req = urllib.request.Request(url, headers=UA)
    with urllib.request.urlopen(req, timeout=60, context=ssl.create_default_context()) as r:
        data = r.read()
    return data if binary else data.decode('utf8')


def lockup(unit, lang, size):
    """Map the generator's (Language, Size) onto our lock-up names.

    The university's single-language "13" (small/horizontal) version was
    discontinued by Aalto — dl.php serves a notice PDF instead, so we skip it.
    Schools still publish their horizontal version as "13".
    """
    if lang == 'FI-SE-EN':
        return 'tertiary' if size == '13' else 'secondary'
    if size == '21':
        return 'primary'
    return None if unit == 'uni' else 'tertiary'


def local_name(unit, entry):
    lock = lockup(unit, entry['Language'], entry['Size'])
    mark = MARKS[entry['Filename'].rsplit('_', 1)[-1]]
    who = '' if unit == 'uni' else unit + '-'
    lang = '' if entry['Language'] == 'EN' else entry['Language'].lower() + '-'
    return lock, f"aalto-{who}{lang}{entry['Style'].lower()}-{mark}.pdf"


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--unit', action='append', default=None,
                    help='uni | arts | elec | sci | eng | chem | biz (default: uni)')
    ap.add_argument('--list', action='store_true')
    args = ap.parse_args()
    units = args.unit or ['uni']

    manifest = []
    for key in units:
        folder_id, unit_name = UNITS[key]
        cat = json.loads(get(f'{BASE}/files_{folder_id}.json'))
        for e in sorted(cat, key=lambda x: x['Filename']):
            if e['Format'] != 'pdf':
                continue
            lock = lockup(key, e['Language'], e['Size'])
            name = local_name(key, e)[1]
            status = lock or 'DISCONTINUED (skipped)'
            if args.list:
                print(f"  {key:5} {status:12} {name:34} <- {e['Filename']} ({e['File']})")
                continue
            if lock is None:
                print(f"  skip  {e['Filename']}  (single-language small version is discontinued)")
                continue
            out = os.path.join(HERE, lock, name)
            os.makedirs(os.path.dirname(out), exist_ok=True)
            data = get(f"{BASE}/dl.php?type=pdf&file={e['File']}", binary=True)
            if not data.startswith(b'%PDF'):
                sys.exit(f'expected a PDF for {e["File"]}, got {data[:40]!r}')
            open(out, 'wb').write(data)
            manifest.append((os.path.relpath(out, HERE), e['Filename'], e['File'], len(data)))
            print(f"  {os.path.relpath(out, HERE):44} <- {e['Filename']}")
    if not args.list:
        print(f"\n{len(manifest)} files in {HERE}")


if __name__ == '__main__':
    main()
