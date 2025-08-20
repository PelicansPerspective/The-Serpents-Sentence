# The Serpent's Sentence - Manuscript

This directory contains all the manuscript files for "The Serpent's Sentence: Language, Consciousness, and the Second Cambrian Mind."

## File Structure

- `main.tex` - Main LaTeX document that includes all chapters
- `introduction.tex` - Introduction chapter
- `chapter-1-garden-of-being.tex` - Chapter 1: The Garden of Being
- `chapter-2-serpents-gift.tex` - Chapter 2: The Serpent's Gift is a Sentence
- `chapter-3-prison-of-pronoun.tex` - Chapter 3: The Prison of the Pronoun
- `chapter-4-tower-of-babel.tex` - Chapter 4: The Tower of Babel: When the Fall Goes Viral
- `chapter-unbroken-mind-new.tex` - Chapter 10: The Unbroken Mind
- `afterword.tex` - Afterword: The Author in the Orchard
- `references.bib` - Bibliography file

## Compiling the Manuscript

### Windows

To compile the manuscript, run the provided PowerShell script:

```powershell
.\compile-manuscript.ps1
```

### Manual Compilation

If you prefer to compile manually, run the following commands:

```bash
pdflatex main.tex
biber main
pdflatex main.tex
pdflatex main.tex
```

The output will be generated as `main.pdf` in this directory.

## Notes

- Make sure you have a LaTeX distribution installed (e.g., MiKTeX, TeX Live)
- The bibliography is processed using Biber instead of BibTeX
- The document uses the book class with a 12pt font and letter paper size
