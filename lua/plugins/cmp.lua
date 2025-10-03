pcall(function()
    dofile(vim.g.base46_cache .. "cmp")
end) 

return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        {
            -- snippet plugin
            "L3MON4D3/LuaSnip", 
        },
        {

            {
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lua",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                --"https://codeberg.org/FelipeLema/cmp-async-path.git"
            }
        },
        {
            "windwp/nvim-autopairs",
        }
    },
    opts = function()
        local cmp = require("cmp")
        local options = {
            completion = { completeopt = "menu,menuone" },

            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },

            mapping = {
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.close(),

                ["<CR>"] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true,
                },

                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif require("luasnip").expand_or_jumpable() then
                        require("luasnip").expand_or_jump()
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif require("luasnip").jumpable(-1) then
                        require("luasnip").jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            },

            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "nvim_lua" },
                { name = "path" },
            --{ name = "async_path" },
            },
        }
	    return options
    end,
    -- config = function(_, opts)
    --     require("luasnip").setup(opts)
    -- end
}
