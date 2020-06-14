let mapleader = " "
set number relativenumber
set nocompatible
filetype plugin indent on

syntax on

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent nowrap

set mouse=a

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

map <C-n> :NERDTreeToggle<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <S-Tab> <<
nnoremap <Leader>h :noh<CR>
nnoremap <Leader>rf gg=G<C-O>
" Window Resizing with arrow
nnoremap <silent> <left> :CmdResizeLeft<cr>
nnoremap <silent> <down> :CmdResizeDown<cr>
nnoremap <silent> <up> :CmdResizeUp<cr>
nnoremap <silent> <right> :CmdResizeRight<cr>
" Until I find a good use for s this stays here
nnoremap s ^
nnoremap S $
" For local replace
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>

" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>

inoremap jk <esc>
inoremap <esc> <nop>
inoremap <S-Tab> <C-d>
inoremap {<CR> {<CR>}<Esc>ko

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

" Plugins

call plug#begin('~/.vim/plugged')
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'preservim/nerdtree'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'itchyny/lightline.vim'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'ErichDonGubler/python-syntax', { 'for': 'python' }
Plug 'gabrielelana/vim-markdown'
Plug 'tpope/vim-sensible'
Plug 'breuckelen/vim-resize'
Plug 'preservim/nerdcommenter'
call plug#end()

colorscheme sublimemonokai
let g:lightline = {
            \ 'colorscheme': 'monokai_tasty',
            \ }

" Competitive Programmming

" autofills new C++ files with template
" autocmd BufNewFile *.cpp 0r ~/template.cpp
" F5 to compile
autocmd filetype cpp nnoremap <F5> :w <bar> !g++ -g -O0 -Wall -Wextra -Wno-unused-variable -Wshadow -Wfloat-equal -Wconversion -fsanitize=address -fsanitize=undefined -fno-sanitize-recover=all -std=c++17 -o %:r %:r.cpp <CR>
" Leader ct to save and test
autocmd filetype cpp nnoremap <leader>ct :w <bar> !cf test <CR>
" Leader cs to submit
autocmd filetype cpp nnoremap <leader>cs :w <bar> !cf submit <CR>
