execute pathogen#infect()
syntax on
filetype plugin indent on
set nocompatible
set tabstop=2
set shiftwidth=2
set expandtab
:set iskeyword-=\/
"colorscheme mydelek
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
"let vim_markdown_preview_github=1
"let vim_markdown_preview_use_xdg_open=1
"let vim_markdown_preview_browser='chromium'
"let vim_markdown_preview_toggle=3
let g:paredit_electric_return=0
let g:clj_fmt_autosave = 0
let g:beacon_minimal_jump = 1
let g:copilot_enabled = 0
let g:VtrUseVtrMaps = 1
let g:VtrStripLeadingWhitespace = 1
let g:VtrClearEmptyLines = 1
"nnoremap <silent> ff :Cljfmt<CR> 
"nnoremap <silent> ff :w<CR> <bar> :%!cljfmt2 "$(cat %)"<CR> <bar> :w<CR>
"nnoremap <silent> ff :%!cljfmt3<CR>
nnoremap <silent> cpf :autocmd BufWritePost *.clj :Require<CR>
"nnoremap <silent> ff :let curw=winsaveview()<CR><bar>:%!cljfmt<CR><bar>:write<CR><bar>:call winrestview(curw)<CR>
nnoremap <silent> ff :let curw=winsaveview()<CR><bar>:%!cljfmt fix --remove-multiple-non-indenting-spaces<CR><bar>:write<CR><bar>:call winrestview(curw)<CR>
:map fi :execute ":Ag " . expand("<cword>")<CR>
:map ag :execute ":Ag "<CR>
"nnoremap <silent> fi :execute ":Ag " . expand("<cword>")
"augroup Clojure
"  autocmd BufWritePost *.clj :Require 
"augroup END
nnoremap <silent> cps :%!cli-sql-formatter -u -n 1<CR>
nnoremap <silent> cpa :Require<CR>
inoremap jj <Esc>
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
if &diff
  colorscheme koehler
endif
