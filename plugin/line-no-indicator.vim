" vim-line-no-indicator
" Author: Sheldon Johnson
" Version: 0.1

if exists("g:loaded_pluginname") || &cp
  finish
endif

let g:loaded_pluginname = 1

if !exists("g:line_no_indicator_chars")
  let g:line_no_indicator_chars = ['⎺', '⎻', '⎼', '⎽', '⎯']
end

function! LineNoIndicator()
  let l:current_line = line(".")
  let l:total_lines = line("$")

  if l:current_line == 1
    return g:line_no_indicator_chars[0]
  elseif l:current_line == l:total_lines
    return g:line_no_indicator_chars[-1]
  else
    let l:line_no_fraction = floor(l:current_line) / floor(l:total_lines)
    let l:index = float2nr(l:line_no_fraction * len(g:line_no_indicator_chars))
    return g:line_no_indicator_chars[l:index]
  endif
endfunction
