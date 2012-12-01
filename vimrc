set encoding=utf-8
set fileencoding=utf-8
set bomb
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" =============== Pathogen Initialization ===============
" This loads all the plugins in ~/.vim/bundle
" Use tpope's pathogen plugin to manage all other plugins
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" ================ General Config ====================
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set mat=2                       "How many tenths of a second to blink

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

"Set magic on
set magic

"show matching bracets
set showmatch

" ================ Search Settings  =================
"Ignore case when searching
set ignorecase
set smartcase        "case-sensitve only if there is a capital leter in the search expression
set incsearch        "Find the next match as we type the search
set hlsearch         "Hilight searches by default
set viminfo='100,f1  "Save up to 100 marks, enable capital marks

" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

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

" make tabs and trailing spaces visible
hi NonText ctermfg=7 guifg=gray
set list                       " Display unprintable characters
set listchars=tab:▸\ ,trail:•,extends:»,precedes:«

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1

" ================ Completion =======================
set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================
set scrolloff=6         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" Explicitly set 256 color support
set t_Co=256

set cursorline

" Set temporary directory (don't litter local dir with swp/tmp files)
set directory=/tmp

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
