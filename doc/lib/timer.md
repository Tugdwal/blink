
# Timer

Namespace : `Timer`

## Loading

```bat
call %LnkStdImport% "timer"
```

## Functions

* [Start](#start)
* [Stop](#stop)
* [GetStartTime](#getstarttime)
* [GetEndTime](#getendtime)
* [GetDuration](#getduration)
* [Format](#format)
* [Split](#split)
* [GetHours](#gethours)
* [GetMinutes](#getminutes)
* [GetSeconds](#getseconds)
* [GetMilliseconds](#getmilliseconds)
* [Add](#add)
* [Subtract](#subtract)

### Start

Start (or restart) a timer.

```bat
call %TimerStart% "timer"
```

### Stop

Stop a timer.

```bat
call %TimerStop% "timer"
```

### GetStartTime

Get the starting time of a timer.

```bat
call %TimerGetStartTime% start_time "timer"
echo %start_time%
```

> 01:23:45.67

### GetEndTime

Get the ending time of a timer.

```bat
call %TimerGetEndTime% end_time "timer"
echo %end_time%
```

> 23:45:67.89

### GetDuration

Get the duration of a timer.

```bat
call %TimerDuration% duration "timer"
echo %duration%
```

> 22:22:22.22

### Format

Concatenate each component according to the current system format.

```bat
call %TimerFormat% timer "1" "2" "3" "4"
echo %timer%
```

> 01:02:03.04

### Split

Get each component of a timer separately. Leading spaces and zeros are removed.

```bat
call %TimerSplit% hrs min sec mil " 1:02:03.04"
echo %hrs% %min% %sec% %mil%
```

> 1 2 3 4

Every component is optional but an empty argument can be provided to skip it. If you need a single component or even two, consider using [GetHours](#gethours), [GetMinutes](#getminutes), [GetSeconds](#getseconds) or [GetMilliseconds](#getmilliseconds).

```bat
call %TimerSplit% "" "" sec "" "01:02:03.04"
echo %sec%
```

> 3

### GetHours

Get the hours of a timer.

```bat
call %TimerGetHours% hrs "01:02:03.04"
echo %hrs%
```

> 1

### GetMinutes

Get the hours of a timer.

```bat
call %TimerGetMinutes% min "01:02:03.04"
echo %min%
```

> 2

### GetSeconds

Get the seconds of a timer.

```bat
call %TimerGetSeconds% sec "01:02:03.04"
echo %sec%
```

> 3

### GetMilliseconds

Get the milliseconds of a timer.

```bat
call %TimerGetMilliseconds% mil "01:02:03.04"
echo %mil%
```

> 4

### Add

Add 2 timers.

```bat
call %TimerAdd% result "01:23:45.67" "12:34:56.78"
echo %result%
```

> 13:58:42.45

### Subtract

Subtract 2 timers.

```bat
call %TimerSubtract% result "23:45:67.89" "01:23:45.67"
echo %result%
```

> 22:22:22:22
