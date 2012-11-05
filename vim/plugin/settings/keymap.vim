"Set mapleader
let mapleader = ","

" map ii to esc
imap ii <C-[>
cmap ii <C-[>

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

" ==============================
" Window/Tab/Split Manipulation
" ==============================
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-l> <C-w>l
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-j> <C-w>j

" Under iterm,  map the left option key to META
" Resize windows with u,i,o and p
nnoremap <M-j> <C-w>-
nnoremap <M-k> <C-w>+
nnoremap <M-h> <C-w><
nnoremap <M-l>  <C-w>>

" commented out it's conflict with the one above
" Moving line up/down  META + j/k
" nmap <M-j> mz:m+<cr>z
" nmap <M-k> mz:m-2<cr>z
" vmap <M-k> :m'<-2<cr>>my`<mzgv`yo`z
" vmap <M-j> :m'>+<cr><my`>mzgv`yo`z

"Paste toggle - when pasting something in, don't indent.
set pastetoggle=<F5>

"Move back and forth through previous and next buffers
"with ,z and ,x
nnoremap <silent> ,z :bp<CR>
nnoremap <silent> ,x :bn<CR>

" map ' go to the end of the line and put it in append mode
nmap ' $a
" yank from the cursor to the end of the line
nnoremap Y y$

" ========================================
" General vim sanity improvements
" ========================================
"
" ,# Surround a word with #{ruby interpolation}
map ,# ysiw#
vmap ,# c#{<C-R>"}<ESC>

" ," Surround a word with "quotes"
map ," ysiw"
vmap ," c"<C-R>""<ESC>

" ,' Surround a word with 'single quotes'
map ,' ysiw'
vmap ,' c'<C-R>"'<ESC>

" ,) or ,( Surround a word with (parens)
" The difference is in whether a space is put in
map ,( ysiw(
map ,) ysiw)
vmap ,( c( <C-R>" )<ESC>
vmap ,) c(<C-R>")<ESC>

" ,[ Surround a word with [brackets]
map ,] ysiw]
map ,[ ysiw[
vmap ,[ c[ <C-R>" ]<ESC>
vmap ,] c[<C-R>"]<ESC>

" ,{ Surround a word with {braces}
map ,} ysiw}
map ,{ ysiw{
vmap ,} c{ <C-R>" }<ESC>
vmap ,{ c{<C-R>"}<ESC>

" gary bernhardt's hashrocket
imap <silent> <C-l> <space>=><space>
" create <%= foo %> erb tags using Ctrl-k in edit mode
imap <silent> <C-K> <%=   %><Esc>3hi
" create <%= foo %> erb tags using Ctrl-j in edit mode
imap <silent> <C-J> <%  %><Esc>2hi

"Go to last edit location with ,.
nnoremap ,. '.

"When typing a string, your quotes auto complete. Move past the quote
"while still in insert mode by hitting Ctrl-a. Example:
"
" type 'foo<c-a>
"
" the first quote will autoclose so you'll get 'foo' and hitting <c-a> will
" put the cursor right after the quote
imap <C-a> <esc>wa

"GitGrep - open up a git grep line, with a quote started for the search
nnoremap ,gg :GitGrep ""<left>
"GitGrep Current Partial
nnoremap ,gcp :GitGrepCurrentPartial<CR>
"GitGrep Current File
nnoremap ,gcf :call GitGrep(expand("%:t:r"))<CR>

" copy current filename into system clipboard - mnemonic: (c)urrent(f)ilename
" this is helpful to paste someone the path you're looking at
nnoremap <silent> ,cf :let @* = expand("%:~")<CR>
nnoremap <silent> ,cn :let @* = expand("%:t")<CR>


" Apple-* Highlight all occurrences of current word (like '*' but without moving)
" http://vim.wikia.com/wiki/Highlight_all_search_pattern_matches
nnoremap <D-*> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" Get the current highlight group. Useful for then remapping the color
map ,hi :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>
