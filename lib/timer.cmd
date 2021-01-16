@rem Entry point
@if "%~1" == "" (
    call :Init
) else (
    call %*
)
@exit /B

rem Usage: Init
:Init

@set TimerStart="%~f0" :Start
@set TimerStop="%~f0" :Stop

@set TimerGetStartTime="%~f0" :GetStartTime
@set TimerGetEndTime="%~f0" :GetEndTime
@set TimerGetDuration="%~f0" :GetDuration

@set TimerFormat="%~f0" :Format
@set TimerSplit="%~f0" :Split

@set TimerGetHours="%~f0" :GetHours
@set TimerGetMinutes="%~f0" :GetMinutes
@set TimerGetSeconds="%~f0" :GetSeconds
@set TimerGetMilliseconds="%~f0" :GetMilliseconds

@set TimerAdd="%~f0" :Add
@set TimerSubtract="%~f0" :Subtract

@exit /B 0

rem Usage: Start <timer_name>
:Start
@set "timer_%~1_start_time=%TIME%"
@call :Format timer_%~1_end_time 0 0 0 0
@exit /B 0

rem Usage: Stop <timer_name>
:Stop
@set "timer_%~1_end_time=%TIME%"
@exit /B 0

rem Usage: GetStartTime <OUT: result> <IN: timer_name>
:GetStartTime
@call set "%~1=%%timer_%~2_start_time%%"
@exit /B 0

rem Usage: GetEndTime <OUT: result> <IN: timer_name>
:GetEndTime
@call set "%~1=%%timer_%~2_end_time%%"
@exit /B 0

rem Usage: GetDuration <OUT: result> <IN: timer_name>
:GetDuration
@setlocal

@call :GetStartTime start_time %2
@call :GetEndTime end_time %2
@call :Subtract result "%end_time%" "%start_time%"

@endlocal & set "%~1=%result%"
@exit /B 0

rem Usage: <OUT: result> <IN: hours> <IN: minutes> <IN: seconds> <IN: milliseconds>
:Format
@setlocal

@set hrs=00%~2
@set min=00%~3
@set sec=00%~4
@set mil=00%~5

@set separator=%TIME:~8,1%

@endlocal & set "%~1=%hrs:~-2%:%min:~-2%:%sec:~-2%%separator%%mil:~-2%"
@exit /B 0

rem Usage: Split <OUT: hours> <OUT: minutes> <OUT: seconds> <OUT: milliseconds> <IN: timer>
:Split

@for /F "tokens=1-4 delims=:., " %%A in ("%~5") do @(
    if not "%~1" == "" ( set /A "%~1=100%%A %% 100" )
    if not "%~2" == "" ( set /A "%~2=100%%B %% 100" )
    if not "%~3" == "" ( set /A "%~3=100%%C %% 100" )
    if not "%~4" == "" ( set /A "%~4=100%%D %% 100" )
)

@exit /B 0

rem Usage: GetHours <OUT: hours> <IN: timer>
:GetHours

@for /F "tokens=1-4 delims=:., " %%A in ("%~2") do @(
    set /A "%~1=100%%A %% 100"
)

@exit /B 0

rem Usage: GetMinutes <OUT: minutes> <IN: timer>
:GetMinutes

@for /F "tokens=1-4 delims=:., " %%A in ("%~2") do @(
    set /A "%~1=100%%B %% 100"
)

@exit /B 0

rem Usage: GetSeconds <OUT: seconds> <IN: timer>
:GetSeconds

@for /F "tokens=1-4 delims=:., " %%A in ("%~2") do @(
    set /A "%~1=100%%C %% 100"
)

@exit /B 0

rem Usage: GetMilliseconds <OUT: milliseconds> <IN: timer>
:GetMilliseconds

@for /F "tokens=1-4 delims=:., " %%A in ("%~2") do @(
    set /A "%~1=100%%D %% 100"
)

@exit /B 0

rem Usage: Add <OUT: result> <IN: lhs_timer> <IN: rhs_timer>
:Add

@call :Split lhrs lmin lsec lmil %2
@call :Split rhrs rmin rsec rmil %3

@set /A "hrs=%lhrs% + %rhrs%"
@set /A "min=%lmin% + %rmin%"
@set /A "sec=%lsec% + %rsec%"
@set /A "mil=%lmil% + %rmil%"

@if %mil% geq 100 (
    set /A "mil=%mil% - 100"
    set /A "sec=%sec% + 1"
)

@if %sec% geq 60 (
    set /A "sec=%sec% - 60"
    set /A "min=%min% + 1"
)

@if %min% geq 60 (
    set /A "min=%min% - 60"
    set /A "hrs=%hrs% + 1"
)

@if %hrs% geq 24 (
    set /A "hrs=%hrs% - 24"
)

@call :Format result "%hrs%" "%min%" "%sec%" "%mil%"

@endlocal & set "%~1=%result%"
@exit /B 0

rem Usage: Subtract <OUT: result> <IN: lhs_timer> <IN: rhs_timer>
:Subtract
@setlocal

@call :Split lhrs lmin lsec lmil %2
@call :Split rhrs rmin rsec rmil %3

@set /A "hrs=%lhrs% - %rhrs%"
@set /A "min=%lmin% - %rmin%"
@set /A "sec=%lsec% - %rsec%"
@set /A "mil=%lmil% - %rmil%"

@if %mil% lss 0 (
    set /A "mil=%mil% + 100"
    set /A "sec=%sec% - 1"
)

@if %sec% lss 0 (
    set /A "sec=%sec% + 60"
    set /A "min=%min% - 1"
)

@if %min% lss 0 (
    set /A "min=%min% + 60"
    set /A "hrs=%hrs% - 1"
)

@if %hrs% lss 0 (
    set /A "hrs=%hrs% + 24"
)

@call :Format result "%hrs%" "%min%" "%sec%" "%mil%"

@endlocal & set "%~1=%result%"
@exit /B 0
