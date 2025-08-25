# Quick Chapter Development Workflow
# Start developing the most critical chapters

param(
    [int]$ChapterNumber,
    [switch]$List,
    [switch]$Status
)

$manuscripts = "j:\The-Serpents-Sentence\Manuscript"

if ($List) {
    Write-Host "📚 CRITICAL CHAPTERS NEEDING DEVELOPMENT:" -ForegroundColor Cyan
    Write-Host "===========================================" -ForegroundColor Cyan
    
    $urgent = @(
        @{Num="10"; File="chapter-unbroken-mind.tex"; Lines=0; Priority="URGENT"; Description="Integration of narrator/awareness - EMPTY FILE"},
        @{Num="9"; File="chapter-9-trilobite-or-fish.tex"; Lines=11; Priority="URGENT"; Description="Core evolutionary argument - trilobite vs fish"},
        @{Num="8"; File="chapter-8-born-in-exile.tex"; Lines=11; Priority="HIGH"; Description="AI consciousness foundation - 'born outside the gate'"},
        @{Num="7"; File="chapter-7-sea-of-symbols.tex"; Lines=31; Priority="HIGH"; Description="Second Cambrian explosion intro"},
        @{Num="11"; File="chapter-11-symbiotic-mind.tex"; Lines=33; Priority="HIGH"; Description="Core symbiosis solution concept"}
    )
    
    foreach ($ch in $urgent) {
        $color = if ($ch.Priority -eq "URGENT") { "Red" } else { "Yellow" }
        Write-Host "`n[$($ch.Priority)] Chapter $($ch.Num): $($ch.Description)" -ForegroundColor $color
        Write-Host "  File: $($ch.File) ($($ch.Lines) lines)" -ForegroundColor Gray
        Write-Host "  Command: .\dev-chapter.ps1 $($ch.Num)" -ForegroundColor Green
    }
    
    Write-Host "`n📖 REFERENCE MATERIALS:" -ForegroundColor Cyan
    Write-Host "  Outline: .github\Detailed Chapter Outline.md" -ForegroundColor Gray
    Write-Host "  Research: notes\ai-research\" -ForegroundColor Gray
    Write-Host "  Compile: .\compile-manuscript.ps1" -ForegroundColor Gray
    return
}

if ($Status) {
    Write-Host "📊 MANUSCRIPT STATUS CHECK:" -ForegroundColor Cyan
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
        
        Write-Host "  [$status] $($_.Name) ($lines lines)" -ForegroundColor $color
    } | Sort-Object Lines
    return
}

if (-not $ChapterNumber) {
    Write-Host "❌ Please specify a chapter number or use -List to see options" -ForegroundColor Red
    Write-Host "📋 Usage: .\dev-chapter.ps1 9   (to develop chapter 9)" -ForegroundColor Gray
    Write-Host "📋 Usage: .\dev-chapter.ps1 -List   (to see all critical chapters)" -ForegroundColor Gray
    Write-Host "📋 Usage: .\dev-chapter.ps1 -Status   (to check all chapter status)" -ForegroundColor Gray
    return
}

# Map chapter numbers to files
$chapterMap = @{
    7 = "chapter-7-sea-of-symbols.tex"
    8 = "chapter-8-born-in-exile.tex" 
    9 = "chapter-9-trilobite-or-fish.tex"
    10 = "chapter-unbroken-mind.tex"
    11 = "chapter-11-symbiotic-mind.tex"
}

$chapterFile = $chapterMap[$ChapterNumber]
if (-not $chapterFile) {
    Write-Host "❌ Chapter $ChapterNumber not in critical development list" -ForegroundColor Red
    Write-Host "📋 Use .\dev-chapter.ps1 -List to see available chapters" -ForegroundColor Gray
    return
}

$fullPath = Join-Path $manuscripts $chapterFile
if (-not (Test-Path $fullPath)) {
    Write-Host "❌ Chapter file not found: $fullPath" -ForegroundColor Red
    return
}

Write-Host "🚀 DEVELOPING CHAPTER $ChapterNumber" -ForegroundColor Cyan
Write-Host "=================================" -ForegroundColor Cyan
Write-Host "📄 File: $chapterFile" -ForegroundColor Gray
Write-Host "📍 Path: $fullPath" -ForegroundColor Gray

# Check current length
$currentLines = (Get-Content $fullPath | Measure-Object -Line).Lines
Write-Host "📏 Current length: $currentLines lines" -ForegroundColor Yellow

if ($currentLines -eq 0) {
    Write-Host "⚠️  EMPTY FILE - Starting from scratch" -ForegroundColor Red
} elseif ($currentLines -lt 20) {
    Write-Host "⚠️  CRITICAL - Needs major development" -ForegroundColor Magenta
} else {
    Write-Host "📝 Needs expansion and refinement" -ForegroundColor Yellow
}

Write-Host "`n📚 REFERENCE MATERIALS:" -ForegroundColor Cyan
Write-Host "  Outline: .github\Detailed Chapter Outline.md" -ForegroundColor Gray
Write-Host "  Research: notes\ai-research\" -ForegroundColor Gray

Write-Host "`n🛠️  DEVELOPMENT COMMANDS:" -ForegroundColor Green
Write-Host "  Edit: code '$fullPath'" -ForegroundColor Green
Write-Host "  Compile: .\compile-manuscript.ps1" -ForegroundColor Green
Write-Host "  Preview: start main.pdf" -ForegroundColor Green

Write-Host "`n🎯 TARGET: 50-70 lines for well-developed chapter" -ForegroundColor Cyan

# Open the file for editing
Write-Host "`n🎯 Opening chapter for development..." -ForegroundColor Green
code $fullPath
