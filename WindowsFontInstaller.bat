@echo off
setlocal enabledelayedexpansion

:: Define the root folder to search for font files
set "FONT_ROOT=C:\path\to\your\fonts\folder"

:: Record start time (for measuring execution speed)
set startTime=%time%

:: Change the directory to the root folder
cd /d "%FONT_ROOT%"

:: Initialize a PowerShell command to check if a font is installed
set "CHECK_FONT_PS=Add-Type -AssemblyName System.Drawing; $font = New-Object System.Drawing.Text.PrivateFontCollection; $font.AddFontFile"

:: Loop through all .ttf and .otf files in the FONT_ROOT directory and its subdirectories
for /r %%f in (*.ttf, *.otf) do (
    set "fontFile=%%f"
    set "fontName=%%~nf"
    
    :: Check if the font is already installed by attempting to load it; if it fails, the font is not installed
    for /f "delims=" %%i in ('powershell -command "!CHECK_FONT_PS!('!fontFile!'); $font.Families.Name"') do set "installedFontName=%%i"
    if "!installedFontName!"=="" (
        echo Installing font: !fontName!
        powershell -command "Add-Type -AssemblyName PresentationCore; [System.Windows.Media.Fonts]::GetTypefaces('!fontFile!')"
        if !ERRORLEVEL! equ 0 (
            echo !fontName! - Installed successfully.
        ) else (
            echo !fontName! - Failed to install.
        )
    ) else (
        echo !fontName! - Already installed.
    )
)

:: Record end time
set endTime=%time%

:: Calculate and display execution time
set /A execHours=(1%endTime:~0,2%-100)-(1%startTime:~0,2%-100)
set /A execMins=(1%endTime:~3,2%-100)-(1%startTime:~3,2%-100)
set /A execSecs=(1%endTime:~6,2%-100)-(1%startTime:~6,2%-100)
if %execSecs% lss 0 (
    set /A execSecs+=60, execMins-=1
)
if %execMins% lss 0 (
    set /A execMins+=60, execHours-=1
)
echo Execution Time: %execHours% hours, %execMins% minutes, %execSecs% seconds

echo All fonts installed.
pause
