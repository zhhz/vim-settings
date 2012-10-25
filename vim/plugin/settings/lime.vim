""""""""""""""""""""""""""""""
" screen: slime.vim
""""""""""""""""""""""""""""""
function Send_to_Screen(text)
  if !exists("g:screen_sessionname") || !exists("g:screen_windowname")
    call Screen_Vars()
  end

  echo system("screen -S " . g:screen_sessionname . " -p " . g:screen_windowname . " -X stuff '" . substitute(a:text, "'", "'\\\\''", 'g') . "'")
endfunction

function Screen_Session_Names(A,L,P)
  return system("screen -ls | awk '/Attached/ {print $1}'")
endfunction

function Screen_Vars()
  if !exists("g:screen_sessionname") || !exists("g:screen_windowname")
    let g:screen_sessionname = "s01"
    let g:screen_windowname = "w01"
  end

  let g:screen_sessionname = input("session name: ", g:screen_sessionname)
  let g:screen_windowname = input("window name: ", g:screen_windowname)
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tmp commented out because it confilict with dwm
"vmap <C-c><C-c> "ry :call Send_to_Screen(@r)<CR>
"nmap <C-c><C-c> vip<C-c><C-c>
"nmap <C-c>v :call Screen_Vars()<CR>
