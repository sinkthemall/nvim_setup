local conf = {
    ensure_installed = {
        "c",
        "lua",
        "python",
        "vim",
        "html",
        -- "asm",
        "bash",
        "cpp",
        "dockerfile",
        "vimdoc",
        "luadoc",
        "markdown",
    },
    border = "single",
    highlight = true,
}

vim.pack.add({
    { src = gh("romus204/tree-sitter-manager.nvim") },
})

require("tree-sitter-manager").setup(conf)
