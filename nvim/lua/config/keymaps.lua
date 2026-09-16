local map = vim.keymap.set

local opts = { silent = true }

-- Save / quit
map("n", "<leader>w", "<cmd>write<cr>", opts)
map("n", "<leader>q", "<cmd>quit<cr>", opts)

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<cr>", opts)

-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Resize windows
map("n", "<C-Up>", "<cmd>resize +2<cr>", opts)
map("n", "<C-Down>", "<cmd>resize -2<cr>", opts)
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", opts)
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", opts)

-- Move selected lines
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Better indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Copy on selection
map("v", "<LeftRelease>", '"+y', {
    silent = true,
})

-- Ruff format
map("n", "<leader>f", function()
    require("conform").format({
        async = true,
        lsp_fallback = true,
    })
end, { desc = "Format" })
