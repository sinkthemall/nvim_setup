local conf = {}

vim.pack.add({
    { src = gh("nvim-mini/mini.nvim"), version = "main" },
})

require("mini.move").setup(conf)
