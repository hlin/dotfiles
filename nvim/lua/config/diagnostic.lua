local diagnostic = vim.diagnostic

diagnostic.config({
    -- 左侧 sign column
    signs = {
        text = {
            [diagnostic.severity.ERROR] = "E",
            [diagnostic.severity.WARN] = "W",
            [diagnostic.severity.INFO] = "I",
            [diagnostic.severity.HINT] = "H",
        },
    },

    -- 代码下方/附近的虚拟提示
    virtual_text = {
        spacing = 2,
        source = "if_many",
        prefix = "●",
        current_line = true,
    },

    -- 错误位置下划线
    underline = true,

    -- 按严重程度排序
    severity_sort = true,

    -- Insert 模式不实时刷新，离开 Insert 后更新
    update_in_insert = false,

    -- 浮窗
    float = {
        border = "rounded",
        source = "if_many",
        header = "",
        prefix = function(diagnostic_item, i, total)
            return string.format("%d. ", i), "DiagnosticFloatingInfo"
        end,
    },
})

-- 下一个诊断
vim.keymap.set("n", "]d", diagnostic.goto_next, {
    desc = "Next diagnostic",
})

-- 上一个诊断
vim.keymap.set("n", "[d", diagnostic.goto_prev, {
    desc = "Previous diagnostic",
})

-- 当前行诊断
vim.keymap.set("n", "<leader>d", diagnostic.open_float, {
    desc = "Show diagnostic",
})

-- 当前文件所有诊断
vim.keymap.set("n", "<leader>dd", function()
    diagnostic.setloclist()
end, {
    desc = "Diagnostics to location list",
})
