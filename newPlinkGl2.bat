@echo off
rem Enable delayed expansion to allow for dynamic variable expansion at runtime
setlocal enabledelayedexpansion

set filename=config.txt
set "username="
set/p "password=>"
set server=blmotpdctfsvn02
set local_path=C:\Users\DP016707\desktop
rem Read the values of TOKEN, ORG_NAME, REPO_NAME, and local_path from config.txt
for /f "tokens=1,* delims=:" %%a in ('findstr /n "^" "%filename%"') do (
  if %%a equ 5 set "username=%%b"
)
echo username is %username%
rem Check if the file exists and delete it if it does
plink.exe -ssh -l %username% -pw %password% %server% "if [ -f /home/DP016707A/pipelineTesting/newcheckdependencies.sh ]; then rm /home/DP016707A/pipelineTesting/newcheckdependencies.sh; fi; exit"

rem Copy the new version of the file to the server
pscp.exe -pw %password% newcheckdependencies.sh %username%@%server%:/home/DP016707A/pipelineTesting/

rem Connect to the server via SSH and run the command to execute the script
plink.exe -ssh -l %username% -pw %password% %server% "bash /home/DP016707A/pipelineTesting/newcheckdependencies.sh; exit"

rem Download the file from the server
psftp.exe -l %username% -pw %password% %server% -b download.txt

rem Move the downloaded file to the local path
move /Y latestDependencies.txt %local_path%

echo Done!
