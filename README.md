# BLink

Batch Linker and standard library.

## Function

### Private function

Internal labels behave like functions when accessed with the `call` command. They support arguments and give control back to the caller upon exit.

```bat
rem Private function label
:Function
rem Swap and print the first 2 parameters
echo %~2 %~1
rem Return with success
exit /B 0
```

```bat
rem Use private function
call :Function "first" "second"
```

> second first

### Public function

Internal labels are not directly accessible by external scripts, but a proper entry point can fix this. The entry point placed at the top of the script is responsible for calling the function and forwarding arguments to it.

```bat
rem Entry point
call %*
rem Return immediately without changing errorlevel
exit /B

rem Private function label
:Function
rem Swap and print the first 2 parameters
echo %~2 %~1
rem Return with success
exit /B 0
```

```bat
rem Use public function
call "path/to/script" :Function "first" "second"
```

> second first

Using an absolute path is almost always required as the relative path becomes invalid when the current directory changes.

```bat
rem Use public function with absolute path
call "%~dp0path/to/script" :Function "first" "second"
```

> second first

### Function reference

Using public functions is repetitive and error prone, but the path and label can be stored in single a variable. The interpreter will expand it before executing the instruction. Even the `call` and leading arguments can be included.

```bat
rem Declare function reference
set Function="%~dp0path/to/script" :Function

rem Use function
call %Function% "first" "second"
```

> second first

## Expression

Expression are variables containing a partial or complete instruction. Expression can be almost anything excluding some control characters. Function references are a special kind of expression.

## Module

A module is a script that exports a set of symbols, namely constants, expressions and function references.

### Loading

The entry point is responsible for initializing the module when no label is provided.

```bat
rem Import module
call "path/to/module"
if errorlevel 1 ( exit /B )
```

### Namespace

In order to prevent name conflicts, standard modules use a namespace as prefix for every symbol they export. Third-party library should follow the same principle.

### Standard module template

```bat
rem Entry point
if "%~1" == "" (
    call :Init
) else (
    call %*
)
exit /B

rem Private init label
:Init

rem Exported variable
set ModuleVariable=Value

rem Exported function
set ModuleFunction="%~f0" :Function

exit /B 0

rem Private function label
:Function
rem Not Yet Implemented
exit /B 0
```

## Standard library

### Linker

Although not required, the linker provides a common interface for importing other modules. To use the linker, import it like any other module, then import other modules with [`Import`](doc/linker.md#import) and [`StdImport`](doc/linker.md#stdimport).

```bat
call "path/to/linker"
if errorlevel 1 ( exit /B )
```

### Standard modules

* [Bool](doc/lib/bool.md)
* [Linker](doc/linker.md)
* [Log](doc/lib/log.md)
* [Timer](doc/lib/timer.md)
