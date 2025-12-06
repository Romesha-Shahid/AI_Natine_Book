# Generate-References.ps1
# This script generates docs/references.md from .specify/memory/context-research.yml

[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$repoRoot = (Get-Item $scriptDir).Parent.Parent.Parent.FullName # Corrected: one more .Parent
$researchContextPath = Join-Path $repoRoot ".specify\memory\context-research.yml"
$referencesOutputPath = Join-Path $repoRoot "docs\references.md"

if (-not (Test-Path $researchContextPath)) {
    Write-Error "Error: context-research.yml not found at $researchContextPath"
    exit 1
}

$markdownContent = @"
---
id: references
title: References
---

# References

This section lists all academic and technical sources cited throughout the book, formatted according to APA 7th edition guidelines.

"@

try {
    $rawYamlContent = Get-Content $researchContextPath -Raw

    $references = @()
    # Regex to capture "key: value" pairs for id, type, and apa_citation
    $rawYamlContent | Select-String '^\s*-\s*\[(.*?)\]$' | ForEach-Object {
        $id = $_.Matches[0].Groups[1].Value
        $typeLine = ($rawYamlContent | Select-String "(?i)^\s*type:\s*(.*)$" -Context 0, 1 | Select-Object -ExpandProperty Line) -replace '^\s*type:\s*', ''
        $apaLine = ($rawYamlContent | Select-String "(?i)^\s*apa_citation:\s*(.*)$" -Context 0, 1 | Select-Object -ExpandProperty Line) -replace '^\s*apa_citation:\s*', ''

        if ($id -and $apaLine) {
            $references += [PSCustomObject]@{
                id = $id
                type = $typeLine
                apa_citation = $apaLine
            }
        }
    }

    # The previous regex logic was flawed. Let's simplify parsing for the expected YAML format:
    # - [id]
    #   type: "..."
    #   apa_citation: "..."

    # Read content again, more robustly
    $currentRef = $null
    $lines = $rawYamlContent -split "`n"
    foreach ($line in $lines) {
        if ($line -match '^\s*-\s*\[(.*?)\]$') { # New reference item
            if ($currentRef) {
                $references += $currentRef
            }
            $currentRef = [PSCustomObject]@{
                id = $matches[1]
                type = $null
                apa_citation = $null
            }
        } elseif ($line -match '^\s*type:\s*(.*)$') {
            if ($currentRef) { $currentRef.type = $matches[1].Trim('"') }
        } elseif ($line -match '^\s*apa_citation:\s*(.*)$') {
            if ($currentRef) { $currentRef.apa_citation = $matches[1].Trim('"') }
        }
    }
    if ($currentRef) { # Add the last reference
        $references += $currentRef
    }


    # Filter out entries that don't have a valid APA citation
    $validReferences = $references | Where-Object { -not [string]::IsNullOrEmpty($_.apa_citation) -and $_.apa_citation -ne '"APA_CITATION"' }

    # Sort references alphabetically by the first author's last name (or by citation if parsing fails)
    $sortedReferences = $validReferences | Sort-Object {
        # Attempt to extract author name for sorting
        if ($_.apa_citation -match '^[A-Za-z\s\.,-]+,\s*[A-Z\.]+\s*(\(\d{4}\))\.') { # E.g., "Author, A. A. (Year)."
            $author = ($_.apa_citation -split ',')[0].Trim()
            $author
        } else {
            $_.apa_citation # Fallback to full citation if author parsing fails
        }
    }

    foreach ($ref in $sortedReferences) {
        $markdownContent += "`n- $($ref.apa_citation)`n"
    }

    $markdownContent | Set-Content $referencesOutputPath -Encoding UTF8
    Write-Host "Successfully generated references at $referencesOutputPath"
}
catch {
    Write-Error "Error during references generation: $($_.Exception.Message)"
    exit 1
}