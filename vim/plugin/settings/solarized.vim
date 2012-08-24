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
