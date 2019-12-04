scriptencoding utf-8

" vim-line-no-indicator
" Author: Sheldon Johnson
" Version: 0.3

if exists('g:loaded_line_no_indicator') || &compatible
  finish
endif

let g:loaded_line_no_indicator = 1

if !exists('g:line_no_indicator_chars')
  if has('macunix')
    let g:line_no_indicator_chars = ['⎺', '⎻', '─', '⎼', '⎽']
  else
    let g:line_no_indicator_chars = ['⎺', '⎻', '⎼', '⎽', '⎯']
  end
end

if !exists('g:line_no_indicator_bar_repeats')
  let g:line_no_indicator_bar_repeats = 1
en

function! LineNoIndicator() abort
  " Zero index line number so 1/3 = 0, 2/3 = 0.5, and 3/3 = 1
  let l:current_line = line('.') - 1
  let l:total_lines = line('$') - 1
  let l:single_len = len(g:line_no_indicator_chars) - 1
  let l:result = ''

  for l:i in range(g:line_no_indicator_bar_repeats)
    let l:line_no_fraction =
      \ ( floor(l:current_line)
      \ / floor(l:total_lines)
      \ * g:line_no_indicator_bar_repeats
      \ ) - l:i

    let l:index =
      \ min([l:single_len,
      \ max([0,
      \ float2nr(l:line_no_fraction * l:single_len)
      \ ])])

    let l:result = l:result . g:line_no_indicator_chars[l:index]
  endfor

  return l:result
endfunction
