# Log

Namespace : `Log`

## Loading

```bat
call %LnkStdImport% "log"
```

## Functions

* [Error](#error)
* [Info](#info)

### Error

Print the given error message to `STDERR`.

```bat
call %LogError% "Error message"
```

> [01/01/2020][12:00:00.00][Error] Error message

### Info

Print the given informational message to `STDERR`.

```bat
call %LogInfo% "Informational message"
```

> [01/01/2020][12:00:00.00][Info] Informational message
