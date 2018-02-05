junkfile.vim
============

*junkfile* creates junk files. Instead of other scratch plugins, it can create files with a filetype.

Table of Contents
-----------------

* [Usage](#usage)
* [Interface](#interface)
  * [Functions](#functions)
  * [Commands](#commands)
  * [Variables](#variables)
* [Examples](#examples)
* [Credits](#credits)
  * [Author](#author)
  * [Contributors](#contributors)

Usage
-----

Create junk file:

```viml
:JunkfileOpen
```

Interface
---------

### Functions

Open `{prefix}` junk file.

```viml
junkfile#open({prefix})
```

Open `{prefix}` junk file in a new horizontal split.

```viml
junkfile#split_open({prefix})
```

Open `{prefix}` junk file in a new vertical split.

```viml
junkfile#vsplit_open({prefix})
```

Open `{filename}` junk file immediately. It is useful to edit memo or diary file.

```viml
junkfile#open_immediately({filename})
```

### Commands

Creates new junk file. If `{postfix}` is given, it will open junk file immediately.

```viml
:JunkfileOpen [{postfix}]
```

Creates new junk file in a horizontal split.

```viml
:JunkfileSplitOpen [{postfix}]
```

Creates new junk file in a vertical split.

```viml
:JunkfileVsplitOpen [{postfix}]
```

### Variables

Specifies the directory where *junkfile* writes junk files.
*Defaults to* `~/.cache/junkfile`.

```viml
g:junkfile#directory
```

Specifies buffer open command when `:JunkfileOpen`.
*Defaults to* `edit`.

```viml
g:junkfile#edit_command
```

Examples
--------

```viml
command! -nargs=0 JunkfileDay call junkfile#open_immediately(strftime('%Y-%m-%d.txt'))
command! -nargs=0 JunkfileDiary call junkfile#open_immediately(strftime('%Y-%m-%d.md'))
```

Credits
-------

### Author

Shougo Matsushita – [GitHub][Shougo]

### Contributors

- Rick Koike – [GitHub][ssig33]

[Shougo]: https://github.com/Shougo
[ssig33]: https://github.com/ssig33
