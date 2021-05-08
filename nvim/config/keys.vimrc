" Window Resizing with arrow
nnoremap <silent> <left> :CmdResizeLeft<cr>
nnoremap <silent> <down> :CmdResizeDown<cr>
nnoremap <silent> <up> :CmdResizeUp<cr>
nnoremap <silent> <right> :CmdResizeRight<cr>

" Using jk to escape
inoremap jk <esc>
inoremap <esc> <nop>
inoremap <S-Tab> <C-d>

" Easy window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Pulls up NERDTree
map <silent> <C-n> :NERDTreeToggle<CR>
" Pulls up Tagbar
nmap <silent> <Leader>t :TagbarToggle<CR>

" Rebinding for clipboard plugin
nnoremap gm m
" Easy unhighlighting
nnoremap <silent> <Leader>h :noh<CR>

" Vimspector settings
nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dx :VimspectorReset<CR>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput

" Refactoring Variables
nmap <leader>rn <Plug>(coc-rename)

" F5 to compile with clang for debugging
autocmd filetype cpp nnoremap <F5> :w <bar> !clang++ -g -O0 -Wno-unused-variable -Wshadow -Wfloat-equal -fsanitize=address -fsanitize=undefined -fno-sanitize-recover=all -std=c++17 -o %:r %:r.cpp <CR>

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
