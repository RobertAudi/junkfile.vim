"=============================================================================
" FILE: junkfile.vim
" AUTHOR:  Shougo Matsushita <Shougo.Matsu@gmail.com>
" License: MIT license
"=============================================================================

if exists('g:loaded_junkfile')
  finish
endif

command! -range -nargs=? JunkfileOpen <line1>,<line2>call junkfile#open(<q-args>)
command! -range -nargs=? JunkfileVsplitOpen <line1>,<line2>call junkfile#vsplit_open(<q-args>)
command! -range -nargs=? JunkfileSplitOpen <line1>,<line2>call junkfile#split_open(<q-args>)

let g:loaded_junkfile = 1
