@echo off
setlocal enabledelayedexpansion

set filename=config.txt
set linenumber=3

set "var="
for /f "skip=%linenumber% tokens=*" %%a in ('type "%filename%"') do (
  set "var=%%a"
  goto :done
)

:done
echo The line is: %var%
