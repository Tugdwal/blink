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

set LnkDeprecated=call "%~f0" :Deprecated

set LnkLoad=call "%~f0" :Load
set LnkLoadLibrary=call "%~f0" :LoadLibrary
set LnkLoadSystemLibrary=call "%~f0" :LoadSystemLibrary

exit /B 0

rem ---------- ---------- ---------- Public ---------- ---------- ----------

rem Usage: Deprecated <function> [alternative]
:Deprecated

echo [Warning] Use of deprecated function '%~1'

exit /B 0

rem Usage: Load [library]...
rem Deprecated: Use 'LoadSystemLibrary' instead
:Load

call :Deprecated "LnkLoad"
call :LoadSystemLibrary %*

exit /B

rem Usage: LoadLibrary [library]...
:LoadLibrary

for %%A in (%*) do (
    call "%CD%\%%~A.bat" :Init
    if ERRORLEVEL 1 ( exit /B )
)

exit /B 0

rem Usage: LoadSystemLibrary [library]...
:LoadSystemLibrary

for %%A in (%*) do (
    call "%~dp0lib\%%~A.bat" :Init
    if ERRORLEVEL 1 ( exit /B )
)

exit /B 0
