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
" Always hide the statusline
" set laststatus=2

function! CurDir()
  let curdir = substitute(getcwd(), '/Users/zhonghai/', "~/", "g")
  return curdir
endfunction

"Format the statusline
"set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c
"set statusline=\ %F%m%r%h\ %w\ Line:\ %l/%L:%c
" set statusline=\ %F%m%r%h\ %w%{fugitive#statusline()}\ Line:\ %l/%L:%c
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
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
  " set statusline+=%=%-14.(Line:\ %l\ of\ %L\ [%p%%]\ -\ Col:\ %c%V%)
  set statusline+=%=%-14.(Line:\ %l\/\%L\ -\ Col:\ %c%V%)
endif

" Remove the Windows ^M
" noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
" this works for me:
" :%s//\r/g
" NOTE: to input , you have to press ctrl + v then followed by ctrl + m

" http://concisionandconcinnity.blogspot.com/2009/07/vim-part-ii-matching-pairs.html
"Map the auto-close for non-quotes.
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
autocmd Syntax html,vim inoremap < <lt>><Left>
" Function to check next character.
function! ClosePair(char)
  if getline('.')[col('.') - 1] == a:char
    return "\<Right>"
  else
    return a:char
  endif
endf
" Map closing characters. Now, all you need to do is link the closing characters to the function
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=ClosePair('}')<CR>
" Map the auto-close for quotes.
function! QuoteDelim(char)
  let line = getline('.')
  let col = col('.')
  if line[col - 2] == "\\"
    "Inserting a quoted quotation mark into the string
    return a:char
  elseif line[col - 1] == a:char
    "Escaping out of the string
    return "\<Right>"
  else
    "Starting a string
    return a:char.a:char."\<Left>"
  endif
endf
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>
" Enclose selection, Wrap visually selected text
vnoremap (  <ESC>`>a)<ESC>`<i(<ESC>
vnoremap )  <ESC>`>a)<ESC>`<i(<ESC>
vnoremap {  <ESC>`>a}<ESC>`<i{<ESC>
vnoremap }  <ESC>`>a}<ESC>`<i{<ESC>
vnoremap "  <ESC>`>a"<ESC>`<i"<ESC>
vnoremap '  <ESC>`>a'<ESC>`<i'<ESC>
vnoremap `  <ESC>`>a`<ESC>`<i`<ESC>
vnoremap [  <ESC>`>a]<ESC>`<i[<ESC>
vnoremap ]  <ESC>`>a]<ESC>`<i[<ESC>
"Delete pair if nothing is between them
function! InAnEmptyPair()
  let cur = strpart(getline('.'),getpos('.')[2]-2,2)
  for pair in (split(&matchpairs,',') + ['":"',"':'"])
    if cur == join(split(pair,':'),'')
      return 1
    endif
  endfor
  return 0
endf
func! DeleteEmptyPairs()
  if InAnEmptyPair()
    return "\<Left>\<Del>\<Del>"
  else
    return "\<BS>"
  endif
endfunc
inoremap <expr> <BS> DeleteEmptyPairs()


" format json
map <leader>fj :call FormatJSON()<cr>
" format json text
function! FormatJSON()
  :%!python -m json.tool
endfunction
