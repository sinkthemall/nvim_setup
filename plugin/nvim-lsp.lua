
local masonlsp_conf = {
    ensure_installed = {
            "clangd",
            "lua_ls",
            "pylsp",
            "bashls",
            "tombi",
            "asm_lsp",
            "docker_language_server",
            "marksman"
    },
    automatic_enable = {
            "marksman",
            "clangd",
            "lua_ls",
            "pylsp",
            "bashls",
            "tombi",
            "asm_lsp",
            "docker_language_server"
    }

}


vim.pack.add({
    { src = gh("mason-org/mason.nvim") },
    { src = gh("neovim/nvim-lspconfig") },
    { src = gh("mason-org/mason-lspconfig.nvim") }
})


require("mason").setup({})
require("mason-lspconfig").setup(masonlsp_conf)


-- require("config.lspconfig").defaults()

