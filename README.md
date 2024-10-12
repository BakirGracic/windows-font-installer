## Windows Font Installer

Automatically Install Fonts on Windows from Directory. Installs `.otf` & `.ttf` font files recursively from a given directory

### Setup Guide (Windows)

- have `git` installed

- run<br />
`git clone https://github.com/BakirGracic/windows-font-installer`

- run<br />
`.\FontInstaller.ps1`


### Possible Errors

- if you encounter errors, run:
  - `Get-ExecutionPolicy -List`
  - `Set-ExecutionPolicy Unrestricted`
- re-run the script, then run
  - `Get-ExecutionPolicy -List`
  - `Set-ExecutionPolicy Undefined`
- for explanation and more details about the error see [this](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.4)
