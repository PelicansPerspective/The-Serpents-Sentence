# Script to compile LaTeX manuscript
# Usage: .\compile-manuscript.ps1

Write-Host "Compiling manuscript..." -ForegroundColor Green

# First run of pdflatex
pdflatex main_fixed.tex

# Run biber to process bibliography
biber main_fixed

# Second run of pdflatex to integrate bibliography
pdflatex main_fixed.tex

# Final run to resolve all references
pdflatex main_fixed.tex

Write-Host "Compilation complete. Output saved as main_fixed.pdf" -ForegroundColor Green
