"Set mapleader
let mapleader = ","

"Fast reloading of the .vimrc
map <leader>s :source ~/.vimrc<cr>
"Fast editing of .vimrc
map <leader>e :e! ~/.vimrc<cr>
"When .vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc


"Fast saving
nmap <leader>w :w!<cr>
" If I forgot to sudo vim a file, do that with :w!!
cmap w!! %!sudo tee > /dev/null %

" Smart way to move btw. windows
" CTRL + j/k/h/l
" map <C-j> <C-W>j
" map <C-k> <C-W>k
" map <C-h> <C-W>h
" map <C-l> <C-W>l
" ==============================
" Window/Tab/Split Manipulation
" ==============================
" Move between split windows by using the four directions H, L, I, N
" (note that  I use I and N instead of J and K because  J already does
" line joins and K is mapped to GitGrep the current word
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-l> <C-w>l
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-j> <C-w>j

" Moving line up/down  META + j/k  Under iTerm, 
" map the left option key to META
nmap <M-j> mz:m+<cr>z
nmap <M-k> mz:m-2<cr>z
vmap <M-k> :m'<-2<cr>>my`<mzgv`yo`z
vmap <M-j> :m'>+<cr><my`>mzgv`yo`z

"Paste toggle - when pasting something in, don't indent.
set pastetoggle=<F5>

"Move back and forth through previous and next buffers
"with ,z and ,x
nnoremap <silent> ,z :bp<CR>
nnoremap <silent> ,x :bn<CR>

