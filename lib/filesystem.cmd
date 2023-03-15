@rem Entry point
@if "%~1" == "" (
    call :Init
) else (
    call %*
)
@exit /B

rem Usage: Init
:Init

@call "%~dp0bool"
@if errorlevel 1 ( exit /B )

@call "%~dp0log"
@if errorlevel 1 ( exit /B )

@set FsExists="%~f0" :Exists
@set FsIsDirectory="%~f0" :IsDirectory
@set FsIsFile="%~f0" :IsFile

@set FsAccess="%~f0" :Access
@set FsAccessDirectory="%~f0" :AccessDirectory
@set FsAccessFile="%~f0" :AccessFile

@exit /B 0

rem Usage: Exists <path>
:Exists

@if exist "%~1" (
    exit /B %true%
)

@exit /B %false%

rem Usage: IsDirectory <path>
:IsDirectory
@setlocal

@set attributes=%~a1
@if "%attributes:~0,1%" == "d" (
    exit /B %true%
)

@exit /B %false%

rem Usage: IsFile <path>
:IsFile
@setlocal

@set attributes=%~a1
@if "%attributes:~0,1%" == "-" (
    exit /B %true%
)

@exit /B %false%

rem Usage: Access <path>
:Access

@if not exist "%~1" (
    call %LogError% "File or directory not found: '%~f1'"
    exit /B %false%
)

@exit /B %true%

rem Usage: AccessDirectory <path>
:AccessDirectory

@if not exist "%~1" (
    call %LogError% "Directory not found: '%~f1'"
    exit /B %false%
)

@call :IsDirectory %1
@if %IsFalse% (
    call %LogError% "Path does not point to a directory: '%~f1'"
    exit /B %false%
)

@exit /B %true%

rem Usage: AccessFile <path>
:AccessFile

@if not exist "%~1" (
    call %LogError% "File not found: '%~f1'"
    exit /B %false%
)

@call :IsFile %1
@if %IsFalse% (
    call %LogError% "Path does not point to a file: '%~f1'"
    exit /B %false%
)

@exit /B %true%
