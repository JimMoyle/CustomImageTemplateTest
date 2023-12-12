Write-Output 'Starting PowerShellModulesInstall by Jim Moyle'
Write-Output 'Installing nuget'
Install-PackageProvider -Name NuGet -Force
Write-Output 'Trusting PSGallery'
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
Write-Output 'Installing Az, Evergreen, CimDiskImage'
Install-Module Az, Evergreen, CimDiskImage
Write-Output 'Installing VSCode PowerShell Extension'
code --install-extension ms-vscode.powershell
Write-Output 'Finished PowerShellModulesInstall'