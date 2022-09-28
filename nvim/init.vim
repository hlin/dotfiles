" ====== NeoVim configuration ======
"
" It's recommended to install one patched fonts for telescope, bufferline, etc
" https://github.com/ryanoasis/nerd-fonts for example FiraCode
" ==================================

" Install vim-plug https://github.com/junegunn/vim-plug automatically
if empty(glob($HOME.'/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install plugins
call plug#begin()
"" A library provides lua functions used by many plugins
Plug 'nvim-lua/plenary.nvim'

"" File explorer
Plug 'kyazdani42/nvim-tree.lua'

"" Fuzzy finder
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

"" Color scheme
Plug 'dracula/vim', {'as': 'dracula-theme'}

"" Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"" Syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"" Bufferline
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'kyazdani42/nvim-web-devicons'

"" Reopen files at your last edit position
Plug 'farmergreg/vim-lastplace'

"" Tag viewer
"" Requires universal-ctags `brew install universal-ctags`
Plug 'preservim/tagbar'

"" Comment stuff out
Plug 'tpope/vim-commentary'

"" Manage terminal windows
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
call plug#end()

lua require("bufferline").setup()

lua require("nvim-tree").setup()

" coc configuration
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-html', 'coc-css', 'coc-pyright', '@yaegassy/coc-ansible']

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" coc configuration end

" treesitter configuration
lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "python", "json", "jsonc", "html", "go", "yaml" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

" toggleterm configuration
lua <<EOF
require("toggleterm").setup{
  size = 20,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "float",
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "curved",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
}
function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
EOF

" common settings
set guicursor=a:hor1-blinkwait100-blinkoff100-blinkon100
set termguicolors
set hlsearch
set incsearch
set ignorecase
set nu
set ai
set ts=4
set sw=4
set sts=4
set et
set list
set listchars=tab:>-,trail:.
set backspace=2
set nofoldenable
set relativenumber

autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype jade setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype htmldjango setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype eruby setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2
autocmd BufRead,BufNewFile Jenkinsfile,*.Jenkinsfile set filetype=groovy

colorscheme dracula

" Key mapping
let mapleader=" "
"" normal mode
nnoremap Q :q<CR>
nnoremap S :w<CR>
nnoremap <C-a> <Home>
nnoremap <C-e> <End>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>nt :NvimTreeToggle<CR>
nnoremap <leader>tb :TagbarToggle<CR>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"" insert mode
inoremap <C-a> <Home>
inoremap <C-e> <End>
