# ONE-OFF: already run on 30 Oct 2026. Do NOT re-run - it overwrites extraction.txt and extraction_before_adjudication.txt.
"""Adjudicate coder A (original) vs coder B (blind, codebook) and write final codes into extraction.txt."""
import io, json, contextlib, shutil
with contextlib.redirect_stdout(io.StringIO()):
    import compare as C

# full-text evidence: workflow runs + browser checks
ft = {}
for fn in ("recode_run1.json", "fulltext_run2.json"):
    for f in json.load(open(fn, encoding="utf-8"))["result"]["fulltext"]:
        if f["accessed"]:
            ft[f["id"]] = f
for k, f in json.load(open("browser_ft.json", encoding="utf-8")).items():
    ft[k] = f

# fields where the adjudicated value is coder A's (otherwise coder B's codebook-based value)
TAKE_A = {"O02": ["outcome", "p1"], "O12": ["p1"], "O16": ["p1"], "R050": ["design"], "R085": ["design"],
          "R148": ["outcome"], "R184": ["tier"], "R247": ["tier"]}
CUSTOM = {"R059": {"p1": "0"},   # full text: AIC main effect on SCP non-significant, moderation not supported
          "R086": {"q6": 0}}     # full text: results are simulated values, not data
NOTES = {"R059": "Full text: AI capability tested as moderator; main effect on sustainable competitive performance non-significant",
         "R086": "Full text: reported results are simulated values; no empirical data",
         "R041": "Full text: 432 usable responses (abstract states 350)",
         "O05": "Abstract states aims only; direction of effects not reported"}
FIELDS = C.FIELDS
final = {}
for i in C.mine:
    a, b = C.mine[i], C.rec[i]
    f = {k: b[k] for k in FIELDS}
    for k in TAKE_A.get(i, []):
        f[k] = a[k]
    f.update({k: v for k, v in CUSTOM.get(i, {}).items() if k != "q7"})
    f["p3"] = b["p3"]
    if i in ft:
        f["q7"], f["evidence"] = ft[i]["limitations_discussed"], "Full text"
        f["ft_url"], f["ft_note"] = ft[i]["source_url"], ft[i].get("limitations_evidence", "")
    else:
        f["q7"], f["evidence"], f["ft_url"], f["ft_note"] = b["q7"], "Abstract", "", ""
    f["q16"] = sum(f[f"q{n}"] for n in range(1, 7))
    f["band"] = "high" if f["q16"] == 6 else "medium" if f["q16"] >= 4 else "low"
    f["changed"] = {k: [a[k], f[k]] for k in FIELDS if a[k] != f[k]}
    f["note"] = NOTES.get(i, "")
    final[i] = f
json.dump(final, open("final.json", "w", encoding="utf-8"), indent=1, ensure_ascii=False)

# rewrite extraction.txt
LAB = {"SCA": "SCA", "CA": "CA", "FP": "FP", "INNOV": "Innovation", "RES": "Resilience", "BMI": "BMI", "OTHER": "Other"}
shutil.copy("extraction.txt", "extraction_before_adjudication.txt")
out = []
for l in open("extraction.txt", encoding="utf-8"):
    if l.startswith("#") or not l.strip():
        out.append(l.rstrip("\n")); continue
    p = l.rstrip("\n").split("|")
    f = final[p[0]]
    if C.mine[p[0]]["design"] != f["design"]:
        p[1] = f["design"]
    if C.mine[p[0]]["outcome"] != f["outcome"]:
        inner = p[11][p[11].find("(") :] if "(" in p[11] else ""
        p[11] = (LAB[f["outcome"]] + " " + inner).strip()
    p[8], p[9], p[10] = ("x" if f[k] else "-" for k in "szt")
    p[15], p[16] = f["p1"], f["p2"]
    if p[0] == "R041": p[2] = "432 MSME owners/managers (full text; abstract: 350)"
    if p[0] in ("R059", "O05"): p[12] = NOTES[p[0]]
    p[18] = "".join(str(f[f"q{n}"]) for n in range(1, 7)) + {"yes": "y", "no": "n", "not_assessable": "?"}[f["q7"]]
    out.append("|".join(p))
out[1] = "# P1/P2: + supports, 0 non-significant / not supported, c conditional, - constraint/negative, na not addressed. Q1-Q6 0/1; Q7 y/n/? (? = not assessable). Abstract-based unless full text read (see final.json evidence)."
open("extraction.txt", "w", encoding="utf-8").write("\n".join(out) + "\n")

from collections import Counter
V = final.values()
print("tier", Counter(f["tier"] for f in V)); print("design", Counter(f["design"] for f in V))
print("outcome", Counter(f["outcome"] for f in V)); print("p1", Counter(f["p1"] for f in V)); print("p2", Counter(f["p2"] for f in V))
print("q7", Counter(f["q7"] for f in V), "evidence", Counter(f["evidence"] for f in V)); print("band", Counter(f["band"] for f in V))
print("S/Z/T", sum(f["s"] for f in V), sum(f["z"] for f in V), sum(f["t"] for f in V))
print("changed studies", sum(bool(f["changed"]) for f in V), Counter(k for f in V for k in f["changed"]))
