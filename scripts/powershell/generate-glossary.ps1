# Generate-Glossary.ps1
# This script generates docs/glossary.md from .specify/memory/context-glossary.yml

[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
# Correctly get the repository root by going up three levels from the script directory
$repoRoot = (Get-Item $scriptDir).Parent.Parent.Parent.FullName # Corrected: one more .Parent
$glossaryContextPath = Join-Path $repoRoot ".specify\memory\context-glossary.yml"
$glossaryOutputPath = Join-Path $repoRoot "docs\glossary.md"

if (-not (Test-Path $glossaryContextPath)) {
    Write-Error "Error: context-glossary.yml not found at $glossaryContextPath"
    exit 1
}

$markdownContent = @"
---
id: glossary
title: Glossary
---

# Glossary

This section provides definitions for key technical terms used throughout the book.

## Terms
"@

try {
    $rawYamlContent = Get-Content $glossaryContextPath -Raw

    $simpleTerms = @()
    # Regex to capture "term: definition" lines, handling '- ' as optional start for list items
    # And specifically targeting the format "Term: Definition"
    $rawYamlContent | Select-String '^\s*-\s*([a-zA-Z\s-]+):\s*(.*)$' | ForEach-Object {
        $termName = $_.Matches[0].Groups[1].Value.Trim()
        $definition = $_.Matches[0].Groups[2].Value.Trim()
        $simpleTerms += [PSCustomObject]@{ term = $termName; definition = $definition }
    }

    $sortedTerms = $simpleTerms | Sort-Object term

    foreach ($entry in $sortedTerms) {
        $markdownContent += "`n- **$($entry.term)**: $($entry.definition)"
    }

    $markdownContent | Set-Content $glossaryOutputPath -Encoding UTF8
    Write-Host "Successfully generated glossary at $glossaryOutputPath"
}
catch {
    Write-Error "Error during glossary generation: $($_.Exception.Message)"
    exit 1
}
