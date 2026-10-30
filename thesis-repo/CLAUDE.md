# Master thesis — handoff plan for Claude

SRH Hochschule Heidelberg master thesis (LaTeX), title: *From AI Capabilities to Sustainable Competitive Advantages: A Dynamic Capabilities Perspective in E-Commerce and Platform-Based Digital Business*. Chapters 1–5 are written. The core of the thesis is a systematic literature review (SLR) of 109 studies. **Your job is to verify the remaining coding against full texts and update the thesis, without breaking anything that already works.**

The author writes in Hinglish and prefers short, simple replies.

## Repository layout

```
thesis/                  LaTeX project (XeLaTeX + biber, compile from here)
  main.tex, Thesis.cls   document setup (Arial 12pt, 1.5 spacing, Harvard/biblatex authoryear)
  bibliography.bib       152 entries; review studies have keys slrRxxx / existing keys (see keymap.json)
  Chapters/Chapter1-5.tex
  Appendices/AppendixA.tex (search strings), AppendixB.tex (GENERATED - do not edit by hand)
review_data/
  SLR_Search_and_Screening.xlsx   search log, screening log, included studies, data extraction, second coding
  codebook.md                     coding rules - the single source of truth for every code
  extraction.txt                  final coding, one line per study (pipe-separated, header explains columns)
  final.json                      final adjudicated codes per study (tier, design, outcome, p1, p2, s/z/t, p3, q1-q7, evidence)
  extraction_before_adjudication.txt, recode_run1.json, compare.json   first coding, blind second coding, agreement stats
  fulltext_run2.json, browser_ft.json   full-text checks already done (29 studies)
  abstracts_all.json              abstracts of all 109 studies
  Chapter4.src.tex, Chapter5.src.tex    SOURCE of Chapters 4 and 5 (cite by review ID, e.g. \pc{R030})
  keymap.json                     review ID -> bibtex key + page used in citations
  fulltext_todo.md                the 80 studies still coded from abstracts only (12 core first)
  scripts/                        run all scripts from review_data/ (e.g. `python scripts/stats.py`)
docs/Academic Research Paper Guidelines 2022-03.pdf   SRH formatting guideline
```

## Hard rules

1. **Chapters 4 and 5 are generated.** Edit `review_data/Chapter4.src.tex` / `Chapter5.src.tex`, then run
   `python scripts/cite_ids.py Chapter4.src.tex ../thesis/Chapters/Chapter4.tex` (same for 5). Never edit `thesis/Chapters/Chapter4.tex` or `Chapter5.tex` directly. Chapters 1–3 are edited directly.
2. **Appendix B is generated**: `python scripts/make_appB.py`.
3. Code **only** by `codebook.md`. Firm performance is never coded as competitive advantage; SCA only when authors explicitly say sustained/long-term; new product performance = INNOV; P1 only for SCA/CA/FP/INNOV; no reported direction = `na` (insufficient evidence).
4. **Q7 (limitations)**: `yes`/`no` only when you actually read the full text (or the abstract mentions limitations), otherwise `not_assessable`. Never default to `no`. The quality score is Q1–Q6 (0–6): high = 6, medium = 4–5, low = 0–3. Q7 is reported separately.
5. **Do not invent anything.** No new papers, no guessed page numbers, no results that you did not read. Every citation needs a verified page (`keymap.json`). If you cannot access a full text, leave the study as abstract-based and say so.
6. Do **not** re-run `scripts/adjudicate.py` (one-off; it overwrites the first coding).
7. Keep the SRH format: content (Chapters 1–5) must stay **60–80 pages** (currently 63). Bibliography and appendices are in roman numerals; declaration of honour at the end, not in the TOC.
8. VHB journal ranking is **descriptive only**. It is never an inclusion/exclusion or quality criterion (the author decided this).
9. Personal details (name, matriculation number, supervisor) are deliberately removed from the title page. Leave them out.

## Build

```bash
cd thesis
xelatex main.tex && biber main && xelatex main.tex && xelatex main.tex
```
Check: no `!` errors in `main.log`, no undefined citations/references, and the last arabic page number is 60–80.

## Current state (31 Oct 2026)

