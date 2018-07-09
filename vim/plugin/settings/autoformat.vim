" autocmd BufWritePost *.js AsyncRun -post=checktime ./composer/node_modules/eslint/bin/eslint.js --fix %
