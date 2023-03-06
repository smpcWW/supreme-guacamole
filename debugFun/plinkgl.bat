@echo off

rem Set the username for SSH login
set username=dp016707a

rem Prompt the user to enter the password for SSH login
set/p "password=>"


rem Set the server name
set server=blmotpdctfsvn02

rem Set the local path to download the output file to
set local_path=C:\Users\DP016707\desktop

rem Check if the file exists and delete it if it does
rem Connect to the server via SSH and run a command to check if the file /home/DP016707A/pipelineTesting/newcheckdependencies.sh exists.
rem If it does, delete it using the rm command.
plink.exe -ssh -l %username% -pw %password% %server% "if [ -f /home/DP016707A/pipelineTesting/newcheckdependencies.sh ]; then rm /home/DP016707A/pipelineTesting/newcheckdependencies.sh; fi; exit"

rem Copy the new version of the file to the server
rem Copy the local file newcheckdependencies.sh to the server in the location /home/DP016707A/pipelineTesting/
pscp.exe -pw %password% newcheckdependencies.sh %username%@%server%:/home/DP016707A/pipelineTesting/

rem Connect to the server via SSH and run the command to execute the script
rem Run the command to execute the script /home/DP016707A/pipelineTesting/newcheckdependencies.sh on the server using the bash command.
plink.exe -ssh -l %username% -pw %password% %server% "bash /home/DP016707A/pipelineTesting/newcheckdependencies.sh; exit"

rem Download the file from the server
rem Download the file latestDependencies.txt from the server to the local path using psftp.exe
psftp.exe -l %username% -pw %password% %server% -b download.txt

rem Move the downloaded file to the local path
rem Move the downloaded file latestDependencies.txt to the local path specified by the variable local_path.
move /Y latestDependencies.txt %local_path%

echo Done!
