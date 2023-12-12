Write-OutPut 'Starting Winget Apps Install by Jim Moyle'
Write-Output 'Installing VSCode'
winget install --id Microsoft.VisualStudioCode --accept-source-agreements --accept-package-agreements --scope machine
Write-Output 'Installing PowerShell'
winget install --id Microsoft.PowerShell --scope machine
Write-Output 'Installing Git'
winget install --id Git.Git --scope machine
Write-Output 'Finished AppsInstall'