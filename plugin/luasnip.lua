
local conf = {
  history = true,
  updateevents = "TextChanged,TextChangedI",
}

-- install/register plugins
vim.pack.add({
    { src = gh("rafamadriz/friendly-snippets") },
    { src = gh("L3MON4D3/LuaSnip") , version = vim.version.range("^2.0.0")},
})

-- load when entering insert mode (good lazy trigger for snippets)
vim.api.nvim_create_autocmd("InsertEnter", {
  once = true,
  callback = function()
    -- vim.pack.load({
    --   "LuaSnip",
    --   "friendly-snippets",
    -- })

    require("luasnip").config.set_config(opts)

    -- vscode format
    require("luasnip.loaders.from_vscode").lazy_load({
      exclude = vim.g.vscode_snippets_exclude or {},
    })

    require("luasnip.loaders.from_vscode").lazy_load({
      paths = vim.g.vscode_snippets_path or "",
    })

    -- lua format
    require("luasnip.loaders.from_lua").load()

    require("luasnip.loaders.from_lua").lazy_load({
      paths = vim.g.lua_snippets_path or "",
    })

    -- snipmate format
    require("luasnip.loaders.from_snipmate").load()

    require("luasnip.loaders.from_snipmate").lazy_load({
      paths = vim.g.snipmate_snippets_path or "",
    })
  end,
})
