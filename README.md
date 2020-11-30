# dotfiles

My collection of configuration files.

## Symlinking Powershell Profile

```powershell
New-Item -ItemType SymbolicLink -Path "./Microsoft.Powershell_profile.ps1" -Target "$env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
```

## Installing VSCode Extensions

```powershell
# Long
Get-Content -Path "./vscode/extensions.txt" | ForEach-Object { code --install-extension $_ -force }

# Short
gc "./vscode/extensions.txt" | % {code --install-extension $_ -force}
```
