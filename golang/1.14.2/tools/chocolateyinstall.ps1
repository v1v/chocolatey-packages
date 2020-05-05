
$root = Join-Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)" "install"
$packageArgs = @{
	packageName   = $env:ChocolateyPackageName
	unzipLocation = $root
	fileType      = 'msi'
	url           = 'https://dl.google.com/go/go1.14.2.windows-386.msi'
	url64bit      = 'https://dl.google.com/go/go1.14.2.windows-amd64.msi'
	checksum      = '1bf11f48587c40bb096dbaa2d8a2c87adf1b7fa11ead6be524c9be516ef9145c'
	checksumType  = 'sha256'
	checksum64    = 'c07bbbe4c3bebab301cb77a390c405e6099ee58b9d3ab8206904fc6168fa33bb'
	checksumType64= 'sha256'

	silentArgs    = '/qn /norestart'
	validExitCodes= @(0, 3010, 1641)

}

New-Item -ItemType Directory -Force -Path $root | Out-Null
Install-ChocolateyPackage @packageArgs
