# windows-font-installer

### Automatically Install Fonts on Windows

This Windows script installs font files (.otf/.ttf) recursively from a directory

### How-to

- Clone this repo: `git clone https://github.com/BakirGracic/windows-font-installer.git`
- Customize path in the script
- Run the script `.\FontInstaller.ps1`
- If you encouter errors, refer to [this](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.4)

Error/Reference TL;DR:
- `Get-ExecutionPolicy -List`
- `Set-ExecutionPolicy Unrestricted`
- run script
- `Get-ExecutionPolicy -List`
- `Set-ExecutionPolicy Undefined`