- 109 included studies: 18 core (e-commerce/platforms), 91 supporting. PRISMA counts are in Chapter 3, Figure 3.1.
- Designs: Survey 56, Conceptual 16, Mixed 15, Qualitative/case 13, Panel/archival 7, Formal model 2.
- Outcomes: FP 32, CA 23, OTHER 18, SCA 11, INNOV 11, RES 8, BMI 6.
- P1: 63 +, 9 c, 5 n.s. (0), 2 −, 30 na. P2: 74 +, 3 c, 2 no mediation, 30 na. S/Z/T: 42/71/43, all three 20.
- Quality (Q1–Q6): 51 high, 47 medium, 11 low. Q7: 31 yes, 5 no, 73 not assessable.
- Evidence source: 29 full text, 80 abstract only.
- The second coding was AI-assisted (disclosed in Chapter 3). Agreement: tier κ .90, design .84, outcome .84, P1 .70, P2 .53, S/Z/T .37–.47.

## Remaining work — do it in this order

### Step 1 — Read before changing
Read `codebook.md`, `final.json`, `fulltext_todo.md`, Chapter 3 (sections on data extraction and quality) and `Chapter4.src.tex`. Run `python scripts/stats.py` and confirm it prints the numbers above.

### Step 2 — Full-text verification of the 80 abstract-only studies (core first)
For each study in `fulltext_todo.md`, open the full text with the DOI. The author may upload PDFs to `review_data/fulltexts/<ID>.pdf`; use those first. Record the results in a new file `review_data/fulltext_verified.json`, one entry per study:
```json
"R111": {"accessed": true, "source": "fulltexts/R111.pdf", "limitations_discussed": "yes",
         "limitations_evidence": "Section 6 'Limitations'", "sample": "312 managers, Saudi Arabia",
         "outcome": "FP", "p1": "+", "p2": "+", "s": false, "z": true, "t": false,
         "q1": 1, "q2": 1, "q3": 1, "q4": 1, "q5": 1, "q6": 1,
         "notes": "anything that differs from the abstract coding"}
```
If a full text cannot be accessed, write `"accessed": false` and change nothing for that study. Publisher bot checks or CAPTCHAs must not be bypassed.

### Step 3 — Apply the verified codes
Write `scripts/apply_fulltext.py`: load `final.json`, overwrite the fields of every accessed study with its verified values, set `evidence = "Full text"`, `q7` from `limitations_discussed`, recompute `q16` and `band`, keep a list of changed fields per study, and save. Also update the matching columns in `extraction.txt` (P1 col 16, P2 col 17, S/Z/T cols 9–11, Q string col 19 = six digits + y/n/?). Then run `python scripts/stats.py`, `python scripts/make_appB.py` and update the Excel sheet (adapt `scripts/update_xlsx.py`; back up the workbook first).

### Step 4 — Update the numbers in the text
Every number that depends on the coding has to match `stats.py`. Places that contain numbers:
- **Chapter 3** (`thesis/Chapters/Chapter3.tex`): PRISMA box (core/supporting), data-extraction paragraphs (full-text count 29 / abstract 80, kappa values), methodological limitations (80 abstract-only).
- **Chapter4.src.tex**: Table 4.1 (tier, designs, quality, Q7, evidence source), the quality paragraph, Figure 4.1 bar values `{label/core/supporting/y}`, Section 4.2 counts and Table 4.2, Table 4.3 (S/Z/T), Section 4.3 (P2 counts), Table 4.5 (propositions), the robustness paragraph (empirical / no-low / high / VHB subsets), Figure 4.4 (final model numbers), the limitations paragraph in 4.5.
- **Chapter5.src.tex**: Section 5.1 summary, RQ answers, limitations (5.3), future research (core count).
Search the PDF text afterwards for the old numbers to make sure none are left.

### Step 5 — Compile and cross-check
Compile, fix any errors, confirm 60–80 content pages, and list every number you changed (old → new) in a short report for the author.

### Step 6 — Still open (ask the author first)
- The **abstract** of the thesis is still empty (`main.tex`).
- Before final submission, the author must re-insert name, matriculation number and supervisor on the title page (SRH guideline 4.1.2).
- The author must disclose the use of AI tools according to SRH rules.

## What "done" looks like
All 109 studies are either full-text verified or explicitly marked as abstract-only with a reason; `final.json`, `extraction.txt`, the Excel workbook, Appendix B and Chapters 3–5 all show the same numbers; the PDF compiles without errors at 60–80 content pages.
