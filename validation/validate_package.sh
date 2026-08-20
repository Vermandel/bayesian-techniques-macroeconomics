#!/usr/bin/env bash
set -u
root="$(cd "$(dirname "$0")/.." && pwd)"
fail=0

for model in unemployment open_economy mortgage credit_market; do
  dir="$root/assessment/models/$model"
  test -f "$dir/README.md" || { echo "FAIL missing README: $model"; fail=1; }
  test -f "$dir/run_all.m" || { echo "FAIL missing run_all.m: $model"; fail=1; }
  test -f "$dir/download_data.py" || { echo "FAIL missing downloader: $model"; fail=1; }
  find "$dir" -maxdepth 1 -type f -name '*.mod' -print -quit | grep -q . || { echo "FAIL missing MOD: $model"; fail=1; }
  find "$dir" -maxdepth 1 -type f -name '*.pdf' -print -quit | grep -q . || { echo "FAIL missing PDF: $model"; fail=1; }
done

python3 -m py_compile "$root"/assessment/models/*/download_data.py || fail=1
echo "PASS assessment downloaders parse"

for pdf in "$root"/handouts/*.pdf; do
  pages="$(pdfinfo "$pdf" | awk '/^Pages:/{print $2}')"
  test "${pages:-0}" -gt 0 || { echo "FAIL unreadable PDF: $pdf"; fail=1; }
done
echo "PASS four handout PDFs readable"

python3 - "$root" <<'PY' || fail=1
import pathlib, re, sys
root = pathlib.Path(sys.argv[1])
bad = []
for md in root.rglob('*.md'):
    text = md.read_text(encoding='utf-8')
    for target in re.findall(r'\[[^]]+\]\(([^)]+)\)', text):
        if target.startswith(('http://','https://','#')) or '[' in target:
            continue
        if not (md.parent / target).resolve().exists():
            bad.append(f'{md.relative_to(root)} -> {target}')
if bad:
    print('FAIL unresolved Markdown links:')
    print('\n'.join(bad))
    raise SystemExit(1)
print('PASS all relative Markdown links resolve')
PY

if grep -RIE '/mnt/c/Users|Dropbox\\Teaching|AKIA[0-9A-Z]{16}|ghp_[A-Za-z0-9]{20,}|BEGIN (RSA|OPENSSH|EC) PRIVATE KEY' "$root" --exclude-dir=validation --exclude='*.pdf' --exclude='*.mat'; then
  echo "FAIL path or credential pattern found"
  fail=1
else
  echo "PASS no historical absolute path or obvious credential pattern"
fi

find "$root" -path "$root/.git" -prune -o -type f ! -path '*/validation/manifest.sha256' -print0 \
  | sort -z | xargs -0 sha256sum > "$root/validation/manifest.sha256"
echo "PASS manifest generated"
exit "$fail"
