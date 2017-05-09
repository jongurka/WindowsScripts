@echo off

net stop wuauserv
net stop trustedinstaller
rename c:\windows\SoftwareDistribution SoftwareDistribution.old
del /q /s c:\windows\temp\*
del /q /s c:\windows\logs\cbs\*
net start wuauserv
net start trustedinstaller
if exist "c:\windows\softwaredistribution" rmdir /q /s c:\windows\SoftwareDistribution.old
wuauclt.exe /detectnow
TIMEOUT 10