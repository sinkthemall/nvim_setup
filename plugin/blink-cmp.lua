local conf = {
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    snippets = {
        preset = 'luasnip'
    },
    appearance = {
        nerd_font_variant = 'mono'
    },
    keymap = {
        preset = "none",

        -- ["<C-p>"] = { "select_prev", "fallback" },
        -- ["<C-n>"] = { "select_next", "fallback" },

        ["<C-d>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },

        ["<C-Space>"] = { "show", "show_documentation", "fallback" },

        ["<C-e>"] = { "hide", "fallback" },

        ["<CR>"] = { "accept", "fallback" },

        ["<Tab>"] = {
            "select_next",
            "snippet_forward",
            "fallback",
        },

        ["<S-Tab>"] = {
            "select_prev",
            "snippet_backward",
            "fallback",
        },
    },
    completion = {
		menu = {
			draw = {
				components = {
					kind_icon = {
						text = function(ctx)
							local icon = ctx.kind_icon
							if vim.tbl_contains({ "Path" }, ctx.source_name) then
								local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
								if dev_icon then
									icon = dev_icon
								end
							else
								icon = require("lspkind").symbol_map[ctx.kind] or ""
							end

							return icon .. ctx.icon_gap
						end,

						-- Optionally, use the highlight groups from nvim-web-devicons
						-- You can also add the same function for `kind.highlight` if you want to
						-- keep the highlight groups in sync with the icons.
						highlight = function(ctx)
							local hl = ctx.kind_hl
							if vim.tbl_contains({ "Path" }, ctx.source_name) then
								local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
								if dev_icon then
									hl = dev_hl
								end
							end
							return hl
						end,
					},
				},
			},
		},
        documentation = {
            auto_show = false,
        },
        list = {
            selection = {
                preselect = true,
                auto_insert = true,
            },
        },
        -- signature = {
        --     enabled = true,
        --     auto_show = false
        -- },
        ghost_text = {
            enabled = false,
        },
	},
}

vim.pack.add({
    { src = gh("nvim-tree/nvim-web-devicons") },
    { src = gh('onsails/lspkind.nvim') },
    { src = gh('rafamadriz/friendly-snippets') },
    { src = gh('saghen/blink.cmp') , version = vim.version.range('^1.0.0') }
})



require('nvim-web-devicons').setup()
require("blink.cmp").setup(conf)



