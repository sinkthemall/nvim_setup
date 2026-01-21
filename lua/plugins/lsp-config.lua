return {

    {

        "mason-org/mason-lspconfig.nvim",
        lazy = false,
        opts = {
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
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
        config = function(_, opts)
            require("mason-lspconfig").setup(opts)
        end
    },
    {
        "mason-org/mason.nvim",
        opts = {}
    },
    {
        "neovim/nvim-lspconfig",
        event = "User FilePost",
        config = function()
            require("config.lsp").defaults()
        end,
    },
}
