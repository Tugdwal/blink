# Linker

Namespace : `Lnk`

## Loading

```bat
call "path/to/linker.bat"
```

## Functions

* [Import](#import)
* [StdImport](#stdimport)

### Import

Import a module from a third-party library.

```bat
call %LnkImport% "path/to/module"
if errorlevel 1 ( exit /B )
```

Multiple modules can be imported at once.

```bat
call %LnkImport% "path/to/module1" "path/to/module2"
if errorlevel 1 ( exit /B )
```

Returns immediately if one fails to load and `errorlevel` is unchanged.

### StdImport

Import a built-in module from the standard library.

```bat
call %LnkStdImport% "module"
if errorlevel 1 ( exit /B )
```

Multiple modules can be imported at once.

```bat
call %LnkStdImport% "module1" "module2"
if errorlevel 1 ( exit /B )
```

Returns immediately if one fails to load and `errorlevel` is unchanged.
