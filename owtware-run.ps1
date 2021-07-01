param ([ValidateSet(1909,2004,2009)]
       [Parameter(
				Mandatory=$True,
				HelpMessage="请输入Win10版本号",
				Position=1)]
       [string] $version)
Set-ExecutionPolicy -ExecutionPolicy Unrestricted

Remove-Item -Force -Recurse -ErrorAction Ignore $env:TEMP\win10_Optimize.zip
Remove-Item -Force -Recurse -ErrorAction Ignore $env:TEMP\win10_Optimize
wget https://github.com/goldencodebear/Virtual-Desktop-Optimization-Tool/archive/refs/heads/owtware-main.zip -OutFile $env:TEMP\win10_Optimize.zip
Expand-Archive -LiteralPath $env:TEMP\win10_Optimize.zip $env:TEMP\win10_Optimize

pushd $env:TEMP\win10_Optimize\Virtual-Desktop-Optimization-Tool-main
.\Win10_VirtualDesktop_Optimize.ps1 -WindowsVersion $version -AcceptEULA -Verbose
popd

Remove-Item -Force -Recurse -ErrorAction Ignore $env:TEMP\win10_Optimize.zip
Remove-Item -Force -Recurse -ErrorAction Ignore $env:TEMP\win10_Optimize
Set-ExecutionPolicy -ExecutionPolicy Restricted
