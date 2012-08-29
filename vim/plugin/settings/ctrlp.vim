let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'

" Default to filename searches
" let g:ctrlp_by_filename = 1

" Set the maximum height of the match window: >
let g:ctrlp_max_height = 15

" We don't want to use Ctrl-p as the mapping because
" it interferes with YankRing (paste, then hit ctrl-p)
let g:ctrlp_map = ',t'
nnoremap <silent> ,t :CtrlPMixed<CR>

" Cmd-Shift-P to clear the cache
nnoremap <silent> <D-P> :ClearCtrlPCache<cr>
