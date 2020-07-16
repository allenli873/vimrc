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

map <silent> <C-n> :NERDTreeToggle<CR>
nmap <silent> <Leader>t :TagbarToggle<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <silent> <Leader>h :noh<CR>
nnoremap <Leader>rf gg=G<C-O>
" Window Resizing with arrow
nnoremap <silent> <left> :CmdResizeLeft<cr>
nnoremap <silent> <down> :CmdResizeDown<cr>
nnoremap <silent> <up> :CmdResizeUp<cr>
nnoremap <silent> <right> :CmdResizeRight<cr>

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
Plug 'preservim/nerdtree'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'ErichDonGubler/python-syntax', { 'for': 'python' }
Plug 'tpope/vim-sensible'
Plug 'breuckelen/vim-resize'
Plug 'preservim/nerdcommenter'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'majutsushi/tagbar'
" LaTeX Plugins
Plug 'lervag/vimtex'
Plug 'KeitaNakamura/tex-conceal.vim'
Plug 'sirver/ultisnips'
call plug#end()

" LaTeX config
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

autocmd BufEnter *.tex setlocal spell
autocmd BufEnter *.tex set spelllang=nl,en_gb
autocmd BufEnter *.tex inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

set conceallevel=1
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none

" Snippets
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

" Fuzzy Finder
set rtp+=/usr/local/opt/fzf

set t_Co=256   " This is may or may not needed.

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"set background=dark
set cursorline
"set background=dark
autocmd BufEnter * colorscheme onehalfdark
let g:airline_theme='onehalfdark'
" Competitive Programmming
autocmd BufEnter *.cpp colorscheme sublimemonokai

" autofills new C++ files with template
" autocmd BufNewFile *.cpp 0r ~/template.cpp
" F5 to compile
autocmd filetype cpp nnoremap <F5> :w <bar> !g++ -g -O0 -Wall -Wextra -Wno-unused-variable -Wshadow -Wfloat-equal -Wconversion -fsanitize=address -fsanitize=undefined -fno-sanitize-recover=all -std=c++11 -o %:r %:r.cpp <CR>
" F6 to compile with g++-9
autocmd filetype cpp nnoremap <F6> :w <bar> !g++-9 -g -O2 -Wall -Wno-unused-variable -Wno-parentheses -fsanitize=address -fsanitize=undefined -std=c++11 -o %:r %:r.cpp <CR>
" Leader ct to save and test
autocmd filetype cpp nnoremap <leader>ct :w <bar> !cf test <CR>
" Leader cs to submit
autocmd filetype cpp nnoremap <leader>cs :w <bar> !cf submit <CR>
