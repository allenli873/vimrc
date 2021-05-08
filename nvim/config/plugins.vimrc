" Plugins
call plug#begin('~/.vim/plugged')
Plug 'svermeulen/vim-easyclip'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-sensible'
Plug 'breuckelen/vim-resize'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'majutsushi/tagbar'
Plug 'bfrg/vim-cpp-modern'
Plug 'tpope/vim-commentary'
" Colors
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" LaTeX Plugins
Plug 'lervag/vimtex'
Plug 'KeitaNakamura/tex-conceal.vim'
Plug 'sirver/ultisnips'
" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Autocomplete/Linting
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Auto pair
Plug 'jiangmiao/auto-pairs'
" Graphical Debugging
Plug 'puremourning/vimspector'
call plug#end()

" Vimspector Settings
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-go', 'CodeLLDB' ]

let g:EasyClipAutoFormat=1
" LaTeX config
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

" Snippets
let g:UltiSnipsExpandTrigger = '`'
let g:UltiSnipsJumpForwardTrigger = '`'
let g:UltiSnipsJumpBackwardTrigger = '~'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

" Fuzzy Finder
set rtp+=/usr/local/opt/fzf
source ~/.vim/fzf.vim

set t_Co=256   " This is may or may not needed.

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=dark
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

let g:airline_theme='gruvbox-dark'
