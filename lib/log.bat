rem ---------- ---------- ---------- Entry point ---------- ---------- ----------

call %*
exit /B

rem ---------- ---------- ---------- Init ---------- ---------- ----------

rem Usage: Init
:Init

set LogInfo=call "%~f0" :Info
set LogError=call "%~f0" :Error

exit /B 0

rem ---------- ---------- ---------- Public ---------- ---------- ----------

rem Usage: Error <message>
:Error
call :Message "Error" "%~1"
exit /B 0

rem Usage: Info <message>
:Info
call :Message "Info" "%~1"
exit /B 0

rem ---------- ---------- ---------- Private ---------- ---------- ----------

rem Usage: Message <level> <message>
:Message
echo:[%DATE%][%TIME%][%~1] %~2
exit /B 0
