
" Fix weird backspace behavior
set backspace=indent,eol,start

" Sensible screen splitting defaults
set splitbelow
set splitright

" Indentation
setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType typescript setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType js setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType jsx setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType ts setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType tsx setlocal ts=2 sts=2 sw=2 expandtab
autocmd BufEnter *.tsx setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType scss setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType c setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType java setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType cpp setlocal ts=4 sts=4 sw=4 expandtab

set clipboard=unnamed

" Add shebang by default
augroup Shebang
  autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python3\<nl>\"|$
  autocmd BufNewFile *.rb 0put =\"#!/usr/bin/env ruby\<nl># -*- coding: None -*-\<nl>\"|$
  autocmd BufNewFile *.tex 0put =\"%&plain\<nl>\"|$
  autocmd BufNewFile *.\(cc\|hh\) 0put =\"//\<nl>// \".expand(\"<afile>:t\").\" -- \<nl>//\<nl>\"|2|start!
augroup END
