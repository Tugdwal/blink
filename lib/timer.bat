rem Entry point
call %*
exit /B

rem Usage: Init
:Init

set TimerStart=call "%~f0" :Start
set TimerEnd=call "%~f0" :End
set TimerDuration=call "%~f0" :Duration

set TimerSplit=call "%~f0" :Split

set TimerPlus=call "%~f0" :Plus
set TimerMinus=call "%~f0" :Minus

set TimerEqual=call "%~f0" :Equal
set TimerLess=call "%~f0" :Less
set TimerGreater=call "%~f0" :Greater

exit /B 0

rem Usage: Start <TIMER>
:Start
set %~1_START_TIME=%TIME%
exit /B 0

rem Usage: End <TIMER>
:End
set %~1_END_TIME=%TIME%
exit /B 0

rem Usage: Duration <RESULT> <TIMER>
:Duration
call :Minus "%~1" "%%%~2_END_TIME%%" "%%%~2_START_TIME%%"
exit /B 0

rem Usage: Split <RESULT_HOURS> <RESULT_MINUTES> <RESULT_SECONDS> <RESULT_MILLIS> <timer>
:Split

for /f "tokens=1-4 delims=:.," %%A in ("%~5") do (
    set /A %~1=100%%A %% 100
    set /A %~2=100%%B %% 100
    set /A %~3=100%%C %% 100
    set /A %~4=100%%D %% 100
)

exit /B 0

rem Usage: Minus <RESULT> <lhs> <rhs>
rem RESULT = lhs - rhs
:Minus

call :Split LHS_HOURS LHS_MINUTES LHS_SECONDS LHS_MILLIS "%~2"
call :Split RHS_HOURS RHS_MINUTES RHS_SECONDS RHS_MILLIS "%~3"

set /A RESULT_HOURS=%LHS_HOURS% - %RHS_HOURS%
set /A RESULT_MINUTES=%LHS_MINUTES% - %RHS_MINUTES%
set /A RESULT_SECONDS=%LHS_SECONDS% - %RHS_SECONDS%
set /A RESULT_MILLIS=%LHS_MILLIS% - %RHS_MILLIS%

if %RESULT_MILLIS% lss 0 (
    set /A RESULT_MILLIS=%RESULT_MILLIS% + 100
    set /A RESULT_SECONDS=%RESULT_SECONDS% - 1
)

if %RESULT_SECONDS% lss 0 (
    set /A RESULT_SECONDS=%RESULT_SECONDS% + 60
    set /A RESULT_MINUTES=%RESULT_MINUTES% - 1
)

if %RESULT_MINUTES% lss 0 (
    set /A RESULT_MINUTES=%RESULT_MINUTES% + 60
    set /A RESULT_HOURS=%RESULT_HOURS% - 1
)

if %RESULT_HOURS% lss 0 (
    set /A RESULT_HOURS=%RESULT_HOURS% + 24
)

set RESULT_HOURS=0%RESULT_HOURS%
set RESULT_HOURS=%RESULT_HOURS:~-2%

set RESULT_MINUTES=0%RESULT_MINUTES%
set RESULT_MINUTES=%RESULT_MINUTES:~-2%

set RESULT_SECONDS=0%RESULT_SECONDS%
set RESULT_SECONDS=%RESULT_SECONDS:~-2%

set RESULT_MILLIS=0%RESULT_MILLIS%
set RESULT_MILLIS=%RESULT_MILLIS:~-2%

echo %RESULT_HOURS%
echo %RESULT_MINUTES%
echo %RESULT_SECONDS%
echo %RESULT_MILLIS%

set %~1=%RESULT_HOURS%:%RESULT_MINUTES%:%RESULT_SECONDS%.%RESULT_MILLIS%

exit /B 0

rem Usage: Plus <RESULT> <lhs> <rhs>
rem RESULT = lhs == rhs
:Equal

call :Split LHS_HOURS LHS_MINUTES LHS_SECONDS LHS_MILLIS "%~2"
call :Split RHS_HOURS RHS_MINUTES RHS_SECONDS RHS_MILLIS "%~3"

set %~1=true

if %LHS_HOURS% neq %RHS_HOURS% (
    set %~1=false
    exit /B 0
)

if %LHS_MINUTES% neq %RHS_MINUTES% (
    set %~1=false
    exit /B 0
)

if %LHS_SECONDS% neq %RHS_SECONDS% (
    set %~1=false
    exit /B 0
)

if %LHS_MILLIS% neq %RHS_MILLIS% (
    set %~1=false
    exit /B 0
)

exit /B 0

