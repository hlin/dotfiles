-- Richer Treesitter and LSP semantic-token colours, based on Dracula's palette.
-- These are reapplied after any :colorscheme command so a theme switch does not
-- leave stale links behind.
local palette = {
    foreground = "#f8f8f2",
    comment = "#6272a4",
    red = "#ff5555",
    orange = "#ffb86c",
    yellow = "#f1fa8c",
    green = "#50fa7b",
    purple = "#bd93f9",
    cyan = "#8be9fd",
    pink = "#ff79c6",
}

local function apply()
    local hl = vim.api.nvim_set_hl
    local groups = {
        ["@comment"] = { fg = palette.comment, italic = true },
        ["@comment.documentation"] = { fg = "#7386b8", italic = true },
        ["@keyword"] = { fg = palette.pink, bold = true },
        ["@keyword.function"] = { fg = palette.pink, bold = true },
        ["@keyword.return"] = { fg = palette.pink, bold = true },
        ["@conditional"] = { fg = palette.pink, bold = true },
        ["@repeat"] = { fg = palette.pink, bold = true },
        ["@exception"] = { fg = palette.pink, bold = true },
        ["@include"] = { fg = palette.pink },
        ["@operator"] = { fg = palette.pink },
        ["@function"] = { fg = palette.green, bold = true },
        ["@function.call"] = { fg = palette.green },
        ["@function.method"] = { fg = palette.green, bold = true },
        ["@function.method.call"] = { fg = palette.green },
        ["@constructor"] = { fg = palette.cyan, bold = true },
        ["@type"] = { fg = palette.cyan, italic = true },
        ["@type.builtin"] = { fg = palette.cyan, bold = true },
        ["@type.definition"] = { fg = palette.cyan, bold = true },
        ["@variable"] = { fg = palette.foreground },
        ["@variable.builtin"] = { fg = palette.purple, italic = true },
        ["@variable.parameter"] = { fg = palette.orange, italic = true },
        ["@property"] = { fg = palette.cyan },
        ["@field"] = { fg = palette.cyan },
        ["@constant"] = { fg = palette.purple, bold = true },
        ["@constant.builtin"] = { fg = palette.purple, bold = true },
        ["@string"] = { fg = palette.yellow },
        ["@string.escape"] = { fg = palette.pink, bold = true },
        ["@string.special"] = { fg = palette.purple, bold = true },
        ["@character"] = { fg = palette.yellow },
        ["@number"] = { fg = palette.purple },
        ["@boolean"] = { fg = palette.purple, bold = true },
        ["@punctuation.bracket"] = { fg = "#f8f8f2" },
        ["@punctuation.delimiter"] = { fg = "#f8f8f2" },
        ["@tag"] = { fg = palette.pink, bold = true },
        ["@tag.attribute"] = { fg = palette.green },
        ["@tag.delimiter"] = { fg = palette.pink },
        ["@markup.heading"] = { fg = palette.purple, bold = true },
        ["@markup.link"] = { fg = palette.cyan, underline = true },
        ["@markup.link.label"] = { fg = palette.green },
        ["@markup.raw"] = { fg = palette.yellow },
        ["@diff.plus"] = { fg = palette.green },
        ["@diff.minus"] = { fg = palette.red },
        ["@lsp.type.class"] = { fg = palette.cyan, bold = true },
        ["@lsp.type.enum"] = { fg = palette.cyan, bold = true },
        ["@lsp.type.interface"] = { fg = palette.cyan, italic = true },
        ["@lsp.type.namespace"] = { fg = palette.cyan },
        ["@lsp.type.parameter"] = { fg = palette.orange, italic = true },
        ["@lsp.type.property"] = { fg = palette.cyan },
        ["@lsp.type.variable"] = { fg = palette.foreground },
        ["@lsp.type.function"] = { fg = palette.green, bold = true },
        ["@lsp.type.method"] = { fg = palette.green, bold = true },
        ["@lsp.type.macro"] = { fg = palette.pink, bold = true },
        ["@lsp.type.decorator"] = { fg = palette.yellow },
        ["@lsp.type.enumMember"] = { fg = palette.purple, bold = true },
        ["@lsp.mod.deprecated"] = { strikethrough = true, fg = palette.comment },
        ["@lsp.mod.readonly"] = { fg = palette.purple, bold = true },
    }

    for name, opts in pairs(groups) do
        hl(0, name, opts)
    end
end

local group = vim.api.nvim_create_augroup("UserHighlights", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
    group = group,
    callback = apply,
})

apply()
