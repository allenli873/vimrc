" Setting up path
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" Currently using space as my leader
let mapleader = " "

set number relativenumber
set clipboard=unnamed
set nocompatible
filetype plugin indent on

syntax on

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent nowrap

" Enabling use of the mouse
set mouse=a

" Smart Indentation
function! IndentWithA()
    if len(getline('.')) == 0
        return "ddko"
    else
        return "A"
    endif
endfunction
nnoremap <expr> A IndentWithA()

function! IndentWitha()
    if len(getline('.')) == 0
        return "ddko"
    else
        return "a"
    endif
endfunction
nnoremap <expr> a IndentWitha()

" Extra settings for LaTeX
autocmd BufEnter *.tex setlocal spell
autocmd BufEnter *.tex set spelllang=nl,en_gb
autocmd BufEnter *.tex inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

set conceallevel=1
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

