autocmd! BufWritePost * Neomake

let g:neomake_serialize = 0
let g:neomake_verbose = 0
let g:neomake_list_height = 20
" let g:neomake_python_enabled_makers = ['pep8', 'flake8', 'pyflakes', 'pylint', 'python', 'vulture', 'mypy']
" let g:neomake_python_enabled_makers = ['pep8', 'flake8', 'pyflakes', 'pylint', 'python', 'vulture']
let g:neomake_markdown_enabled_makers = ['markdownlint', 'mdl', 'proselint']
" let g:neomake_md_enabled_makers = ['markdownlint', 'mdl', 'proselint']
" let g:neomake_pandoc_enabled_makers = ['markdownlint', 'mdl', 'proselint']
" let g:neomake_vimscript_enabled_makers = ['vint']"
