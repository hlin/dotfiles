return {
    cmd = { "pyright-langserver", "--stdio" },

    filetypes = {
        "python",
    },

    root_markers = {
        "pyproject.toml",
        "uv.lock",
        ".git",
    },
}
