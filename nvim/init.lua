-- Bootstrap --

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.plugins")
require("config.telescope")
require("config.treesitter")
require("config.highlights")
require("config.conform")
require("config.lsp")
require("config.diagnostic")
