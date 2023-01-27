" Vim Key Bindings (START)
let mapleader = ','

inoremap jk <Esc>

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

nnoremap <c-p> :FZF<cr>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nnoremap <TAB>   :call SmartTab('bn')<cr>
nnoremap <S-TAB> :call SmartTab('bp')<cr>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>q :bd<cr>
nmap <leader>ss :source %<cr>
" Vim Key Bindings (END)

"-------------------------------------------------------------------------------------------------"

" VimPlug (START)
call plug#begin()
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
call plug#end()
" VimPlug (END)

"-------------------------------------------------------------------------------------------------"
