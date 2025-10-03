return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
    -- or                              , branch = '0.1.x',
        lazy = true,
        cmd = {"Telescope" },
        dependencies = {
            'nvim-lua/plenary.nvim',
            "echasnovski/mini.icons"
        },
        config = function()
            -- Telescope picker keymap
            --local builtin = require("telescope.builtin")
            -- vim.keymap.set('n', '<C-f>', builtin.current_buffer_fuzzy_find, {noremap = true})
            -- vim.keymap.set('n', '<C-M-f>', builtin.live_grep, {noremap = true})
            --require("telescope").load_extension("fidget")
        end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        lazy = true,
        config = function()
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                    require("telescope.themes").get_dropdown {}
                    -- even more opts

                    }
                }
            }
            require("telescope").load_extension("ui-select")
        end
    }
}
