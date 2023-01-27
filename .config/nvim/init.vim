" Vim Key Bindings (START)
let mapleader = ','

inoremap jk <Esc>

nnoremap <C-n> :NERDTreeToggle<CR>
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
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }

Plug 'junegunn/fzf', { 'on': 'FZF' }

call plug#end()
" VimPlug (END)

"-------------------------------------------------------------------------------------------------"

" Plugin Settings [FZF/RipGrep] (START)
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --ignore-case --hidden '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

nmap <leader>r "zyiw:exe"Rg ".@z.""<cr>
nmap <leader>f :call fzf#vim#files('.', {'options':'--query '.expand('<cword>')})<CR>
" Plugin Settings [FZF/RipGrep] (END)

"-------------------------------------------------------------------------------------------------"
