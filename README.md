junkfile.vim
============

*junkfile* creates junk files. Instead of other scratch plugins, it can create files with a filetype.

Table of Contents
-----------------

- [Usage](#usage)
- [Interface](#interface)
  - [Functions](#functions)
  - [Commands](#commands)
  - [Variables](#variables)
- [Examples](#examples)
- [Credits](#credits)
  - [Author](#author)
  - [Contributors](#contributors)

Usage
-----

Create junk file:

```vim
:JunkfileOpen
```

Interface
---------

### Functions

Open `{prefix}` junk file using `{edit-command}`. If `{edit-command}` is omitted, `g:junkfile#edit_command` is used instead.

```vim
junkfile#open({prefix} [, {edit-command}])
```

Open `{filename}` junk file immediately. It is useful to edit memo or diary file.

```vim
junkfile#open_immediately({filename})
```

### Commands

For all the commands except the `Junkfile*Save` commands, if `{postfix}` is given, it will open junk file immediately.

| Command                        | Description                                                                   |
|:-------------------------------|:------------------------------------------------------------------------------|
| `:JunkfileOpen [{postfix}]`    | Creates new junk file using `g:junkfile#edit_command`.                        |
| `:JunkfileEdit [{postfix}]`    | Creates new junk file in the current window.                                  |
| `:JunkfileSplit [{postfix}]`   | Creates new junk file in a horizontal split.                                  |
| `:JunkfileVsplit [{postfix}]`  | Creates new junk file in a vertical split.                                    |
| `:JunkfileTabEdit [{postfix}]` | Creates new junk file in a new tab.                                           |
| `:JunkfileSave`                | Save the current buffer to a junk file and open it in the current buffer.     |
| `:JunkfileSplitSave`           | Save the current buffer to a junk file and open it in a new horizontal split. |
| `:JunkfileVsplitSave`          | Save the current buffer to a junk file and open it in a new vertical split.   |
| `:JunkfileTabSave`             | Save the current buffer to a junk file and open it in a new tab.              |


### Variables

| Variable                  | Description                                                                                       |
|:--------------------------|:--------------------------------------------------------------------------------------------------|
| `g:junkfile#directory`    | Specifies the directory where *junkfile* writes junk files.<br>*Defaults to* `~/.cache/junkfile`. |
| `g:junkfile#edit_command` | Specifies buffer open command when `:JunkfileOpen`.<br>*Defaults to* `edit`.                      |

Examples
--------

```vim
command! -nargs=0 JunkfileDay call junkfile#open_immediately(strftime('%Y-%m-%d.txt'))
command! -nargs=0 JunkfileDiary call junkfile#open_immediately(strftime('%Y-%m-%d.md'))
```

Credits
-------

### Author

Shougo Matsushita – [GitHub][Shougo]

### Contributors

- Rick Koike – [GitHub][ssig33]
- Robert Audi – [GitHub][RobertAudi]

[Shougo]: https://github.com/Shougo
[ssig33]: https://github.com/ssig33
[RobertAudi]: https://github.com/RobertAudi
