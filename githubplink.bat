@echo off

rem Enable delayed expansion to allow for dynamic variable expansion at runtime
setlocal enabledelayedexpansion

set filename=config.txt

set "TOKEN="
set "ORG_NAME="
set "REPO_NAME="
set "local_path="

rem Read the values of TOKEN, ORG_NAME, REPO_NAME, and local_path from config.txt
for /f "tokens=1,* delims=:" %%a in ('findstr /n "^" "%filename%"') do (
  if %%a equ 1 set "TOKEN=%%b"
  if %%a equ 2 set "ORG_NAME=%%b"
  if %%a equ 3 set "REPO_NAME=%%b"
  if %%a equ 4 set "local_path=%%b"
)

rem Delete the output file if it exists
if exist githubVersions.txt del githubVersions.txt

REM Read the list of package names from packageList.txt
set /p PACKAGES=<packageList.txt

rem For each package name in the list, retrieve the version numbers from GitHub and append them to the output file
for %%i in (%PACKAGES%) do (
    echo.>>githubVersions.txt
    echo %%i>>githubVersions.txt
    curl -H "Accept: application/vnd.github+json" ^
         -H "Authorization: Bearer %TOKEN%" ^
         -H "X-GitHub-Api-Version: 2022-11-28" ^
         "https://api.github.com/orgs/%ORG_NAME%/packages/maven/com.motion.%%i/versions" | ".\jq-win64.exe" -r ".[] | .name" >> githubVersions.txt
)

rem Move the downloaded file to the local path
move /Y githubVersions.txt %local_path%

endlocal
