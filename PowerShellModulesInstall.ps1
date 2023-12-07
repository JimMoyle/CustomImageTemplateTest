code --install-extension ms-vscode.powershell
Install-PackageProvider -Name NuGet -Force
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
Install-Module Az, Evergreen, CimDiskImage