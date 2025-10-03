local map = vim.keymap.set

vim.g.mapleader = " "


-- Config window navigation
map('n', '<C-Left>', '<C-w><Left>', {noremap = true, silent = true, desc = "switch window left" })
map('n', '<C-Right>', '<C-w><Right>', {noremap = true, silent = true, desc = "switch window right"})
map('n', '<C-Up>', '<C-w><Up>', {noremap = true, silent = true, desc = "switch window up"})
map('n', '<C-Down>', '<C-w><Down>', {noremap = true, silent = true, desc = "switch window down"})

-- neotree toggle
map('n', '<leader>e', '<cmd>Neotree filesystem toggle right<CR><C-w>w', {noremap = true, silent = true, desc = "Neotree toggle right"})

-- Terminal toggle
-- local term = require("nvchad.term")
-- map("n", "<leader>tf", term.new({ pos = "float" }), { desc = "Toggle floating terminal" })
-- map("n", "<leader>tv", term.new({ pos = "vsp" }), { desc = "Toggle vertical terminal" })
-- map("n", "<leader>th", term.new({ pos = "sp" }), { desc = "Toggle horizontal terminal" })


-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- UFO
map('n', 'zR', require('ufo').openAllFolds, {noremap = true, silent =true , desc = "Ultra Fold unfold all"})
map('n', 'zM', require('ufo').closeAllFolds, {noremap = true, silent = true, desc = "Ultra Fold fold all"})
-- map('n', 'za', require('ufo').toggleFold, {noremap = true, silent =true , desc = "Ultra Fold toggle fold"})
--map('n', 'zr', require('ufo').openFoldsExceptKinds, {desc = "Ultra unFold fold"})
--map('n', 'zm', require('ufo').closeFoldsWith, {desc = "Ultra Fold fold"})
