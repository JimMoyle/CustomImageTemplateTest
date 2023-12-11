Write-OutPut 'Starting WingetInstall.ps1 Jim'
$outFile = (Join-Path $env:Temp Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle)
Write-Output "Downloadlocation is $outFile"
$out = Invoke-WebRequest -Uri aka.ms/getwinget -OutFile $outFile -PassThru
Write-Output "Downloaded stuscode $out.StatusCode"
Add-AppPackage -Path $outFile
Write-Output 'Testing for Winget'
try {
    Get-AppxPackage -Name Microsoft.DesktopAppInstaller -ErrorAction Stop
    Write-Output 'Winget Present'
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


#Winget Upgrade Winget --accept-source-agreements --accept-package-agreements