-- Bootstrap --

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.plugins")

-- Applied here because the colorscheme ships with a plugin; it is not on the
-- runtimepath until config.plugins has run. pcall avoids a hard startup error
-- if the plugin is unavailable (e.g. offline on a fresh install).
pcall(vim.cmd.colorscheme, "dracula")

require("config.telescope")
require("config.treesitter")
require("config.highlights")
require("config.conform")
require("config.lsp")
require("config.diagnostic")
