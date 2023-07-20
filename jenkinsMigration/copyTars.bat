set username=dp016707a
set/p "password=>"
set server1=blmotpdctfsvn02
set server2=BLMOTPDJNKMST01
set local_path=C:\Users\DP016707\Downloads
set list=.\directories.txt
rem set list="MotionMobile-PROD-Build-Inenco.tar.gz" "MotionMobile-Motion-Websphere-development.tar.gz" "MotionMobile-Motion-PREPROD-QAT.tar.gz" "MotionMobile-Inenco-PREPROD-QAT.tar.gz" "MotionMobile-Inenco-dynamic-development.tar.gz"

rem Check if the file exists and delete it if it does
plink.exe -ssh -l %username% -pw %password% %server1% "if [ -f /home/DP016707A/jenkinsMigration/directories.txt ]; then rm /home/DP016707A/jenkinsMigration/directories.txt && exit 0; else exit 1; fi;"

rem check for file tarring files and add them
if errorlevel 1 (
    echo The file does not exist on the server. Copying the file...
    scp ./directories.txt %username%@%server1%:/home/DP016707A/jenkinsMigration/
) else (
    echo The file has been deleted from the server. Copying the file...
    scp ./directories.txt %username%@%server1%:/home/DP016707A/jenkinsMigration/
)

rem Check if the file exists and delete it if it does
plink.exe -ssh -l %username% -pw %password% %server1% "if [ -f /home/DP016707A/jenkinsMigration/tarloop.sh ]; then rm /home/DP016707A/jenkinsMigration/tarloop.sh && exit 0; else exit 1; fi;"

rem check for file tarring files and add them
if errorlevel 1 (
    echo The file does not exist on the server. Copying the file...
    scp ./tarloop.sh %username%@%server1%:/home/DP016707A/jenkinsMigration/
) else (
    echo The file has been deleted from the server. Copying the file...
    scp ./tarloop.sh %username%@%server1%:/home/DP016707A/jenkinsMigration/
)

rem Check if the file exists and delete it if it does
plink.exe -ssh -l %username% -pw %password% %server2% "if [ -f /home/DP016707A/jenkinsMigration/directories.txt ]; then rm /home/DP016707A/jenkinsMigration/directories.txt && exit 0; else exit 1; fi;"

rem check for file tarring files and add them
if errorlevel 1 (
    echo The file does not exist on the server. Copying the file...
    scp ./directories.txt %username%@%server2%:/home/DP016707A/jenkinsMigration/
) else (
    echo The file has been deleted from the server. Copying the file...
    scp ./directories.txt %username%@%server2%:/home/DP016707A/jenkinsMigration/
)

rem Check if the file exists and delete it if it does
plink.exe -ssh -l %username% -pw %password% %server2% "if [ -f /home/DP016707A/jenkinsMigration/untar.sh ]; then rm /home/DP016707A/jenkinsMigration/untar.sh && exit 0; else exit 1; fi;"

rem check for file tarring files and add them
if errorlevel 1 (
    echo The file does not exist on the server. Copying the file...
    scp ./untar.sh %username%@%server2%:/home/DP016707A/pipelineTesting/
) else (
    echo The file has been deleted from the server. Copying the file...
    scp ./untar.sh %username%@%server2%:/home/DP016707A/pipelineTesting/
)


(for %%a in (%list%) do (
rem Copy the new version of the from server
pscp.exe -pw %password% %username%@%server1%:/home/DP016707A/jenkinsMigration/%%a C://Users/DP016707/Downloads/
rem Copy the new version of the file to the server
pscp.exe -pw %password% C://Users/DP016707/Downloads/%%a %username%@%server2%:/home/DP016707A/jenkinsMigration/
))
