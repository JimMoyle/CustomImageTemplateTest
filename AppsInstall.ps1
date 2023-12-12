Write-OutPut 'Starting Winget Apps Install by Jim Moyle'

Write-Output 'Check for winget'
$version = winget --version

if ($version.count -ne 1){
    Write-Output 'Error: Winget not present trying to register'
    try {
        Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe -ErrorAction Stop
        Write-Output 'Winget Registered'
    }
    catch {
        'Cound not register Winget'
        return
    }
}

Write-Output 'Installing VSCode'
winget install --id Microsoft.VisualStudioCode --accept-source-agreements --accept-package-agreements --scope machine --source winget
Write-Output 'Installing PowerShell'
winget install --id Microsoft.PowerShell --scope machine --source winget
Write-Output 'Installing Git'
winget install --id Git.Git --scope machine --source winget
Write-Output 'Finished AppsInstall'