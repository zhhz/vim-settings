 let g:neomake_warning_sign = {'text': '⚠', 'texthl': 'NeomakeWarningSign'}

" let g:neomake_python_enabled_makers = ['pep8', 'flake8', 'pyflakes', 'pylint', 'python', 'vulture', 'mypy']
" let g:neomake_python_enabled_makers = ['pep8', 'flake8', 'pyflakes', 'pylint', 'python', 'vulture']
let g:neomake_markdown_enabled_makers = ['markdownlint', 'mdl', 'proselint']
" let g:neomake_md_enabled_makers = ['markdownlint', 'mdl', 'proselint']
" let g:neomake_pandoc_enabled_makers = ['markdownlint', 'mdl', 'proselint']
" let g:neomake_vimscript_enabled_makers = ['vint']"

" let g:neomake_typescript_tsc_maker = {
  " \ 'args': ['--project', getcwd(), '--noEmit'],
  " \ 'append_file': 0,
  " \ 'errorformat':
  " \   '%E%f %#(%l\,%c): error %m,' .
  " \   '%E%f %#(%l\,%c): %m,' .
  " \   '%Eerror %m,' .
  " \   '%C%\s%\+%m'
" \}

" let g:neomake_typescript_tslint_maker ={
  " \ 'args': [
      " \ '%:p', '--format verbose', '--stdin', '--stdin-filename'
  " \ ],
  " \ 'errorformat': '%f[%l\, %c]: %m'
  " \ }

" let g:neomake_markdown_alex_maker = {
              " \ 'errorformat': '%f\ %n%m'
  " \}

" " let &efm = '%E%f:%l:%c\,%n: %m,%Z%m'
" let g:neomake_typescript_enabled_makers = ['tsc']
" let g:neomake_markdown_enabled_makers = ['alex']
" let g:neomake_javascript_enabled_makers = ['eslint', 'flow']


let g:neomake_elixir_mix_maker = {
          \ 'exe': 'mix',
          \ 'args': ['compile', '%:p', '--warnings-as-errors'],
          \ 'errorformat':
          \ '** %s %f:%l: %m,' .
          \ '%f:%l: warning: %m'
          \ }

let g:neomake_elixir_lint_maker = {
      \ 'exe': 'mix',
      \ 'args': ['credo', 'list', '%:p', '--one-line', '-i', 'readability'],
      \ 'errorformat': '[%t] %. %f:%l:%c %m'
      \ }

let g:neomake_elixir_enabled_makers = ['mix', 'lint']
let g:neomake_open_list = 2
let g:neomake_list_height = 4
let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1
let g:neomake_verbose = 2

autocmd BufWritePost *.ex Neomake
autocmd BufWritePost *.exs Neomake

autocmd! BufWritePost * Neomake
