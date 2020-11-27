@rem Entry point
@if "%~1" == "" (
    call :Init
) else (
    call %*
)
@exit /B

rem Usage: Init
:Init

@set LogError="%~f0" :Error
@set LogInfo="%~f0" :Info

@exit /B 0

rem Usage: Error <message>
:Error
@call :Message "Error" %1
@exit /B

rem Usage: Info <message>
:Info
@call :Message "Info" %1
@exit /B

rem Usage: Message <level> <message>
:Message
@echo:[%DATE%][%TIME%][%~1] %~2 1>&2
@exit /B
