# Script to compile LaTeX manuscript
# Usage: .\compile-manuscript.ps1

Write-Host "Compiling manuscript..." -ForegroundColor Green

# First run of pdflatex
pdflatex main.tex

# Run biber to process bibliography
biber main

# Second run of pdflatex to integrate bibliography
pdflatex main.tex

# Final run to resolve all references
pdflatex main.tex

Write-Host "Compilation complete. Output saved as main.pdf" -ForegroundColor Green
