" close the buffer, but do not close the window
map <leader>bd :Bclose<cr>

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()

function! <SID>BufcloseCloseIt()
  let l:currentBufNum = bufnr("%")
  let l:alternateBufNum = bufnr("#")

  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif

  if bufnr("%") == l:currentBufNum
    new
  endif

  if buflisted(l:currentBufNum)
    execute("bdelete! ".l:currentBufNum)
  endif
endfunction

" create <%= foo %> erb tags using Ctrl-k in edit mode
imap <silent> <C-K> <%=   %><Esc>3hi

" create <%= foo %> erb tags using Ctrl-j in edit mode
imap <silent> <C-J> <%  %><Esc>2hi

" toggle colored right border after 120 chars
set colorcolumn=120
let s:color_column_old = 0

function! s:ToggleColorColumn()
    if s:color_column_old == 0
        let s:color_column_old = &colorcolumn
        windo let &colorcolumn = 0
    else
        windo let &colorcolumn=s:color_column_old
        let s:color_column_old = 0
    endif
endfunction
map <F6> :call <SID>ToggleColorColumn()<cr>



""""""""""""""""""""""""""""""
" Statusline
""""""""""""""""""""""""""""""
"Always hide the statusline
set laststatus=2

function! CurDir()
  let curdir = substitute(getcwd(), '/Users/zhonghai/', "~/", "g")
  return curdir
endfunction

function! RvmStatusLine()
  if ! exists('g:rvm_prompt')
    let g:rvm_prompt = system("~/.rvm/bin/rvm-prompt v g")
    let g:rvm_prompt = substitute(g:rvm_prompt, '\n', '', 'g')
  endif
  return '['.g:rvm_prompt.']'
endfunction

"Format the statusline
"set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c
"set statusline=\ %F%m%r%h\ %w\ Line:\ %l/%L:%c
" set statusline=\ %F%m%r%h\ %w%{fugitive#statusline()}\ Line:\ %l/%L:%c
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=\ %{RvmStatusLine()}
" set statusline+=%*
"set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
"
if has('statusline')
  set statusline=%<%f\ 
  set statusline+=%w%h%m%r 
  "set statusline+=\ [%{&ff}/%Y]  
  "set statusline+=\ [%{getcwd()}]
  " set statusline+=\ [%{CurDir()}]
  " set statusline+=%{fugitive#statusline()}
  " set statusline+=\ %{RvmStatusLine()}
  " set statusline+=%=%-14.(Line:\ %l\ of\ %L\ [%p%%]\ -\ Col:\ %c%V%)
  set statusline+=%=%-14.(Line:\ %l\/\%L\ -\ Col:\ %c%V%)
endif
