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

  " Length of list of single cycle of a repeat
  " minus one (4 for default g:line_no_indicator_chars).
  " Count of steps of one full cycle of indicator from minimum to maximum value
  " (but minus one because we're dealing with 0-index below).
  let l:indicator_full_cycle_steps = len(g:line_no_indicator_chars) - 1

  " Result Line No Indicator string accumulator
  let l:result = ''

  " Iterating over repeats starting from 0 (zero)
  for l:i in range(g:line_no_indicator_bar_repeats)
    " Coefficient (from 0 to 1) of current line position multiplied by count of
    " repeats and shifted (minus) with current repeat index (starting from 0).
    " So if g:line_no_indicator_bar_repeats is 3 the first value will be in
    " between 0 and 3, second will be in between -1 and 2 and thrid -2 and 1.
    " Value from 0 to 1 indicates coefficient of current repeat state, it it's
    " bigger it means current state is maximum, if it's lower it means current
    " state is minimum. Below we're limiting it to 0 and 1 boundaries.
    let l:line_no_fraction =
      \ ( floor(l:current_line)
      \ / floor(l:total_lines)
      \ * g:line_no_indicator_bar_repeats
      \ ) - l:i

    " We're multiplying steps count of one repeat cycle (minus one) by
    " l:line_no_fraction coefficient of current repeat state and fit it in
    " boundaries.
    " It's relative to current repeat.
    " If it's lower than minimum it means all the next repeats have minimum
    " value, if it's bigger it means all the previous repeats have maximum
    " value.
    " Getting absolute index of whole indicator (including repeats),
    " when it's lower than current repeat we set it to 0 and when it's bigger
    " than maximum of full cycle steps we set it to maximum value.
    let l:index =
      \ min([l:indicator_full_cycle_steps,
      \ max([0,
      \ float2nr(l:line_no_fraction * l:indicator_full_cycle_steps)
      \ ])])

    " Appending to accumulator another repeated (or only single one) indicator
    " char (or 'chars' if you have multiple chars indicator in
    " g:line_no_indicator_chars like ['   ', '.  ', '.. ', '...']) with properly
    " calculated state of current repeat index.
    let l:result = l:result . g:line_no_indicator_chars[l:index]
  endfor

  return l:result
endfunction
