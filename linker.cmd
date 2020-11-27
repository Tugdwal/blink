@rem Entry point
@if "%~1" == "" (
    call :Init
) else (
    call %*
)
@exit /B

rem Usage: Init
:Init

@set LnkImport="%~f0" :Import
@set LnkStdImport="%~f0" :StdImport

@exit /B 0

rem Usage: Import [module]...
:Import

@for %%A in (%*) do @(
    call "%%~A"
    if errorlevel 1 ( exit /B )
)

@exit /B 0

rem Usage: StdImport [module]...
:StdImport

@for %%A in (%*) do @(
    call "%~dp0lib\%%~A"
    if errorlevel 1 ( exit /B )
)

@exit /B 0
