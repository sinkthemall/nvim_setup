-- Plugin's local config table
local conf = {}

vim.pack.add({
    { src = gh("nvim-tree/nvim-web-devicons") },
    { src = gh("nvim-lua/plenary.nvim") },
    { src = gh("nvchad/ui"), version = "v3.0"},
    { src = gh("nvchad/base46")}
})

require("nvchad")
require("base46").load_all_highlights()
