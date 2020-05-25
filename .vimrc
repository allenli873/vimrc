let mapleader = " "
set number relativenumber
set nocompatible
filetype plugin indent on

syntax on

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent nowrap

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

inoremap jk <esc>
inoremap <esc> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
inoremap <S-Tab> <C-d>

" Smart Indentation
function! IndentWithA()
    if len(getline('.')) == 0
        return "ddko"
    else
        return "A"
    endif
endfunction
nnoremap <expr> A IndentWithA()

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
call plug#end()

colorscheme sublimemonokai
let g:lightline = {
      \ 'colorscheme': 'monokai_tasty',
      \ }

