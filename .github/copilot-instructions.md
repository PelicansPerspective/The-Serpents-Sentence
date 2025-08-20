

# Copilot Instructions for The-Serpent's-Sentence

## What this repo is
An academic book ecosystem for “The Serpent’s Sentence: Language, Consciousness, and the Second Cambrian Mind.” It includes: a LaTeX manuscript, a dual-format article portfolio, research notes, launch materials, and a privacy-safe public website.

## Architecture and why
- Manuscript/ (authoritative source): LaTeX book-class with biblatex+biber, microtype enabled, sections-only chapters. Separation of sources vs. outputs keeps the repo clean and reproducible.
- articles/: Markdown originals plus LaTeX counterparts (articles/latex) with TikZ figures; PDFs land in articles/pdfs. Dual publishing targets web and academic venues.
- notes/: Research pipeline (tiered notes + ai-research) backing claims and citations.
- launch-materials/ and public-website-package/: Promo copy and a GitHub Pages–ready site that contains no manuscript content (privacy-safe boundary).

## Critical workflows (PowerShell on Windows)
- Build manuscript: run Manuscript/compile-manuscript.ps1 (pdflatex → biber → pdflatex ×2). If you see “Please rerun LaTeX,” run once more. Output: Manuscript/main.pdf.
- Build article PDFs: in articles/latex, run .\compile-pdfs.ps1 (XeLaTeX required). Outputs to articles/pdfs; expected size ~103–108KB with TikZ graphics.
- Citations: use \parencite{key}; add entries to Manuscript/references.bib; recompile with biber. Undefined citations clear after the biber pass.

## Editing conventions (project-specific)
- Chapter structure: chapters use sections only (no subsections). Bridge labels are plain text (no italics), e.g., “Bridge to Chapter 3.”
- Style: favor declaratives over clusters of rhetorical questions; minimize stacked em-dashes; no italics for emphasis. Maintain the Garden metaphor throughout with vivid, sensory language.
- Overfull boxes: prefer micro-rewrites or shorter synonyms; discretionary hyphenation only as last resort. Rebuild and verify warnings are gone.
- Article LaTeX: keep two-column layout, real data in TikZ, and consistent naming; regenerate PDFs via the script rather than ad-hoc runs.

## Key files to know
- Manuscript/main.tex (root document) and compile-manuscript.ps1 (build).
- Manuscript/references.bib (single bibliography).
- Articles in articles/*.md and LaTeX sources in articles/latex/*.tex; build via articles/latex/compile-pdfs.ps1.
- Orientation docs: Synopsis.txt; .github/Detailed Chapter Outline.md; .github/Research Outline.md; .github/Guide.md.

## Integration boundaries
- Public site is privacy-safe: do not copy manuscript prose into public-website-package/.
- Articles adapt book themes but live in their own pipeline; keep markdown and LaTeX in sync when editing.

## Commit guidance
- Use descriptive, academically-informative messages (what changed + why). Example: “Ch.2: tighten empirical aside to resolve overfull; add Sapir–Whorf cites; rebuild (biber pass).”

Questions or gaps? Suggest improvements or ask for clarifications; we’ll iterate on this guide as workflows evolve.
