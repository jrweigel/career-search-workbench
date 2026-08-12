[CmdletBinding()]
param(
    [string]$PackagePath = (Join-Path $PSScriptRoot '..'),
    [string[]]$ForbiddenPattern = @()
)

$ErrorActionPreference = 'Stop'
$packageRoot = (Resolve-Path $PackagePath).Path
$errors = [System.Collections.Generic.List[string]]::new()

$requiredPaths = @(
    'README.md'
    'SETUP.md'
    'SKILL.md'
    '.github\copilot-instructions.md'
    'docs\PACKAGE_STARTER_SET.md'
    'references\commands\help.md'
    'references\examples.md'
    'templates\coaching_state-blank.md'
    'templates\application-tracker-template.md'
    'templates\interview-note-template.md'
    'templates\rejection-note-template.md'
    'templates\win-note-template.md'
    'templates\learnings-patterns-template.md'
)

$forbiddenPaths = @(
    'coaching_state.md'
    'next-steps.md'
    'applications\tracker.md'
    'applications\prep-briefs'
    'applications\learnings\interview-notes\TEMPLATE.md'
    'applications\learnings\rejections\TEMPLATE.md'
    'applications\learnings\wins\TEMPLATE.md'
    'applications\learnings\patterns.TEMPLATE.md'
    'docs\ABOUT_ME.md'
    'docs\EXEC_POSITIONING_RESUME.md'
    'docs\PRIVATE_DOCS.md'
    'references\performance-reviews-archive.md'
)

$privacyPatterns = @(
    '(?i)[a-z]:\\users\\[^\\]+'
    '(?i)/users/[^/]+'
    '(?i)/home/[^/]+'
    '(?i)file://'
    '(?i)\b[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}\b'
) + $ForbiddenPattern

foreach ($relativePath in $requiredPaths) {
    if (-not (Test-Path (Join-Path $packageRoot $relativePath))) {
        $errors.Add("Missing required path: $relativePath")
    }
}

foreach ($relativePath in $forbiddenPaths) {
    if (Test-Path (Join-Path $packageRoot $relativePath)) {
        $errors.Add("Forbidden private path: $relativePath")
    }
}

$textFiles = Get-ChildItem $packageRoot -Recurse -File | Where-Object {
    $_.FullName -notlike "$(Join-Path $packageRoot '.git')*" -and
    $_.FullName -notlike "$(Join-Path $packageRoot 'dist')*" -and
    ($_.Extension -in @('.md', '.txt', '.yml', '.yaml', '.json', '.ps1') -or
    $_.Name -in @('.gitignore', '.gitattributes'))
}

foreach ($file in $textFiles) {
    $relativePath = $file.FullName.Substring($packageRoot.Length + 1)
    $content = Get-Content $file.FullName -Raw

    if ($relativePath -ne 'scripts\Test-PublicPackage.ps1') {
        foreach ($pattern in $privacyPatterns) {
            if ($content -match $pattern) {
                $errors.Add("Private identifier in ${relativePath}: $($Matches[0])")
            }
        }
    }

    if ($file.Extension -eq '.md') {
        $links = [regex]::Matches($content, '(?m)\[[^\]]+\]\((?!https?://|mailto:|#)([^)#]+)(?:#[^)]+)?\)')
        foreach ($link in $links) {
            $target = [Uri]::UnescapeDataString($link.Groups[1].Value)
            $resolvedTarget = Join-Path $file.DirectoryName $target
            if (-not (Test-Path $resolvedTarget)) {
                $errors.Add("Broken local link in ${relativePath}: $target")
            }
        }
    }
}

if ($errors.Count -gt 0) {
    $errors | Sort-Object -Unique | ForEach-Object { Write-Error $_ -ErrorAction Continue }
    exit 1
}

Write-Host "Public package validation passed ($($textFiles.Count) text files checked)."