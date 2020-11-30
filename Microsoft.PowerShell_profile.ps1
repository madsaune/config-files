Import-Module -Name posh-sshell
Import-Module -Name posh-git
Import-Module -Name Get-ChildItemColor

Start-SshAgent -Quiet

function Get-GitStatusAll { git status -uall }
function Add-AllFilesToGit { git add -A }

Set-Alias -Name gsa -Value Get-GitStatusAll
Set-Alias -Name gaa -Value Add-AllFilesToGit
