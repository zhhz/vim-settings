1. clone the repo
2. $ vimsettings install
3. install air-line fonts
4. brew install ctags
5. $ ctags -R . NOTE: in your project folder
6. 


NOTE:
1. the ctags config
2. good reference: https://bitboxer.de/2016/11/13/vim-for-elixir/

^]    Jump to definition
^t    Jump back from definition
^W }    Preview definition
g]    See all definitions

In edit mode
^p / ^n - complete base on previous/next content

^x^] - code, auto complete (need ctag running)
^x^f - filename completion
^x^[]

^o / ^i / ^t - jump back and force


### verify the service is runing
```sh
$ pm2 list
```

You should be able see something like following:

App name │ id | mode | pid  | status | restart | uptime | cpu
--- | --- | --- | --- | --- | --- | --- | ---
mobile-middletier | 0 | cluster | 6713 | online | 0 | 4h | 0%

| Tables   |      Are      |  Cool |
|----------|:-------------:|------:|
| col 1 is |  left-aligned | $1600 |
| col 2 is |    centered   |   $12 |
| col 3 is | right-aligned |    $1 |


## Availible Routes
```GET /api/v3/philly/```
This endpoint is primarily used to get section list

```GET /api/v3/philly/home```
This endpoint is primarily used to get the home articles

```GET /api/v3/philly/[news|sports...]```
This endpoint is primarily used to get section articles


vim-settings
============
A quick settings for vim


* F2 - toggle NERDTree
    SHIFT-O - open all the folders

* F3 - toggle zoom window

* F4 - screen shell vertical

* F5 - toggle paste mode

* F6 - toggle column

* F7 - insert current date and time

* ,bd - delete current buffer

* ,be - buffer explorer

* ,bs - horizen split open

* ,bv - vertical split open

* ,rts - remove trailing space

* :sp - horizon split

* :vs - vertical split

* C-W c  or Ctrl + c - close a window

* CTRL + h/j/k/l - move between windows

" not work on iterm2
* META + h/j/k/l - resize windows with the mata/option key

* CTRL + n - stack current and open a new window and focus on it

* CTRL + space - focus on current window

* ii - in edit mode, this is mapped to ESC

* ,ig - toggle indent

* ,y  - yangk ring

* " teris game

* ,te


* " split a bash console
* ,cb

* " surround

* ,#",)([{

* "Go to last edit location with ,.

* ,.

* " the insert mode the first quote will autoclose so you'll get 'foo' and hitting <c-a> will put the cursor right after the quote

* Ctrl-a

* " show git diff gugger
* ,g


* " format json
* ,fj


* " easy motion
* ,,f<char>


* " visual find and replace
* ,fr
*   - normal model
*   - range

* " default formating
* =G

## ctrl-p
Full path fuzzy __file__, __buffer__, __mru__, __tag__, __...__ finder for Vim.
##### Once CtrlP is open:
* Press `<F5>` to purge the cache for the current directory to get new files, remove deleted files and apply new ignore options.
* Press `<c-f>` and `<c-b>` to cycle between modes.
* Press `<c-d>` to switch to filename only search instead of full path.
* Press `<c-r>` to switch to regexp mode.
* Use `<c-j>`, `<c-k>` or the arrow keys to navigate the result list.
* Use `<c-t>` or `<c-v>`, `<c-x>` to open the selected entry in a new tab or in a new split.
* Use `<c-n>`, `<c-p>` to select the next/previous string in the prompt's history.
* Use `<c-y>` to create a new file and its parent directories.
* Use `<c-z>` to mark/unmark multiple files and `<c-o>` to open them.>>>'

vim -u NONE " this will start vim without vimrc, very useful for debuging to see if you vimrc messed up
vim --noplugin " same as above

" surounding plugin
csw" - adds "" to current word
cs'" - change current word's surounding from ' to "


" jumping around tags or definitions
Ctrl-]

" ack integration
:Ack 'patter'


" zoom window
<C-W> o  " toggle
or <F3> toggle

" quick buffer switch
,z/,x go next or back buffer
