return {
    -- Telescope
    "nvim-treesitter/nvim-treesitter",
	branch = 'master',
	event = { "BufReadPost", "BufNewFile" },
	lazy = true,
	build = ":TSUpdate",
	cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
	opts = {
		ensure_installed = {"c" , "lua", "python", "vim", "html", "asm", "bash", "cpp", "dockerfile", "vimdoc", "luadoc", "markdown"},
        highlight = {
				enable = true,
				use_languagetree = true,
		},
        indent = {enable = true},
	},
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end

}
