# Bool

This module intends to fix the lack of builtin booleans. It intentionally has no namespace.

## Loading

```bat
call %LnkStdImport% "bool"
```

## Constants

* [true](#true)
* [false](#false)

### true

Constant whose value is `true` (1).

```bat
set value=%true%
if "%value%" == "%true% (
    echo True
) else (
    echo False
)
```

> True

### false

Constant whose value is `false` (0).

```bat
set value=%false%
if "%value%" == "%false% (
    echo False
) else (
    echo True
)
```

> False

## Expressions

### IsTrue

Test if a subroutine returned [true](#true).

```bat
:Function
exit /B %true%
```

```bat
call :Function
if %IsTrue% (
    echo True
) else (
    echo False
)
```

> True

### IsFalse

Test if a subroutine returned [false](#false).

```bat
:Function
exit /B %false%
```

```bat
call :Function
if %IsFalse% (
    echo False
) else (
    echo True
)
```

> False
