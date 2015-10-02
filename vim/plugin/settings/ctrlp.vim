" let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|build|vendor|dist|node_modules|jspm_packages)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" let g:ctrlp_working_path_mode = 'c'
" let CtrlP scan for dotfiles and dotdirs
let g:ctrlp_show_hidden = 1

" Default to filename searches
let g:ctrlp_by_filename = 0

" We don't want to use Ctrl-p as the mapping because
" it interferes with YankRing (paste, then hit ctrl-p)
let g:ctrlp_map = ',t'
nnoremap <silent> ,t :CtrlPMixed<CR>

" Cmd-Shift-P to clear the cache
nnoremap <silent> <D-P> :ClearCtrlPCache<cr>
