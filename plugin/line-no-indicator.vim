" vim-line-no-indicator
" Author: Sheldon Johnson
" Version: 0.3

if exists("g:loaded_line_no_indicator") || &cp
  finish
endif

let g:loaded_line_no_indicator = 1

if !exists("g:line_no_indicator_chars")
  let g:line_no_indicator_chars = ['⎺', '⎻', '⎼', '⎼', '⎽']
end

function! LineNoIndicator()
  " Zero indexed so line 2/3 becomes 1/2 == 50%
  let l:current_line = line(".") - 1
  let l:total_lines = line("$") - 1

  if l:current_line == 0
    let l:index = 0
  elseif l:current_line == l:total_lines
    let l:index = -1
  else
    let l:line_no_fraction = floor(l:current_line) / floor(l:total_lines)
    let l:index = float2nr(l:line_no_fraction * len(g:line_no_indicator_chars))
  endif

  return g:line_no_indicator_chars[l:index]
endfunction
