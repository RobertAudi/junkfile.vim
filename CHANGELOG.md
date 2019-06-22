### 2019-06-22

- Add the `junkfile#save()` function to save the current buffer to a new file. _(by **Robert Audi**)_
- Add commands to save the current buffer in a junk file: _(by **Robert Audi**)_
  - `JunkfileSave`
  - `JunkfileVsplitSave`
  - `JunkfileSplitSave`
  - `JunkfileTabSave`

### 2019-02-23

- Refactor the code to remove duplication. _(by **Robert Audi**)_
  - The `junkfile#open()` now accepts an optional "editor command" as second parameter.
  - Remove the `junkfile#vsplit_open()` and `junkfile#split_open()`.
- Rename `:JunkfileVsplitOpen` to `:JunkfileVsplit` _(by **Robert Audi**)_
- Rename `:JunkfileSplitOpen` to `:JunkfileSplit` _(by **Robert Audi**)_
- Add `:JunkfileEdit` and `:JunkfileTabEdit` _(by **Robert Audi**)_

### 2018-02-05

- Add commands/functions to open junk files in splits _(by **Robert Audi**)_
  - `junkfile#vsplit_open({prefix})` and `:JunkfileVsplitOpen` to open a junk file in a vertical split
  - `junkfile#split_open({prefix})` and `:JunkfileSplitOpen` to open a junk file in a horizontal split

### 2016-08-05

- Create a junk directory every minute instead of every month. _(by **Rick Koike**)_

### 2013-03-23

- Added delete action. _(by **Shougo Matsushita**)_
- Improved sort. _(by **Shougo Matsushita**)_

### 2013-02-16

- Initial version. _(by **Shougo Matsushita**)_
- Added `junkfile#open_immediately().` _(by **Shougo Matsushita**)_
