"=============================================================================
" FILE: junkfile.vim
" AUTHOR:  Shougo Matsushita <Shougo.Matsu@gmail.com>
" License: MIT license
"=============================================================================

if exists('g:loaded_junkfile')
  finish
endif
let g:loaded_junkfile = 1

command! -range -nargs=? JunkfileOpen    <line1>,<line2>call junkfile#open(<q-args>)
command! -range -nargs=? JunkfileVsplit  <line1>,<line2>call junkfile#open(<q-args>,  'vsplit')
command! -range -nargs=? JunkfileSplit   <line1>,<line2>call junkfile#open(<q-args>,   'split')
