rem ---------- ---------- ---------- Entry point ---------- ---------- ----------

call %*
exit /B

rem ---------- ---------- ---------- Init ---------- ---------- ----------

rem Usage: Init
:Init

set FmtPrint=call "%~f0" :Print

exit /B 0

rem ---------- ---------- ---------- Public ---------- ---------- ----------

rem Usage: Print <message>
:Print
echo:%~1
exit /B 0
