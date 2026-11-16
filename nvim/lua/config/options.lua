-- Editor behavior --

local opt = vim.opt

-- UI
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.termguicolors = true
opt.showmode = false
opt.mouse = "a"
opt.guicursor = "n:hor20,v:hor20,i:ver25,c:hor20"

-- Editing
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.smartindent = true
opt.breakindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- Files
opt.swapfile = false
opt.backup = false
opt.undofile = true

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Completion
opt.completeopt = { "menu", "menuone", "noselect" }

-- Performance
opt.updatetime = 250
opt.timeoutlen = 400

-- Clipboard
opt.clipboard = "unnamedplus"

-- Scrolling
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Mouse
opt.mouse = "a"

-- Keep a syntax-engine fallback for filetypes without a Treesitter parser.
vim.cmd("syntax enable")

-- The colorscheme is applied in init.lua after plugins (e.g. dracula) are loaded.
