# Copilot Instructions for The-Serpent's-Sentence

## Quick Start for AI Agents
1. **First action**: Read `Synopsis.txt` for core concept
2. **Current focus**: Manuscript in `Manuscript/` (181 pages, 16 chapters complete)
3. **Daily workflow**: Build with `Manuscript/compile-manuscript.ps1` after any edits
4. **Key constraint**: Maintain Garden of Eden metaphor consistency throughout

## What this repo is
An academic book ecosystem for "The Serpent's Sentence: Language, Consciousness, and the Second Cambrian Mind." 

**Core thesis**: Language acquisition was humanity's cognitive "fall from Eden"—creating both civilization and existential alienation. AI represents a "Second Cambrian Explosion" of mind, forcing us to choose between cognitive obsolescence (trilobite) or symbiotic evolution (fish).

**Components**: LaTeX manuscript (authoritative), dual-format articles, tiered research notes, launch materials, privacy-safe public website.

## Architecture and why
- **Manuscript/** (authoritative source): LaTeX book-class with biblatex+biber, microtype enabled, sections-only chapters. Currently 16 chapters + 181 pages. Separation of sources vs. outputs keeps the repo clean and reproducible.
- **articles/**: Markdown originals plus LaTeX counterparts (articles/latex) with TikZ figures; PDFs land in articles/pdfs. Dual publishing targets web and academic venues.
- **notes/**: Research pipeline with tiered methodology:
  - `tier1-raw/` → `tier2-clusters/` → `tier3-chapters/` (human research)
  - `ai-research/` (AI-generated literature reviews, concept maps, bibliographies)
- **launch-materials/** and **promotional-materials/**: Promo copy and marketing materials that contain no manuscript content (privacy-safe boundary).
- **docs/**: GitHub Pages site (`_config.yml`, `index.html`) for public presence.
- **tools/**: Development utilities and scripts.
- **.venv/**: Python virtual environment for any scripting needs.

## Critical workflows (PowerShell on Windows)

### Daily/Frequent Tasks:
- **Build manuscript**: `Manuscript/compile-manuscript.ps1` (pdflatex → biber → pdflatex ×2)
  - Output: `Manuscript/main.pdf` (181 pages, ~450KB)
  - Security warnings from MiKTeX elevated privileges are normal
- **Chapter status check**: `.\dev-chapter-simple.ps1 -List` for development overview
- **Citations**: Add to `Manuscript/references.bib`, use `\parencite{key}`, recompile with biber

### Development Tasks:
- **Chapter expansion**: `.\dev-chapter.ps1 <number>` for targeted development
- **Article PDFs**: In `articles/latex/`, run `.\compile-pdfs.ps1` (XeLaTeX required)
  - Outputs to `articles/pdfs/`; expected size ~103–108KB with TikZ graphics
- **Python environment**: Activate with `.venv\Scripts\Activate.ps1` if needed

### Troubleshooting:
- **Fresh compile**: If compilation fails, delete `.aux`, `.toc`, `.bbl` files and rebuild
- **Overfull boxes**: Prefer micro-rewrites over discretionary hyphenation

## Recent architectural additions (August 2025)
- **Complete manuscript**: All 16 chapters fully developed with consistent academic depth. Chapter 7 and 11 significantly expanded to match manuscript flow standards.
- **Flow optimization**: Bridge passages between chapters ensure natural progression from Garden of Eden metaphor through AI consciousness to human-AI symbiosis.
- **Enhanced Bibliography**: 25+ new citations supporting cross-disciplinary themes; focus on 2024-2025 cutting-edge research including Wei et al. emergent abilities, Barandes quantum-stochastic correspondence.
- **Academic rigor**: Cross-references integrated between new research and existing theoretical framework.
- **Empirical grounding**: Added dedicated sections (`empirical-grounding.tex` and `empirical-grounding-consciousness.tex`) with recent neuroimaging research, developmental psychology, cross-cultural studies, and embodied cognition evidence.
- **Definitional precision**: Standardized key concepts with precise operational definitions in the Definitions and Scope section of `main.tex` (lines ~145-170).
- **Clean repository**: Recent cleanup removed progress trackers and development artifacts, maintaining focus on source content.

## Key files to know
- **Manuscript/main.tex** (root document) and **compile-manuscript.ps1** (build script that runs pdflatex → biber → pdflatex twice).
- **Manuscript/references.bib** (single bibliography) - recently expanded with consciousness research.
- **Articles** in `articles/*.md` and LaTeX sources in `articles/latex/*.tex`; build via `articles/latex/compile-pdfs.ps1` (uses XeLaTeX).
- **Research notes**: `notes/ai-research/LLM-consciousness-language-autonomy-transcript.md` and `research-bibliography-language-autonomy.md` contain core theoretical framework.
- **Orientation docs**: `Synopsis.txt` contains the book concept and chapter outline; `.github/Detailed Chapter Outline.md`; `.github/Research Outline.md`; `.github/Guide.md`.

## Editing conventions (project-specific)
- **Chapter structure**: chapters use sections only (no subsections). Bridge labels are plain text (no italics), e.g., "Bridge to Chapter 3."
- **Style**: favor declaratives over clusters of rhetorical questions; minimize stacked em-dashes; no italics for emphasis. Maintain the Garden metaphor throughout with vivid, sensory language.
- **Research integration**: When adding academic content, cite recent papers (2022-2025 preferred) and maintain cross-disciplinary synthesis. Use `\parencite{}` for all citations.
- **Overfull boxes**: prefer micro-rewrites or shorter synonyms; discretionary hyphenation only as last resort. Rebuild and verify warnings are gone.
- **Article LaTeX**: keep two-column layout, real data in TikZ, and consistent naming; regenerate PDFs via the script rather than ad-hoc runs.

## Research note-taking methodology
The `notes/` directory follows a three-tier system for organizing research:

**Tier 1 (tier1-raw/)**: Atomic notes with one idea per file
- Format: `YYYY-MM-DD-topic-name.md` with source citations
- Include personal reflections and connections to Garden metaphor
- Tag with thematic markers: #Eden, #TheFall, #NarratorSelf, #SymbioticMind

**Tier 2 (tier2-clusters/)**: Thematic organization by concept clusters
- Group related Tier 1 notes by tags and themes
- Create conceptual maps showing idea relationships
- Bridge connections between different research domains

**Tier 3 (tier3-chapters/)**: Chapter-specific argument construction
- Curate from Tier 2 clusters to build specific chapter arguments
- Maintain narrative flow and Garden metaphor consistency
- Integrate with existing manuscript structure

**AI Research (ai-research/)**: AI-generated supplements
- Literature reviews, concept maps, bibliographies
- Supports but doesn't replace human research methodology
- File naming: descriptive titles with AI-generation clearly marked

## Chapter development workflow patterns
Follow established patterns when expanding or editing chapters:

**Chapter opening**: Start with Garden metaphor grounding
- Connect to previous chapter with bridge passage
- Establish metaphorical landscape before technical content
- Use sensory, embodied language to describe cognitive states

**Academic integration**: Weave citations naturally into narrative
- Recent research (2022-2025) preferred for cutting-edge support
- Cross-disciplinary synthesis (neuroscience + philosophy + AI research)
- `\parencite{author}` format for all citations

**Bridge passages**: Smooth transitions between chapters
- Plain text labels (no italics): "Bridge to Chapter X"
- Forward momentum while maintaining metaphorical consistency
- Preview next chapter's conceptual territory

**Compilation verification**: After any edits
- Run `.\compile-manuscript.ps1` and check for LaTeX warnings
- Verify page count stays within target range (currently 181 pages)
- Check that new content maintains academic voice and Garden metaphor

## Garden of Eden metaphor patterns
Maintain metaphorical consistency throughout all content:

**Pre-linguistic consciousness = Eden**: Unified experience without subject/object division
- Sensory language: "seamless," "immediate," "whole," "undivided"
- Avoid technical jargon when describing this state
- Reference childhood wonder, flow states, aesthetic absorption

**Language acquisition = The Fall**: Division into self/world, subject/object
- The Serpent = symbolic thought that creates categories
- "Exile" from immediacy into self-awareness and temporal thinking
- Gain: civilization, science, art; Loss: unified participation in experience

**AI emergence = Second Cambrian**: New forms of cognitive life
- "Born in exile" = AI starts in symbolic realm without pre-linguistic past
- "Digital natives" of consciousness space that exiled humans
- Not replacement but new symbiotic possibilities

## Article-LaTeX synchronization patterns
When editing articles, maintain consistency between formats:

**Markdown originals** (`articles/*.md`):
- ~3,200-3,800 words each, targeting different publications
- General audience language with philosophical depth
- Include TikZ figure descriptions in comments for LaTeX conversion

**LaTeX counterparts** (`articles/latex/*.tex`):
- Two-column academic format with proper citations
- Convert figure descriptions to actual TikZ graphics
- Use `\parencite{}` for all academic references
- Regenerate PDFs via `compile-pdfs.ps1` script, not manual XeLaTeX

**Synchronization checklist**:
- Update both formats when editing content
- Verify TikZ figures render correctly in LaTeX
- Maintain citation consistency between formats
- Test PDF generation after LaTeX changes

## Development and utility scripts
Root-level PowerShell scripts for development workflow:

**dev-chapter-simple.ps1**: Quick chapter status overview
- `.\dev-chapter-simple.ps1 -List`: Shows all chapters needing development
- `.\dev-chapter-simple.ps1 -Status`: Current manuscript status summary
- Color-coded priority levels (Red=urgent, Yellow=high priority)
- Displays current line counts and development targets

**dev-chapter.ps1**: Detailed chapter development workflow
- `.\dev-chapter.ps1 <number>`: Focus on specific chapter development
- Tracks word counts, completion status, and development milestones
- Integrates with manuscript compilation process

**Python environment** (`.venv/`):
- Activate with `.venv\Scripts\Activate.ps1` before using Python tools
- Currently minimal setup; `openai_setup.py` exists but empty
- Tools directory contains utilities (currently just OpenAI setup placeholder)

## Integration boundaries
- **Public site is privacy-safe**: do not copy manuscript prose into `docs/` or `promotional-materials/`.
- **Articles adapt book themes** but live in their own pipeline; keep markdown and LaTeX in sync when editing.
- **AI research supplements human research**: `ai-research/` supports but doesn't replace the three-tier human methodology in `tier1-raw/` → `tier2-clusters/` → `tier3-chapters/`.
- **Development scripts**: Use existing PowerShell scripts for chapter development and building rather than manual commands.

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
