-- treesitter config --

require("nvim-treesitter").setup()

local parsers = {
    "lua",
    "python",
    "javascript",
    "typescript",
    "tsx",
    "json",
    "yaml",
    "toml",
    "bash",
    "html",
    "css",
    "markdown",
    "markdown_inline",
}

-- 启动时安装缺失的 parser
require("nvim-treesitter").install(parsers)

-- 打开文件时启动 Treesitter
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        pcall(vim.treesitter.start)
    end,
})
