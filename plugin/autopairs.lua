local conf = {
    fast_wrap = {},
    disable_filetype = { "TelescopePrompt", "vim" },
}

vim.api.nvim_create_autocmd("InsertEnter", {
    once = true,
    callback = function()
        vim.pack.add({
            { src = gh("windwp/nvim-autopairs") },
        })

        require("nvim-autopairs").setup(conf)
    end,
})
