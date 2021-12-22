rem ---------- ---------- ---------- Entry point ---------- ---------- ----------

if "%*" == "" (
    call :Init
) else (
    call %*
)

exit /B

rem ---------- ---------- ---------- Init ---------- ---------- ----------

rem Usage: Init
:Init

set LnkLoad=call "%~f0" :Load

exit /B 0

rem ---------- ---------- ---------- Public ---------- ---------- ----------

rem Usage: Load [library]...
:Load

for %%A in (%*) do (
    call "%~dp0lib\%%~A.bat" :Init
    if ERRORLEVEL 1 ( exit /B )
)

exit /B 0
