" function! s:goyo_enter()
"   ...
" endfunction

" function! s:goyo_leave()
"   ...
" endfunction

" autocmd! User GoyoEnter call <SID>goyo_enter()
" autocmd! User GoyoLeave call <SID>goyo_leave()

" Mappings to make Vim more friendly towards presenting slides.
autocmd BufNewFile,BufRead *.slide call SetVimPresentationMode()
function SetVimPresentationMode()
  nnoremap <buffer> <Right> :n<CR>
  nnoremap <buffer> <Left> :N<CR>

  if !exists('#goyo')
    Goyo
  endif
endfunction

