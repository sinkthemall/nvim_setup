local conf = {
    text = {
        spinner = "dots",
        done = "✔ ",
    },
    window = {
        blend = 0,
    },
}

vim.pack.add({
    { src = gh("j-hui/fidget.nvim") },
})

require("fidget").setup(conf)
