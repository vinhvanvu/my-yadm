" Line number settings
set number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Vim Key Bindings (START)
let mapleader = ','

inoremap jk <Esc>

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <C-p> :FZF<CR>

nnoremap <silent> <A-h> <Cmd>BufferPrevious<CR>
nnoremap <silent> <A-l> <Cmd>BufferNext<CR>

nnoremap <silent> <A-H> <Cmd>BufferMovePrevious<CR>
nnoremap <silent> <A-L> <Cmd>BufferMoveNext<CR>

nnoremap <silent> <A-x> <Cmd>BufferClose<CR>
nnoremap <silent> <A-X> <Cmd>BufferCloseAllButPinned<CR>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>q :bd<cr>
nmap <leader>ss :source %<cr>
" Vim Key Bindings (END)

"-------------------------------------------------------------------------------------------------"

" VimPlug (START)
call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'tpope/vim-sleuth'
Plug 'github/copilot.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'romgrk/barbar.nvim'

Plug 'junegunn/fzf', { 'on': 'FZF' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

call plug#end()
" VimPlug (END)

"-------------------------------------------------------------------------------------------------"

lua << EOF
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
-- vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

local nvim_tree_events = require('nvim-tree.events')
local bufferline_api = require('bufferline.api')

local function get_tree_size()
  return require'nvim-tree.view'.View.width
end

nvim_tree_events.subscribe('TreeOpen', function()
  bufferline_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('Resize', function()
  bufferline_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('TreeClose', function()
  bufferline_api.set_offset(0)
end)
EOF

colorscheme catppuccin

let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\}

let g:ale_fix_on_save = 1
