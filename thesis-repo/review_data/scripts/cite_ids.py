"""Convert review-ID citations in a LaTeX source to biblatex citations with verified first pages.
\pc{R030}            -> \parencite[1]{slrR030}
\tc{R030}            -> \textcite[1]{slrR030}
\pcs{R030,O04,R041}  -> \parencites[1]{slrR030}[1]{fossowamba2022}[1]{slrR041}
"""
import json, re, sys

src, dst = sys.argv[1], sys.argv[2]
km = json.load(open("keymap.json"))
s = open(src, encoding="utf-8").read()


def one(rid):
    k = km[rid.strip()]
    return "[%s]{%s}" % (k["page"], k["key"])


s = re.sub(r"\\pcs\{([^}]+)\}", lambda m: "\\parencites" + "".join(one(r) for r in m.group(1).split(",")), s)
s = re.sub(r"\\pc\{([^}]+)\}", lambda m: "\\parencite" + one(m.group(1)), s)
s = re.sub(r"\\tc\{([^}]+)\}", lambda m: "\\textcite" + one(m.group(1)), s)
left = re.findall(r"\\(?:pc|tc|pcs)\{", s)
open(dst, "w", encoding="utf-8").write(s)
used = sorted(set(re.findall(r"\{((?:slr)?[A-Za-z]+\d{4}[a-z]*|slrR\d+)\}", s)))
print("converted; unconverted:", len(left))
