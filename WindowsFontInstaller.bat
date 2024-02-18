@echo off
setlocal enabledelayedexpansion

:: Define the root folder to search for font files
set "FONT_ROOT=C:\path\to\your\fonts\folder"

:: Change the directory to the root folder
cd /d "%FONT_ROOT%"

:: Loop through all .ttf and .otf files in the FONT_ROOT directory and its subdirectories
for /r %%f in (*.ttf, *.otf) do (
    echo Installing font: %%f
    powershell -command "Add-Type -AssemblyName PresentationCore; [System.Windows.Media.Fonts]::GetTypefaces('%%f')"
)

echo All fonts installed.
pause
