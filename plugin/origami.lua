local conf = {
	useLspFoldsWithTreesitterFallback = {
		enabled = true,
		foldmethodIfNeitherIsAvailable = "indent", ---@type string|fun(bufnr: number): string
	},
	pauseFoldsOnSearch = true,
	foldtext = {
		enabled = true,
		padding = {
			character = " ",
			width = 3,  ---@type number|fun(win: number, foldstart: number, currentVirtualTextLength: number): number
			hlgroup = nil,
		},
		lineCount = {
			template = "%d 󰘖 ", -- `%d` is replaced with the number of folded lines
			hlgroup = "SpecialComment",
		},
		diagnosticsCount = true, -- uses hlgroups and icons from `vim.diagnostic.config().signs`
		gitsignsCount = true, -- requires `gitsigns.nvim`
		disableOnFt = { "snacks_picker_input" }, ---@type string[]
	},
	autoFold = {
		enabled = true,
		kinds = { "comment", "imports" }, ---@type lsp.FoldingRangeKind[]
	},
	foldKeymaps = {
		setup = true, -- modifies `h`, `l`, `^`, and `$`
		closeOnlyOnFirstColumn = false, -- `h` and `^` only fold in the 1st column
		scrollLeftOnCaret = false, -- `^` should scroll left (basically mapped to `0^`)
	},
}


vim.pack.add({
    { src = gh("chrisgrieser/nvim-origami")},
})

require("origami").setup(conf)


-- vim.keymap.set("n", "<Left>", function() require("origami").h() end)
-- vim.keymap.set("n", "<Right>", function() require("origami").l() end)
-- vim.keymap.set("n", "<Home>", function() require("origami").caret() end)
-- vim.keymap.set("n", "<End>", function() require("origami").dollar() end)
