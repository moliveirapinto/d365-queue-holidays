# Rebuilds the unmanaged Dataverse solution zip from solution/ into the repo root.
$root = Split-Path -Parent $PSScriptRoot
$sol = "$root\solution"
$zipPath = "$root\QueueHolidaysManager_1_4_0_0.zip"
if (Test-Path $zipPath) { Remove-Item $zipPath -Force }

Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem

$fs = [System.IO.File]::Open($zipPath, [System.IO.FileMode]::CreateNew)
$archive = New-Object System.IO.Compression.ZipArchive($fs, [System.IO.Compression.ZipArchiveMode]::Create)

function Add-Entry($archive, $filePath, $entryName) {
  $entry = $archive.CreateEntry($entryName, [System.IO.Compression.CompressionLevel]::Optimal)
  $entryStream = $entry.Open()
  $bytes = [System.IO.File]::ReadAllBytes($filePath)
  $entryStream.Write($bytes, 0, $bytes.Length)
  $entryStream.Close()
}

Add-Entry $archive "$sol\[Content_Types].xml" "[Content_Types].xml"
Add-Entry $archive "$sol\solution.xml" "solution.xml"
Add-Entry $archive "$sol\customizations.xml" "customizations.xml"
Add-Entry $archive "$sol\WebResources\qhol_queue_holidays_app.html" "WebResources/qhol_queue_holidays_app.html"

$archive.Dispose()
$fs.Dispose()
Write-Output "built"
