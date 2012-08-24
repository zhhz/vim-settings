" for macvim
if has("gui_running")
  " set the alt/option key on Mac to Meta
  set macmeta

  " remove macvim the tool bar
  set guioptions-=T

  " set background=dark
  " colorscheme solarized

  " Show tab number (useful for Cmd-1, Cmd-2.. mapping)
  " For some reason this doesn't work as a regular set command,
  " (the numbers don't show up) so I made it a VimEnter event
  " autocmd VimEnter * set guitablabel=%N:\ %t\ %M

  set lines=60
  set columns=190

  " set guifont=Inconsolata:h20,Monaco:h17
  " set guifont=Monaco:h12
  set guifont=DejaVu\ Sans\ Mono:h12
else
  colorscheme solarized
  set background=dark
endif
