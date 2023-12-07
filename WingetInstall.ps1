$outFile = (Join-Path $env:Temp Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle)
Invoke-WebRequest -Uri aka.ms/getwinget -OutFile $outFile
Add-AppPackage $outFile

Winget Upgrade Winget --accept-source-agreements --accept-package-agreements