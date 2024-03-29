# vim-line-no-indicator

A simple line number indicator.

![vim-line-no-indicator-small](https://imgur.com/36mmVdI.gif)


## Why?

I have line numbers displayed (`set number`) when editing code, so I already
know what line number I'm on. I just need something to show me roughly how far
through the document I am, without taking up 4+ characters in my statusline.


## Installation

Install with a plugin manager.


## Usage

Add `%{LineNoIndicator()}` to your statusline. For example:

```vim
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %{LineNoIndicator()}
```

See `:help 'statusline'` for more information about doing this.


### vim-lightline

I use [vim-lightline](https://github.com/itchyny/lightline.vim). My settings
look like this:

```vim
let g:lightline.component = {
      \   'indicator': '%{LineNoIndicator()}'
      \ }

let g:lightline.active = {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'readonly', 'relativepath', 'modified' ]
      \   ],
      \   'right': [
      \     [ 'indicator' ],
      \     [ 'lineinfo' ]
      \   ]
      \ }

let g:lightline.inactive = {
      \   'left': [
      \     [ 'filename' ]
      \   ],
      \   'right': [
      \     [ 'indicator' ],
      \     [ 'lineinfo' ]
      \   ]
      \ }
```


### vim-airline

I used to use [vim-airline](https://github.com/vim-airline/vim-airline/). My
settings looked like this:

```vim
let g:airline_section_x = '%{&filetype}'
let g:airline_section_y = '%#__accent_bold#%{LineNoIndicator()}%#__restore__#'
let g:airline_section_z = '%2c'
```


### lualine.nvim

Users of [Lualine](https://github.com/nvim-lualine/lualine.nvim) can simply add `'LineNoIndicator'` in the proper section. For example, one can replace the default

```lua
lualine_y = {'progress'},
```

within the `sections` part of the setup with
```lua
lualine_y = {'LineNoIndicator'},
```

For more information, see [Lualine’s documentation](https://github.com/nvim-lualine/lualine.nvim#usage-and-customization).


## Configuration

```vim
" Defaults
let g:line_no_indicator_chars = ['⎺', '⎻', '─', '⎼', '⎽'] " on macOS
let g:line_no_indicator_chars = ['⎺', '⎻', '⎼', '⎽', '⎯'] " on Linux
```

The chars above look different between my Mac and Ubuntu machines for some
reason, so the above are the respective defaults. If neither of these are right
for you, [create an issue](https://github.com/drzel/vim-line-no-indicator/issues/new).

Some alternatives:

```vim
" one char wide solid vertical bar
let g:line_no_indicator_chars = [
  \  ' ', '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█'
  \  ]

" two char wide fade-in blocks
let g:line_no_indicator_chars = [
  \ '  ', '░ ', '▒ ', '▓ ', '█ ', '█░', '█▒', '█▓', '██'
  \ ]

" three char wide solid horizontal bar
let g:line_no_indicator_chars = [
  \ '   ', '▏  ', '▎  ', '▍  ', '▌  ',
  \ '▋  ', '▊  ', '▉  ', '█  ', '█▏ ',
  \ '█▎ ', '█▍ ', '█▌ ', '█▋ ', '█▊ ',
  \ '█▉ ', '██ ', '██▏', '██▎', '██▍',
  \ '██▌', '██▋', '██▊', '██▉', '███'
  \ ]
 
```
Note: The above chars might look a little janky in your browser, but probably
render okay in your terminal.


## Screenshots

### Before

Default vim-airline statusline:
![Before](https://imgur.com/eGutHNT.png)

### After

With vim-line-no-indicator and vim-airline settings as above:
![After](https://imgur.com/ABNW2sP.png)

Screenshots in
[Tilix](https://gnunn1.github.io/tilix-web/), running
[neovim](https://neovim.io/) with
[roboto mono](https://fonts.google.com/specimen/Roboto+Mono) font,
[nord](https://github.com/arcticicestudio/nord-vim) colorscheme and
[vim-airline](https://github.com/vim-airline/vim-airline) statusline.


## What people are saying about vim-line-no-indicator

[justinmk](https://github.com/justinmk):
> Cool. I used [noscrollbar](https://github.com/gcavallanti/vim-noscrollbar)
> for a long time, but sometimes wished for this approach instead.

[romainl](https://github.com/romainl):
> I don't think it's of any use.
