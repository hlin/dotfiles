-- Install plugins --

vim.pack.add({
    {
        src = "https://github.com/neovim/nvim-lspconfig",
    },
    {
        -- language parser
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
    },
    {
        -- formatter
        src = "https://github.com/stevearc/conform.nvim",
    },
    {
        -- fuzzy finder
        src = "https://github.com/nvim-telescope/telescope.nvim",
    },
    {
        -- required by telescope
        src = "https://github.com/nvim-lua/plenary.nvim",
    },
    {
        -- theme
        src = "https://github.com/dracula/vim",
        name = "dracula-theme",
    },
})
