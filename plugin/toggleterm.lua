local conf = {
    open_mapping = [[<M-t>]],
    shade_terminals = false,
    close_on_exit = true,
    direction = "float",
    persist_size = false,
    persist_mode = false,
    shell = vim.o.shell,
    float_opts = {
        border = "rounded",
        title_pos = "center",
        width = function()
            return math.floor(vim.o.columns * 0.7)
        end,
        height = function()
            return math.floor(vim.o.lines * 0.7)
        end,
        winblend = 0,
    },
}

vim.pack.add({
    { src = gh("akinsho/toggleterm.nvim"), version = "main" },
})

require("toggleterm").setup(conf)
