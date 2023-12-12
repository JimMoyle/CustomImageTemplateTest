Write-Output 'Starting WingetInstall.ps1 Jim New'
$repoOwner = "Microsoft"
$repoName = "winget-cli"
# Get the latest release information
$releaseUrl = "https://api.github.com/repos/$repoOwner/$repoName/releases/latest"
Write-Output "Release URL is $releaseUrl"
$releaseInfo = Invoke-RestMethod -Uri $releaseUrl

# Get the download URL for the latest release asset
$downloadUrl = $releaseInfo.assets | Where-Object { $_.browser_download_url.Split('/')[-1] -eq "Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle" } | Select-Object -ExpandProperty browser_download_url
Write-Output "Download URL is $downloadUrl"
$outFile = (Join-Path $env:Temp Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle)
Write-Output "Downloadlocation is $outFile"
$out = Invoke-WebRequest -Uri $downloadUrl -OutFile $outFile
try {
    Write-Output 'Trying to install downloaded winget'
    Add-AppPackage -Path $outFile -ErrorAction Stop
}
catch {
    try {
        Write-Output 'Trying to register installed winget'
        Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe -ErrorAction Stop
    }
    catch {
        Write-Output 'Could not install winget'
    }
}

Write-Output 'Testing for Winget Package'
try {
    Get-AppxPackage -Name Microsoft.DesktopAppInstaller -ErrorAction Stop
    Write-Output 'Winget Present'
}
catch {
    Write-Output 'Winget Missing'

}
Write-Output 'Finished WingetInstall.ps1'