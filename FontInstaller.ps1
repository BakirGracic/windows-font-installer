param(
    [string]$sourceFolder = "C:\path\to\your\folder",
    [string]$fontRegistryPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts"
)

function Install-Font {
    param(
        [string]$fontFile
    )

    $fontName = [System.IO.Path]::GetFileNameWithoutExtension($fontFile)
    $fontDestination = "C:\Windows\Fonts\" + [System.IO.Path]::GetFileName($fontFile)

    # Copy font to Windows Fonts directory
    if (-not (Test-Path $fontDestination)) {
        Copy-Item $fontFile -Destination $fontDestination
        Write-Host "Installed font: $fontName"
    } else {
        Write-Host "Font already installed: $fontName"
    }

    # Add registry entry for the font
    $fontNameWithExt = [System.IO.Path]::GetFileName($fontFile)
    if (-not (Test-Path "$fontRegistryPath\$fontNameWithExt")) {
        New-ItemProperty -Path $fontRegistryPath -Name "$fontName (TrueType)" -Value $fontNameWithExt -PropertyType String -Force | Out-Null
        Write-Host "Added registry entry for font: $fontName"
    } else {
        Write-Host "Registry entry already exists for font: $fontName"
    }
}

# Get all .otf and .ttf font files in the source folder and its subfolders
$fontFiles = Get-ChildItem -Path $sourceFolder -Include *.otf, *.ttf -Recurse

foreach ($fontFile in $fontFiles) {
    Install-Font -fontFile $fontFile.FullName
}

Write-Host "Font installation complete."
