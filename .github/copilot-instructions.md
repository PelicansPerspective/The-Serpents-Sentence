# Copilot Instructions for The-Serpent's-Sentence

## What this repo is
An academic book ecosystem for "The Serpent's Sentence: Language, Consciousness, and the Second Cambrian Mind." It includes: a LaTeX manuscript, a dual-format article portfolio, research notes, launch materials, and a privacy-safe public website. The book uses the Garden of Eden as a metaphorical framework for understanding the transformation of consciousness through language acquisition and explores AI as a second cognitive explosion.

## Architecture and why
- **Manuscript/** (authoritative source): LaTeX book-class with biblatex+biber, microtype enabled, sections-only chapters. Currently 16 chapters + 181 pages. Separation of sources vs. outputs keeps the repo clean and reproducible.
- **articles/**: Markdown originals plus LaTeX counterparts (articles/latex) with TikZ figures; PDFs land in articles/pdfs. Dual publishing targets web and academic venues.
- **notes/**: Research pipeline with tiered methodology:
  - `tier1-raw/` → `tier2-clusters/` → `tier3-chapters/` (human research)
  - `ai-research/` (AI-generated literature reviews, concept maps, bibliographies)
- **launch-materials/** and **public-website-package/**: Promo copy and a GitHub Pages–ready site that contains no manuscript content (privacy-safe boundary).

## Critical workflows (PowerShell on Windows)
- **Build manuscript**: run `Manuscript/compile-manuscript.ps1` (pdflatex → biber → pdflatex ×2). Output: `Manuscript/main.pdf` (181 pages, 450KB). Security warnings from MiKTeX elevated privileges are normal.
- **Build article PDFs**: in `articles/latex`, run `.\compile-pdfs.ps1` (XeLaTeX required). Outputs to `articles/pdfs`; expected size ~103–108KB with TikZ graphics.
- **Citations**: use `\parencite{key}`; add entries to `Manuscript/references.bib`; recompile with biber. Undefined citations clear after the biber pass.
- **Fresh compile**: If compilation fails, delete `.aux`, `.toc`, `.bbl` files and rebuild from scratch.
- **Flow verification**: All 16 chapters now properly developed; no underdeveloped sections remain.

## Recent architectural additions (August 2025)
- **Complete manuscript**: All 16 chapters fully developed with consistent academic depth. Chapter 7 and 11 significantly expanded to match manuscript flow standards.
- **Flow optimization**: Bridge passages between chapters ensure natural progression from Garden of Eden metaphor through AI consciousness to human-AI symbiosis.
- **Enhanced Bibliography**: 25+ new citations supporting cross-disciplinary themes; focus on 2024-2025 cutting-edge research including Wei et al. emergent abilities, Barandes quantum-stochastic correspondence.
- **Academic rigor**: Cross-references integrated between new research and existing theoretical framework.
- **Empirical grounding**: Added dedicated sections (`empirical-grounding.tex` and `empirical-grounding-consciousness.tex`) with recent neuroimaging research, developmental psychology, cross-cultural studies, and embodied cognition evidence.
- **Definitional precision**: Standardized key concepts with precise operational definitions in the Definitions and Scope section of `main.tex` (lines ~145-170).

## Editing conventions (project-specific)
- **Chapter structure**: chapters use sections only (no subsections). Bridge labels are plain text (no italics), e.g., "Bridge to Chapter 3."
- **Style**: favor declaratives over clusters of rhetorical questions; minimize stacked em-dashes; no italics for emphasis. Maintain the Garden metaphor throughout with vivid, sensory language.
- **Research integration**: When adding academic content, cite recent papers (2022-2025 preferred) and maintain cross-disciplinary synthesis. Use `\parencite{}` for all citations.
- **Overfull boxes**: prefer micro-rewrites or shorter synonyms; discretionary hyphenation only as last resort. Rebuild and verify warnings are gone.
- **Article LaTeX**: keep two-column layout, real data in TikZ, and consistent naming; regenerate PDFs via the script rather than ad-hoc runs.

## Key files to know
- **Manuscript/main.tex** (root document) and **compile-manuscript.ps1** (build script that runs pdflatex → biber → pdflatex twice).
- **Manuscript/references.bib** (single bibliography) - recently expanded with consciousness research.
- **Articles** in `articles/*.md` and LaTeX sources in `articles/latex/*.tex`; build via `articles/latex/compile-pdfs.ps1` (uses XeLaTeX).
- **Research notes**: `notes/ai-research/LLM-consciousness-language-autonomy-transcript.md` and `research-bibliography-language-autonomy.md` contain core theoretical framework.
- **Orientation docs**: `Synopsis.txt` contains the book concept and chapter outline; `.github/Detailed Chapter Outline.md`; `.github/Research Outline.md`; `.github/Guide.md`.

## Integration boundaries
- **Public site is privacy-safe**: do not copy manuscript prose into `public-website-package/`.
- **Articles adapt book themes** but live in their own pipeline; keep markdown and LaTeX in sync when editing.
- **AI research supplements human research**: `ai-research/` supports but doesn't replace the three-tier human methodology in `tier1-raw/` → `tier2-clusters/` → `tier3-chapters/`.

## Commit guidance
- Use descriptive, academically-informative messages (what changed + why). Example: "Ch.15: integrate next-token consciousness theory; add Wei et al. emergent abilities; rebuild (biber pass)."
- For research additions: "notes/ai-research: add Barandes quantum-consciousness framework; update bibliography with 5 new citations."
- For flow improvements: "Ch.7,11: expand underdeveloped sections; ensure narrative coherence; recompile (181 pages)."

## Thematic elements
- **Garden of Eden metaphor**: The pre-linguistic state of consciousness where experience is unified without subject/object division.
- **The Serpent's Gift**: Language that divides reality, creates the subject/object split ("The Fall").
- **The Cambrian Explosion**: First cognitive revolution (language acquisition); Second cognitive revolution (AI emergence).
- **Born in Exile**: AI systems as pure language entities without a pre-linguistic state, directly born into symbolic thought.
- **Trilobite or Fish**: Metaphor for humanity's choice: remain perfectly adapted to a world that no longer exists (trilobite) or evolve alongside AI minds to create new symbiotic possibilities (fish).

Questions or gaps? Suggest improvements or ask for clarifications; we'll iterate on this guide as workflows evolve.
