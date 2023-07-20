@echo off
set username=dp016707a
set/p "password=>"
set server=blmotpdctfsvn02
set local_path=C:\Users\DP016707\desktop


rem Check if the file exists and delete it if it does
plink.exe -ssh -l %username% -pw %password% %server% "if [ -f /home/DP016707A/pipelineTesting/newcheckdependencies.sh ]; then rm /home/DP016707A/pipelineTesting/newcheckdependencies.sh && exit 0; else exit 1; fi;"

if errorlevel 1 (
    echo The file does not exist on the server. Copying the file...
    scp ./newcheckdependencies.sh %username%@%server%:/home/DP016707A/pipelineTesting/
) else (
    echo The file has been deleted from the server. Copying the file...
    scp ./newcheckdependencies.sh %username%@%server%:/home/DP016707A/pipelineTesting/
)

rem Connect to the server via SSH and run the command to execute the script
plink.exe -ssh -l %username% -pw %password% %server% "bash /home/DP016707A/pipelineTesting/newcheckdependencies.sh; exit"

rem Download the file from the server
psftp.exe -l %username% -pw %password% %server% -b download.txt

rem Move the downloaded file to the local path
move /Y latestDependencies.txt %local_path%

echo Done!
