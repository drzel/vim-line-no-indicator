# vim-line-no-indicator

Show a one-char wide, simple and expressive line number indicator.

![vim-line-no-indicator-small](https://imgur.com/36mmVdI.gif)

## Why?

I have line numbers displayed (`set number`) when editing code, so I already know what line number I'm on. I just need something to show me roughly how far through the document I am, without taking up 4+ characters in my statusline.

## Installation

Install with a plugin manager.

## Usage

Add `%{LineNoIndicator()}` to your statusline. For example:

```vim
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %{LineNoIndicator()}
```

See `:help 'statusline'` for more information about doing this.

### vim-airline

I use [vim-airline](https://github.com/vim-airline/vim-airline/), so my configuration looks like this:

```vim
let g:airline_section_y = '%{LineNoIndicator()}'
let g:airline_section_z = '%2c'
```

## Configuration

```vim
" Default
let g:line_no_indicator_chars = ['⎺', '⎻', '⎼', '⎽', '⎯']
```

Some other examples:
```vim
let g:line_no_indicator_chars = [' ', '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█']
let g:line_no_indicator_chars = ['  ', '░ ', '▒ ', '▓ ', '█ ', '█░', '█▒', '█▓', '██']
 
```

## Before and after

Before with default vim-airline statuline:
![Before](https://imgur.com/eGutHNT.png)

After with airline settings as above:
![After](https://imgur.com/ABNW2sP.png)

Screenshots in [tilix](https://gnunn1.github.io/tilix-web/), running [neovim](https://neovim.io/) with [roboto mono](https://fonts.google.com/specimen/Roboto+Mono) font, [nord](https://github.com/arcticicestudio/nord-vim) colorscheme and [vim-airline](https://github.com/vim-airline/vim-airline) statusline.

## What people are saying about vim-line-no-indicator

> Cool. I used [noscrollbar](https://github.com/gcavallanti/vim-noscrollbar) for a long time, but sometimes wished for this approach instead.
> -- <cite>[justinmk](https://github.com/justinmk)</cite>

> I don't think it's of any use.
> -- <cite>[romainl](https://github.com/romainl)</cite>

> It's crap.
> -- <cite>[andlrc](https://github.com/andlrc) a.k.a. someone on the internet</cite>
