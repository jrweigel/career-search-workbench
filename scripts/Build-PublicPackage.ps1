[CmdletBinding()]
param(
    [string]$PackagePath = (Join-Path $PSScriptRoot '..'),
    [string]$OutputPath = (Join-Path $PSScriptRoot '..\dist'),
    [string]$ArchiveName = 'career-search-workbench.zip'
)

$ErrorActionPreference = 'Stop'
$packageRoot = (Resolve-Path $PackagePath).Path
$outputRoot = [System.IO.Path]::GetFullPath($OutputPath)
$archivePath = Join-Path $outputRoot $ArchiveName
$stagingRoot = Join-Path ([System.IO.Path]::GetTempPath()) "career-search-workbench-$([guid]::NewGuid())"
$validator = Join-Path $PSScriptRoot 'Test-PublicPackage.ps1'

try {
    & $validator -PackagePath $packageRoot
    if (-not $?) {
        throw 'Source package validation failed.'
    }

    New-Item $stagingRoot -ItemType Directory -Force | Out-Null
    Get-ChildItem $packageRoot -Force | Where-Object {
        $_.Name -notin @('.git', 'dist')
    } | ForEach-Object {
        Copy-Item $_.FullName $stagingRoot -Recurse -Force
    }

    & $validator -PackagePath $stagingRoot
    if (-not $?) {
        throw 'Staged package validation failed.'
    }

    New-Item $outputRoot -ItemType Directory -Force | Out-Null
    if (Test-Path $archivePath) {
        Remove-Item $archivePath -Force
    }

    Add-Type -AssemblyName System.IO.Compression.FileSystem
    [System.IO.Compression.ZipFile]::CreateFromDirectory(
        $stagingRoot,
        $archivePath,
        [System.IO.Compression.CompressionLevel]::Optimal,
        $false
    )

    $archive = Get-Item $archivePath
    Write-Host "Built $($archive.FullName) ($([math]::Round($archive.Length / 1KB, 1)) KB)."
}
finally {
    if (Test-Path $stagingRoot) {
        Remove-Item $stagingRoot -Recurse -Force
    }
}