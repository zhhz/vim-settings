" Make nerdtree look nice
map <F2> :NERDTreeToggle<cr>

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 0
let g:NERDTreeWinSize = 25
let NERDTreeShowHidden= 0 

let NERDTreeIgnore=['\~$', '\.DS_Store']
let NERDTreeChDirMode=2

" Disable the scrollbars (NERDTree)
set guioptions-=r
set guioptions-=L
