local conf = {}

vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    callback = function()
        vim.pack.add({
            { src = gh("chentoast/marks.nvim") },
        })

        require("marks").setup(conf)
    end,
})
