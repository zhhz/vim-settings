" Make nerdtree look nice
map <F2> :NERDTreeToggle<cr>

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 0
let g:NERDTreeWinSize = 30
let NERDTreeShowHidden=1

let NERDTreeIgnore=['\~$', '\.DS_Store']
let NERDTreeChDirMode=2
