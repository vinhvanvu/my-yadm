" Line number settings
set number
set selection=exclusive
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
autocmd FileType scss setl iskeyword+=@-@
autocmd FileType ts,tsx,js,jsx,json,css,scss autocmd BufWritePre * :%s/\s\+$//e

" Vim Key Bindings (START)
let mapleader = ','

inoremap jk <Esc>

nnoremap <C-n> :NvimTreeToggle<CR>

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>gg <cmd>Telescope live_grep<cr>
nnoremap <leader>bb <cmd>Telescope buffers<cr>
nnoremap <leader>hh <cmd>Telescope help_tags<cr>

" Tab management
nnoremap <silent> <S-TAB> <Cmd>BufferPrevious<CR>
nnoremap <silent> <TAB> <Cmd>BufferNext<CR>

nnoremap <leader>xx <cmd>BufferWipeout<CR>

" Vim configuration shortcuts
nnoremap <leader>ev :edit $MYVIMRC<cr>
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

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }
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
\   'typescript': ['prettier'],
\   'css': ['prettier'],
\}

let g:ale_fix_on_save = 1
