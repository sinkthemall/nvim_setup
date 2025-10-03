return  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        "echasnovski/mini.icons",
        -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    cmd = {"Neotree"},
    lazy = true, -- neo-tree will lazily load itself
    ---@module "neo-tree"
    ---@type neotree.Config?
    opts = {
        -- fill any relevant options here
    },
    config = function()
        --[[require("neo-tree").setup {
            follow_current_file = true,
        }]]--
        -- vim.keymap.set('n', '<C-b>', '<cmd>Neotree filesystem toggle right<CR><C-w>w', {noremap = true, silent = true})
    end
}
