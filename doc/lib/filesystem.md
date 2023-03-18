# Filesystem

Namespace : `Fs`

## Dependencies

* [Bool](bool.md)

## Loading

```bat
call %LnkStdImport% "filesystem"
```

## Functions

* [Access](#access)
* [AccessDirectory](#accessdirectory)
* [AccessFile](#accessfile)
* [Exists](#exists)
* [IsDirectory](#isdirectory)
* [IsFile](#isfile)

### Access

Checks if the given path corresponds to an existing file or directory and reports it to the user if it doesn't.

```bat
call %FsAccess% "path"
if %IsTrue% (
    echo Path is accessible
)
```

See also: [Exists](#exists).

### AccessDirectory

Checks if the given path corresponds to an existing directory like and reports it to the user if it doesn't.

```bat
call %FsAccessDirectory% "path/to/directory"
if %IsTrue% (
    echo Directory is accessible
)
```

See also: [IsDirectory](#isdirectory).

### AccessFile

Checks if the given path corresponds to an existing file like and reports it to the user if it doesn't.

```bat
call %FsAccessFile% "path/to/file"
if %IsTrue% (
    echo File is accessible
)
```

See also: [IsFile](#isfile).

### Exists

Checks if the given path corresponds to an existing file or directory.

```bat
call %FsExists% "path"
if %IsTrue% (
    echo File or directory exists
)
```

This function is provided for completeness and is strictly equivalent to the builtin `if exist` expression. If you care about performance, it should be avoided in favor of the latter.

### IsDirectory

Checks if the given path corresponds to a directory.

```bat
call %FsIsDirectory% "path/to/directory"
if %IsTrue% (
    echo Directory exists
)
```

### IsFile

Checks if the given path corresponds to a file.

```bat
call %FsIsFile% "path/to/file"
if %IsTrue% (
    echo File exists
)
```
