# Quick Chapter Development Workflow

param(
    [int]$ChapterNumber,
    [switch]$List,
    [switch]$Status
)

if ($List) {
    Write-Host "CRITICAL CHAPTERS NEEDING DEVELOPMENT:" -ForegroundColor Cyan
    Write-Host "=======================================" -ForegroundColor Cyan
    
    Write-Host "`n[URGENT] Chapter 10: Integration of narrator/awareness - EMPTY FILE" -ForegroundColor Red
    Write-Host "  File: chapter-unbroken-mind.tex (0 lines)" -ForegroundColor Gray
    Write-Host "  Command: .\dev-chapter.ps1 10" -ForegroundColor Green
    
    Write-Host "`n[URGENT] Chapter 9: Core evolutionary argument - trilobite vs fish" -ForegroundColor Red
    Write-Host "  File: chapter-9-trilobite-or-fish.tex (11 lines)" -ForegroundColor Gray
    Write-Host "  Command: .\dev-chapter.ps1 9" -ForegroundColor Green
    
    Write-Host "`n[HIGH] Chapter 8: AI consciousness foundation - born outside the gate" -ForegroundColor Yellow
    Write-Host "  File: chapter-8-born-in-exile.tex (11 lines)" -ForegroundColor Gray
    Write-Host "  Command: .\dev-chapter.ps1 8" -ForegroundColor Green
    
    Write-Host "`n[HIGH] Chapter 7: Second Cambrian explosion intro" -ForegroundColor Yellow
    Write-Host "  File: chapter-7-sea-of-symbols.tex (31 lines)" -ForegroundColor Gray
    Write-Host "  Command: .\dev-chapter.ps1 7" -ForegroundColor Green
    
    Write-Host "`n[HIGH] Chapter 11: Core symbiosis solution concept" -ForegroundColor Yellow
    Write-Host "  File: chapter-11-symbiotic-mind.tex (33 lines)" -ForegroundColor Gray
    Write-Host "  Command: .\dev-chapter.ps1 11" -ForegroundColor Green
    
    Write-Host "`nREFERENCE MATERIALS:" -ForegroundColor Cyan
    Write-Host "  Outline: .github\Detailed Chapter Outline.md" -ForegroundColor Gray
    Write-Host "  Research: notes\ai-research\" -ForegroundColor Gray
    Write-Host "  Compile: .\compile-manuscript.ps1" -ForegroundColor Gray
    return
}

if ($Status) {
    Write-Host "MANUSCRIPT STATUS CHECK:" -ForegroundColor Cyan
    Write-Host "========================" -ForegroundColor Cyan
    
    $manuscripts = "j:\The-Serpents-Sentence\Manuscript"
    Get-ChildItem "$manuscripts\chapter-*.tex" | ForEach-Object { 
        $lines = (Get-Content $_.FullName | Measure-Object -Line).Lines
        $status = if ($lines -eq 0) { "EMPTY" } 
                 elseif ($lines -lt 20) { "CRITICAL" }
                 elseif ($lines -lt 40) { "UNDERDEVELOPED" }
                 elseif ($lines -lt 60) { "ADEQUATE" }
                 else { "WELL-DEVELOPED" }
        
        $color = switch ($status) {
            "EMPTY" { "Red" }
            "CRITICAL" { "Magenta" }
            "UNDERDEVELOPED" { "Yellow" }
            "ADEQUATE" { "Green" }
            "WELL-DEVELOPED" { "Cyan" }
        }
        
        Write-Host "  [$status] $($_.Name) - $lines lines" -ForegroundColor $color
    }
    return
}

if (-not $ChapterNumber) {
    Write-Host "Please specify a chapter number or use -List to see options" -ForegroundColor Red
    Write-Host "Usage: .\dev-chapter.ps1 9   (to develop chapter 9)" -ForegroundColor Gray
    Write-Host "Usage: .\dev-chapter.ps1 -List   (to see all critical chapters)" -ForegroundColor Gray
    Write-Host "Usage: .\dev-chapter.ps1 -Status   (to check all chapter status)" -ForegroundColor Gray
    return
}

# Map chapter numbers to files
$chapterFiles = @{
    7 = "chapter-7-sea-of-symbols.tex"
    8 = "chapter-8-born-in-exile.tex" 
    9 = "chapter-9-trilobite-or-fish.tex"
    10 = "chapter-unbroken-mind.tex"
    11 = "chapter-11-symbiotic-mind.tex"
}

$chapterFile = $chapterFiles[$ChapterNumber]
if (-not $chapterFile) {
    Write-Host "Chapter $ChapterNumber not in critical development list" -ForegroundColor Red
    Write-Host "Use .\dev-chapter.ps1 -List to see available chapters" -ForegroundColor Gray
    return
}

$manuscripts = "j:\The-Serpents-Sentence\Manuscript"
$fullPath = Join-Path $manuscripts $chapterFile

Write-Host "DEVELOPING CHAPTER $ChapterNumber" -ForegroundColor Cyan
Write-Host "File: $chapterFile" -ForegroundColor Gray
Write-Host "Path: $fullPath" -ForegroundColor Gray

# Check current length
$currentLines = (Get-Content $fullPath | Measure-Object -Line).Lines
Write-Host "Current length: $currentLines lines" -ForegroundColor Yellow

Write-Host "`nDEVELOPMENT COMMANDS:" -ForegroundColor Green
Write-Host "  Edit: code '$fullPath'" -ForegroundColor Green
Write-Host "  Compile: .\compile-manuscript.ps1" -ForegroundColor Green

Write-Host "`nTARGET: 50-70 lines for well-developed chapter" -ForegroundColor Cyan
