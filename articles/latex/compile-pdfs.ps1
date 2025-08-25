# Compile LaTeX articles to PDF using XeLaTeX
# Outputs PDFs to ../pdfs/ directory
# Note: Security warnings from MiKTeX elevated privileges are normal and can be ignored

Write-Host "Creating pdfs directory..." -ForegroundColor Green
New-Item -ItemType Directory -Path "../pdfs" -Force | Out-Null

Write-Host "Compiling articles with XeLaTeX..." -ForegroundColor Green
Write-Host "Note: MiKTeX security warnings about elevated privileges are normal" -ForegroundColor Yellow
$texFiles = Get-ChildItem "*.tex"
$successCount = 0

foreach ($file in $texFiles) {
    $baseName = $file.BaseName
    Write-Host "Compiling $($file.Name)..." -ForegroundColor Cyan
    
    # Run XeLaTeX twice for proper cross-references
    $null = xelatex -interaction=nonstopmode $file.Name
    $null = xelatex -interaction=nonstopmode $file.Name
    
    # Move PDF to pdfs directory if compilation succeeded
    if (Test-Path "$baseName.pdf") {
        Move-Item "$baseName.pdf" "../pdfs/" -Force
        Write-Host "Success: $baseName.pdf" -ForegroundColor Green
        $successCount++
    } else {
        Write-Host "Failed: $($file.Name)" -ForegroundColor Red
    }
    
    # Clean up auxiliary files
    Get-ChildItem "$baseName.*" | Where-Object { $_.Extension -match '\.(aux|log|fls|fdb_latexmk|out|toc)$' } | Remove-Item -Force -ErrorAction SilentlyContinue
}

Write-Host ""
Write-Host "Compiled $successCount/$($texFiles.Count) articles successfully!" -ForegroundColor Green
Write-Host "PDFs saved to: articles/pdfs/" -ForegroundColor Cyan