rem Usage: Less <RESULT> <lhs> <rhs>
rem RESULT = lhs < rhs
:Less

call :Split LHS_HOURS LHS_MINUTES LHS_SECONDS LHS_MILLIS "%~2"
call :Split RHS_HOURS RHS_MINUTES RHS_SECONDS RHS_MILLIS "%~3"

set %~1=false

if %LHS_HOURS% lss %RHS_HOURS% (
    set %~1=true
    exit /B 0
)

if %RHS_HOURS% lss %LHS_HOURS% (
    exit /B 0
)

if %LHS_MINUTES% lss %RHS_MINUTES% (
    set %~1=true
    exit /B 0
)

if %RHS_MINUTES% lss %LHS_MINUTES% (
    exit /B 0
)

if %LHS_SECONDS% lss %RHS_SECONDS% (
    set %~1=true
    exit /B 0
)

if %RHS_SECONDS% lss %LHS_SECONDS% (
    exit /B 0
)

if %LHS_MILLIS% lss %RHS_MILLIS% (
    set %~1=true
    exit /B 0
)

if %RHS_MILLIS% lss %LHS_MILLIS% (
    exit /B 0
)

exit /B 0

rem Usage: Greater <RESULT> <lhs> <rhs>
rem RESULT = lhs > rhs
:Greater

call :Split LHS_HOURS LHS_MINUTES LHS_SECONDS LHS_MILLIS "%~2"
call :Split RHS_HOURS RHS_MINUTES RHS_SECONDS RHS_MILLIS "%~3"

set %~1=false

if %LHS_HOURS% gtr %RHS_HOURS% (
    set %~1=true
    exit /B 0
)

if %RHS_HOURS% gtr %LHS_HOURS% (
    exit /B 0
)

if %LHS_MINUTES% gtr %RHS_MINUTES% (
    set %~1=true
    exit /B 0
)

if %RHS_MINUTES% gtr %LHS_MINUTES% (
    exit /B 0
)

if %LHS_SECONDS% gtr %RHS_SECONDS% (
    set %~1=true
    exit /B 0
)

if %RHS_SECONDS% gtr %LHS_SECONDS% (
    exit /B 0
)

if %LHS_MILLIS% gtr %RHS_MILLIS% (
    set %~1=true
    exit /B 0
)

if %RHS_MILLIS% gtr %LHS_MILLIS% (
    exit /B 0
)

exit /B 0

rem Usage: Plus <RESULT> <lhs> <rhs>
rem RESULT = lhs + rhs
:Plus

call :Split LHS_HOURS LHS_MINUTES LHS_SECONDS LHS_MILLIS "%~2"
call :Split RHS_HOURS RHS_MINUTES RHS_SECONDS RHS_MILLIS "%~3"

set /A RESULT_HOURS=%LHS_HOURS% + %RHS_HOURS%
set /A RESULT_MINUTES=%LHS_MINUTES% + %RHS_MINUTES%
set /A RESULT_SECONDS=%LHS_SECONDS% + %RHS_SECONDS%
set /A RESULT_MILLIS=%LHS_MILLIS% + %RHS_MILLIS%

if %RESULT_MILLIS% geq 100 (
    set /A RESULT_MILLIS=%RESULT_MILLIS% - 100
    set /A RESULT_SECONDS=%RESULT_SECONDS% + 1
)

if %RESULT_SECONDS% geq 60 (
    set /A RESULT_SECONDS=%RESULT_SECONDS% - 60
    set /A RESULT_MINUTES=%RESULT_MINUTES% + 1
)

if %RESULT_MINUTES% geq 60 (
    set /A RESULT_MINUTES=%RESULT_MINUTES% - 60
    set /A RESULT_HOURS=%RESULT_HOURS% + 1
)

if %RESULT_HOURS% geq 24 (
    set /A RESULT_HOURS=%RESULT_HOURS% - 24
)

set RESULT_HOURS=0%RESULT_HOURS%
set RESULT_HOURS=%RESULT_HOURS:~-2%

set RESULT_MINUTES=0%RESULT_MINUTES%
set RESULT_MINUTES=%RESULT_MINUTES:~-2%

set RESULT_SECONDS=0%RESULT_SECONDS%
set RESULT_SECONDS=%RESULT_SECONDS:~-2%

set RESULT_MILLIS=0%RESULT_MILLIS%
set RESULT_MILLIS=%RESULT_MILLIS:~-2%

set %~1=%RESULT_HOURS%:%RESULT_MINUTES%:%RESULT_SECONDS%.%RESULT_MILLIS%

exit /B 0
