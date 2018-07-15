"=============================================================================
" FILE: junkfile.vim
" AUTHOR:  Shougo Matsushita <Shougo.Matsu at gmail.com>
" License: MIT license
"=============================================================================

let g:junkfile#directory =
      \ get(g:, 'junkfile#directory',
      \  expand($XDG_CACHE_HOME != '' ?
      \   $XDG_CACHE_HOME . '/junkfile' : '~/.cache/junkfile'))
let g:junkfile#edit_command =
      \ get(g:, 'junkfile#edit_command', 'edit')

function! s:get_filename(prefix) abort
  let l:prefix = ''
  let l:postfix = ''

  if a:prefix ==# ''
    let l:prefix = strftime('%Y-%m-%d-%H%M%S') . '.junkfile'
    let l:postfix = fnamemodify(bufname('%'), ':e')
  else
    let l:prefix = fnamemodify(a:prefix, ':r')
    let l:postfix = fnamemodify(a:prefix, ':e')
    if l:postfix ==# ''
      let l:postfix = fnamemodify(bufname('%'), ':e')
    endif
  endif

  if l:postfix ==# ''
    let l:postfix = 'txt'
  endif
  return input('Junk Code: ', l:prefix . '.' . l:postfix)
endfunction

function! s:open_junkfile(filename, edit_command) abort
  let l:filename = g:junkfile#directory . strftime('/%Y/%m/%H/%M/') . a:filename
  let l:junk_dir = fnamemodify(l:filename, ':h')
  if !isdirectory(l:junk_dir)
    call mkdir(l:junk_dir, 'p')
  endif

  execute a:edit_command fnameescape(l:filename)
endfunction

function! s:append_lines(lines) abort
  call append(0, a:lines)
  " not sure why but an extra blank line seems to always be added
  silent! normal "_dd
  silent! write
endfunction

function! junkfile#open(prefix, ...) range abort
  let l:use_range = a:lastline - a:firstline > 0
  if l:use_range
    let l:saved_lines = getline(a:firstline, a:lastline)
  endif

  let l:filename = s:get_filename(a:prefix)

  if l:filename !=# ''
    call s:open_junkfile(l:filename, g:junkfile#edit_command)
  endif

  if l:use_range
    call s:append_lines(l:saved_lines)
  endif
endfunction

function! junkfile#open_immediately(filename) abort
  call s:open_junkfile(a:filename, g:junkfile#edit_command)
endfunction

function! junkfile#vsplit_open(prefix, ...) range abort
  let l:use_range = a:lastline - a:firstline > 0
  if l:use_range
    let l:saved_lines = getline(a:firstline, a:lastline)
  endif

  let l:filename = s:get_filename(a:prefix)
  if l:filename !=# ''
    call s:open_junkfile(l:filename, 'vsplit')
  endif

  if l:use_range
    call s:append_lines(l:saved_lines)
  endif
endfunction

function! junkfile#split_open(prefix, ...) range abort
  let l:use_range = a:lastline - a:firstline > 0
  if l:use_range
    let l:saved_lines = getline(a:firstline, a:lastline)
  endif

  let l:filename = s:get_filename(a:prefix)
  if l:filename !=# ''
    call s:open_junkfile(l:filename, 'split')
  endif

  if l:use_range
    call s:append_lines(l:saved_lines)
  endif
endfunction
