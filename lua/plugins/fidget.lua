return {
    "j-hui/fidget.nvim",
    opts = {
    -- options
        text = {
            spinner = "dots",
            done = "✔ ",
        },
        window = {
            blend = 0,
        },
    },
    config = function(_, opts)
        require("fidget").setup(opts)
    end
}
