"""Apply full-text verified codes (fulltext_verified.json) to final.json and extraction.txt.

Only entries with "accessed": true are applied; all others stay abstract-based.
Run from review_data/: python scripts/apply_fulltext.py
Afterwards run stats.py, make_appB.py and update the Excel workbook.
"""
import json

FIELDS = ["outcome", "p1", "p2", "s", "z", "t", "q1", "q2", "q3", "q4", "q5", "q6"]
Q7 = {"yes": "y", "no": "n", "not_assessable": "?"}

F = json.load(open("final.json", encoding="utf-8"))
V = json.load(open("fulltext_verified.json", encoding="utf-8"))

def band(q):
    return "high" if q == 6 else "medium" if q >= 4 else "low"

applied = {}
for i, v in V.items():
    if not v.get("accessed"):
        continue
    f = F[i]
    ch = {}
    for k in FIELDS:
        if k in v and v[k] != f[k]:
            ch[k] = [f[k], v[k]]
            f[k] = v[k]
    q7 = v["limitations_discussed"]
    if q7 != f["q7"]:
        ch["q7"] = [f["q7"], q7]
        f["q7"] = q7
    f["evidence"] = "Full text"
    f["ft_url"] = v.get("source", "")
    f["ft_note"] = v.get("limitations_evidence", "")
    f["q16"] = sum(f[f"q{n}"] for n in range(1, 7))
    f["band"] = band(f["q16"])
    f["changed"].update({f"ft_{k}": c for k, c in ch.items()})
    applied[i] = ch

if not applied:
    print(f"applied 0 of {len(V)} - nothing accessed, files left unchanged")
    raise SystemExit
# keep the original CRLF line endings
with open("final.json", "w", encoding="utf-8", newline="\r\n") as fh:
    json.dump(F, fh, indent=1, ensure_ascii=False)

# extraction.txt: S/Z/T cols 9-11, outcome col 12, P1 col 16, P2 col 17, Q string col 19 (1-based)
lines = open("extraction.txt", encoding="utf-8", newline="").read().split("\r\n")
for n, l in enumerate(lines):
    if l.startswith("#") or not l.strip():
        continue
    p = l.split("|")
    i = p[0]
    if i not in applied:
        continue
    f = F[i]
    p[8], p[9], p[10] = ("x" if f["s"] else "-"), ("x" if f["z"] else "-"), ("x" if f["t"] else "-")
    if "outcome" in applied[i]:  # col 12 is descriptive text; replace only when the code changed
        p[11] = f["outcome"]
    p[15], p[16] = f["p1"], f["p2"]
    p[18] = "".join(str(f[f"q{k}"]) for k in range(1, 7)) + Q7[f["q7"]]
    lines[n] = "|".join(p)
open("extraction.txt", "w", encoding="utf-8", newline="").write("\r\n".join(lines))

print(f"applied {len(applied)} of {len(V)} (accessed=false: {len(V) - len(applied)})")
for i, ch in applied.items():
    print(i, ch or "no change")
