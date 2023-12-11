Write-Output 'Starting WingetInstall.ps1 Jim'
$repoOwner = "Microsoft"
$repoName = "winget-cli"

# Get the latest release information
$releaseUrl = "https://api.github.com/repos/$repoOwner/$repoName/releases/latest"
$releaseInfo = Invoke-RestMethod -Uri $releaseUrl

# Get the download URL for the latest release asset
$downloadUrl = $releaseInfo.assets | Where-Object { $_.browser_download_url.Split('/')[-1] -eq "Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle" } | Select-Object -ExpandProperty browser_download_url
Write-Output "Download URL is $downloadUrl"
$outFile = (Join-Path $env:Temp Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle)
Write-Output "Downloadlocation is $outFile"
$out = Invoke-WebRequest -Uri $downloadUrl -OutFile $outFile -PassThru -UseBasicParsing
Write-Output "Downloaded statuscode $out.StatusCode"
Add-AppPackage -Path $outFile
Write-Output 'Testing for Winget'
try {
    Get-AppxPackage -Name Microsoft.DesktopAppInstaller -ErrorAction Stop
    Write-Output 'Winget Present From download'
}
catch {
    Write-Output 'Trying to add local winget'
    Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe
    try {
        Get-AppxPackage -Name Microsoft.DesktopAppInstaller -ErrorAction Stop
        Write-Output 'Winget Present from local'
    }
    catch {
        Write-Output 'Could not install winget'
    }
}