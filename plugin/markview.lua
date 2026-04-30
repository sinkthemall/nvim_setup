local conf = {
    preview = {
        enable = false,
        icon_provider = "devicons"
    }
}

vim.pack.add({
    { src = gh("nvim-tree/nvim-web-devicons") },
    { src = gh("OXY2DEV/markview.nvim") }
})

require("markview").setup(conf)

