set ttyfast
set lazyredraw
set fileencoding=utf-8 " the encoding written to file
set encoding=utf-8 " the ncoding displayed
set bomb
set clipboard=unnamed

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" =============== Pathogen Initialization ===============
" This loads all the plugins in ~/.vim/bundle
" Use tpope's pathogen plugin to manage all other plugins
runtime bundle/vim-pathogen/autoload/pathogen.vim
" call pathogen#incubate()
call pathogen#infect('bundle/{}')
call pathogen#helptags()

" ================ General Config ====================
set ff=unix
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set complete=.,w,b,u,U,t,i,d    "Do lots of scanning on tab completion
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set gcr=a:blinkon0              "Disable cursor blink
" set mat=2                       "How many tenths of a second to blink
set nobomb                      "get rid of <U+FEFF> that is the BOM of UTF8 files
set autowrite                   "Save file when switch buffers
set autowriteall                "Save file when switch buffers
au FocusLost * update           "Update writes only when the file is actually changed

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax enable

"Set magic on
set magic

"show matching bracets
set showmatch

" viminfo: remember certain things when we exit
" (http://vimdoc.sourceforge.net/htmldoc/usr_21.html)
"   %    : saves and restores the buffer list
"   '100 : marks will be remembered for up to 30 previously edited files
"   /100 : save 100 lines from search history
"   h    : disable hlsearch on start
"   "500 : save up to 500 lines for each register
"   :100 : up to 100 lines of command-line history will be remembered
"   n... : where to save the viminfo files
set viminfo=%100,'100,/100,h,\"500,:100,n~/.vim/viminfo
" set viminfo='100,/100,h,\"500,:100,n~/.vim/viminfo " I don't want to remember the buffers, I'm using the mks command

" ================ Search Settings  =================
"Ignore case when searching
set ignorecase
set smartcase        "case-sensitve only if there is a capital leter in the search expression
set incsearch        "Find the next match as we type the search
set hlsearch         "Hilight searches by default

" ================ Turn Off Swap Files ==============
" Set temporary directory (don't litter local dir with swp/tmp files)
set directory=/tmp
set noswapfile
set nobackup
set nowb " no write backup

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
" silent !mkdir ~/.vim/undos > /dev/null 2>&1
" set undodir=~/.vim/undos
" set undofile

" ================ Indentation ======================
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" changes non printing characters to a visible character that's configured in listchars
set list                       " Display unprintable characters
" make tabs and trailing spaces visible
" set listchars=tab:▸\ ,trail:•,extends:»,precedes:«,eol:¶
" set listchars=tab:>-,eol:¶
set listchars=tab:»·,trail:·
hi NonText ctermfg=7 guifg=gray

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1

" ================ Completion =======================
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildmode=list:longest
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================
set scrolloff=6         "Start scrolling when we're 6 lines away from margins
set sidescrolloff=15
set sidescroll=1

" Explicitly set 256 color support
set t_Co=256

" have to disable it, otherwise the performace is bad
" set cursorline

" integrate ack and vim by using the :grep function of vim
set grepprg=ack

"The commandbar is 2 high
set cmdheight=1

" ==== mouse settings ===============================
"Have the mouse enabled all the time:
set mouse=a
" hide the mouse when typing
set mousehide
" this makes the mouse paste a block of text without formatting it(good for code)
map <MouseMiddle> <esc>"*p">>"

" external program to use for "=" command,
" for a .json file, just type gg==G
" to pretty format your JSON type of file
au FileType json setlocal equalprg=python\ -m\ json.tool

" ====== TAG JUMPING ================================
" Create the 'tags' file (may need to install ctags first, $ brew install ctags
command! MakeTags !ctags -R .

" Switch spell checking language
command! American :set spelllang=en_us
autocmd BufEnter *.png,*.jpg,*gif exec "! ~/.iterm2/imgcat ".expand("%") | :bw

