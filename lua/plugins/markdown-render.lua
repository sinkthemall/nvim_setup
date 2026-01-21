return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },            -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
    config = function()
        -- create my own highlight group for header
        vim.api.nvim_set_hl(0, "MarkdownH1", {fg = "#f70202", bg = "#452424"})
        vim.api.nvim_set_hl(0, "MarkdownH2", {fg = "#f7e702", bg = "#454324"})
        vim.api.nvim_set_hl(0, "MarkdownH3", {fg = "#33f702", bg = "#274524"})
        vim.api.nvim_set_hl(0, "MarkdownH4", {fg = "#02f7f3", bg = "#244543"})
        vim.api.nvim_set_hl(0, "MarkdownH5", {fg = "#0a02f7", bg = "#242445"})
        vim.api.nvim_set_hl(0, "MarkdownH6", {fg = "#f702f7", bg = "#452444"})
        -- local bgcolor = vim.api.nvim_get_hl_id_by_name("Normal").backgrounds

        require("render-markdown").setup({
            heading = {
                enabled = true,
                position = "inline",
                backgrounds = {
                    'MarkdownH1',
                    'MarkdownH2',
                    'MarkdownH3',
                    'MarkdownH4',
                    'MarkdownH5',
                    'MarkdownH6',
                },
                foregrounds = {
                    'RenderMarkdownH1',
                    'RenderMarkdownH2',
                    'RenderMarkdownH3',
                    'RenderMarkdownH4',
                    'RenderMarkdownH5',
                    'RenderMarkdownH6',
                },
            },
            code = {
                position = 'right',
                width = 'block',
                right_pad = 10,
            },
            checkbox = {
                checked = { scope_highlight = '@markup.strikethrough' },
                custom = {
                    important = {
                        raw = '[~]',
                        rendered = '󰓎 ',
                        highlight = 'DiagnosticWarn',
                    },
                },
            },
            quote = {
                repeat_linebreak = true,
            },
            win_options = {
                showbreak = {
                    default = '',
                    rendered = '  ',
                },
                breakindent = {
                    default = false,
                    rendered = true,
                },
                breakindentopt = {
                    default = '',
                    rendered = '',
                },
            },
        })
    end
}
