-- small utils for handy import plugin name 
-- _G is Lua’s global environment table: all global variables/functions live as fields inside it (e.g. _G.print, _G.vim).
_G.gh = function(plugin)
    return "https://github.com/" .. plugin
end


-- setup base46 (for nvchad)
vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46_cache/"





-- require("config.lazy")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set linebreak")


--
require("config.options")
-- require("mapping")

