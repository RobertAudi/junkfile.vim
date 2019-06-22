"=============================================================================
" FILE: junkfile.vim
" AUTHOR:  Shougo Matsushita <Shougo.Matsu at gmail.com>
" License: MIT license
"=============================================================================

let g:junkfile#directory =
      \ get(g:, 'junkfile#directory',
      \  expand($XDG_CACHE_HOME !=# '' ?
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

function! s:make_junk_tree() abort
  let l:junk_dir = g:junkfile#directory . strftime('/%Y/%m/%H/%M/')

  if !isdirectory(l:junk_dir)
    call mkdir(l:junk_dir, 'p')
  endif

  return l:junk_dir
endfunction

function! s:open_junkfile(filename, edit_command) abort
  let l:junk_dir = s:make_junk_tree()
  let l:filename = l:junk_dir . a:filename

  execute a:edit_command fnameescape(l:filename)

  let b:Junkfile = bufnr('%')

  return b:Junkfile
endfunction

function! s:append_lines(lines) abort
  if !exists('b:Junkfile') || bufnr('%') != b:Junkfile
    throw 'Fatal Error: Not inside junkfile!'
  endif

  call append(0, a:lines)
  " not sure why but an extra blank line seems to always be added
  silent! delete _
  silent! write
endfunction

function! junkfile#open(prefix, ...) range abort
  let l:filename = s:get_filename(a:prefix)

  if empty(l:filename)
    return
  endif

  let l:edit_command = a:0 ? a:1 : g:junkfile#edit_command

  let l:use_range = a:lastline - a:firstline > 0
  if l:use_range
    let l:saved_lines = getline(a:firstline, a:lastline)
  endif

  call s:open_junkfile(l:filename, l:edit_command)

  if l:use_range
    call s:append_lines(l:saved_lines)
  endif
endfunction

function! junkfile#open_immediately(filename) abort
  call s:open_junkfile(a:filename, g:junkfile#edit_command)
endfunction

function! junkfile#save(prefix, ...) abort
  let l:filename = s:get_filename(a:prefix)

  if empty(l:filename)
    return
  endif

  let l:junk_dir = s:make_junk_tree()
  let l:filepath = l:junk_dir . l:filename

  execute 'write! ' . l:filepath

  let l:edit_command = a:0 ? a:1 : g:junkfile#edit_command

  call s:open_junkfile(l:filename, l:edit_command)
endfunction
