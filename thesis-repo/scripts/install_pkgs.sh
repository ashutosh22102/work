#!/bin/bash
# Cloud session setup (runs via the SessionStart hook in the repo-root .claude/settings.json).
# Installs Python packages for review_data/scripts and a XeLaTeX + biber toolchain.

if [ "$CLAUDE_CODE_REMOTE" != "true" ]; then
  exit 0
fi

# thesis-repo/ (the folder above this script)
cd "$(dirname "$0")/.." || exit 1

# pip skips requirements that are already satisfied
pip install -r requirements.txt

# LaTeX: skip if xelatex, biber and siunitx are already there
if ! command -v xelatex >/dev/null 2>&1 || ! command -v biber >/dev/null 2>&1 || ! kpsewhich siunitx.sty >/dev/null 2>&1; then
  SUDO=""; [ "$(id -u)" -ne 0 ] && SUDO="sudo"
  $SUDO apt-get update -qq
  # fonts-liberation: Liberation Sans is metric-compatible with Arial (main.tex falls back to it)
  DEBIAN_FRONTEND=noninteractive $SUDO apt-get install -y -qq \
    texlive-xetex texlive-latex-extra texlive-bibtex-extra texlive-fonts-recommended texlive-science \
    biber fonts-liberation
fi
exit 0
