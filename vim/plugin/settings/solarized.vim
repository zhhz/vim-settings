" colorscheme solarized
" set background=dark

hi! link txtBold Identifier
hi! link zshVariableDef Identifier
hi! link zshFunction Function
hi! link rubyControl Statement
hi! link rubyLocalVariableOrMethod Normal
hi! link rubyStringDelimiter Constant
hi! link rubyString Constant
hi! link rubyAccess Todo
hi! link rubySymbol Identifier
hi! link rubyPseudoVariable Type
hi! link MatchParen DiffText

" Enforce the colors set here
au VimEnter * so ~/.vim/plugin/settings/solarized.vim

" toggles the background color, using F7 in this example
function! ToggleBackground()
    if (g:solarized_style=="dark")
      let g:solarized_style="light"
    else
      let g:solarized_style="dark"
      colorscheme solarized
    endif
endfunction
command! Togbg call ToggleBackground()
" nnoremap <F7> :call ToggleBackground()<CR>
" inoremap <F7> <ESC>:call ToggleBackground()<CR>a
" vnoremap <F7> <ESC>:call ToggleBackground()<CR>
map <F7> :call ToggleBackground()<CR>
