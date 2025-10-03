-- return {}
return {
    'akinsho/toggleterm.nvim',
    version = "*",
    -- cmd = {"ToggleTerm"},
    lazy = false,
    opts = {
            open_mapping = [[<M-t>]],
            shade_terminals = false,
           -- shading_factor = '50',
            close_on_exit = true,
            direction = "float",
            persist_size = false,
            persist_mode = false,
            shell = vim.o.shell,
            float_ops = {
                border = "round",
                title_pos = "center",
                width = function ()
                    return math.floor(vim.o.columns * 0.5)
                end,
                height = function ()
                    return math.floor(vim.o.lines * 0.5)
                end,
                winblend = 0,
            },
    },
    config = function(_, opts)
        require("toggleterm").setup(opts)
    end
}
