
-- setup nvchad ui
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")
dofile(vim.g.base46_cache .. "syntax")
-- dofile(vim.g.base46_cache .. "treesitter")
dofile(vim.g.base46_cache .. "telescope")

dofile(vim.g.base46_cache .. "lsp")
require("nvchad.lsp").diagnostic_config()
vim.diagnostic.config({
    virtual_text = false,
    signs = { text = {
      [vim.diagnostic.severity.ERROR] = "󰅙 ",
      [vim.diagnostic.severity.WARN]  = " ",
      [vim.diagnostic.severity.INFO]  = "󰋼 ",
      [vim.diagnostic.severity.HINT]  = "󰌵 ",
    } },
})
