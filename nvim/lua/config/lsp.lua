-- LSP configuration
--   behavior
--   keymaps
--   enabling individual LSP server configuration in 'after/lsp/*'

local group = vim.api.nvim_create_augroup("UserLsp", {})

vim.api.nvim_create_autocmd("LspAttach", {
    group = group,

    callback = function(event)
        local opts = {
            buffer = event.buf,
            silent = true,
        }

        local map = vim.keymap.set

        map("n", "gd", vim.lsp.buf.definition, opts)
        map("n", "gD", vim.lsp.buf.declaration, opts)
        map("n", "gr", vim.lsp.buf.references, opts)
        map("n", "gi", vim.lsp.buf.implementation, opts)

        map("n", "K", vim.lsp.buf.hover, opts)

        map("n", "<leader>rn", vim.lsp.buf.rename, opts)
        map("n", "<leader>ca", vim.lsp.buf.code_action, opts)

        map("n", "<leader>d", vim.diagnostic.open_float, opts)
        map("n", "[d", vim.diagnostic.goto_prev, opts)
        map("n", "]d", vim.diagnostic.goto_next, opts)
    end,
})

vim.lsp.enable({
    "pyright",
    "ruff",
})
