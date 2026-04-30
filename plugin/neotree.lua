-- Plugin's local config table
local conf = {}

-- Lazy load on command 
vim.api.nvim_create_user_command(
    "Neotree",
    function(opts)
        vim.api.nvim_del_user_command("Neotree")
        vim.pack.add({
            { src = gh('nvim-lua/plenary.nvim')},
            { src = gh('nvim-tree/nvim-web-devicons')},
            { src = gh('MunifTanjim/nui.nvim')},
            { src = gh('echasnovski/mini.icons')},
            { src = gh("nvim-neo-tree/neo-tree.nvim"), vim.version.range('3')}
        })
        vim.cmd("Neotree " .. opts.args)
    end,
    { nargs = "*" }
)
