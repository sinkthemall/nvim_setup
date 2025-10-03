-- setup base46 (for nvchad)
vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46_cache/"




require("config.lazy")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")


-- setup nvchad ui
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")
dofile(vim.g.base46_cache .. "syntax")
dofile(vim.g.base46_cache .. "treesitter")
dofile(vim.g.base46_cache .. "telescope")

require("options")
require("mapping")
