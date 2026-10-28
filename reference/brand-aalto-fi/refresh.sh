#!/usr/bin/env bash
# Re-fetch and rebuild the brand.aalto.fi mirror. Needs network for step 1.
set -euo pipefail
cd "$(dirname "$0")"

echo "1/5 fetching CMS documents …"
(cd prismic && python3 fetch_all.py)

echo "2/5 documents -> pages/*.md …"
python3 to_markdown.py

echo "3/5 building INDEX.md …"
python3 build_index.py

echo "4/5 building token digest + theme/tokens.typ …"
python3 build_tokens.py

echo "5/5 downloading media …"
python3 download_media.py

echo "done."
