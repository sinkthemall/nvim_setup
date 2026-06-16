local map = vim.keymap.set

vim.g.mapleader = " "


-- Config window navigation
map('n', '<C-Left>', '<C-w><Left>', {noremap = true, silent = true, desc = "switch window left" })
map('n', '<C-Right>', '<C-w><Right>', {noremap = true, silent = true, desc = "switch window right"})
map('n', '<C-Up>', '<C-w><Up>', {noremap = true, silent = true, desc = "switch window up"})
map('n', '<C-Down>', '<C-w><Down>', {noremap = true, silent = true, desc = "switch window down"})

-- neotree toggle
map('n', '<leader>ne', '<cmd>Neotree filesystem toggle right<CR><C-w>w', {noremap = true, silent = true, desc = "Neotree toggle right"})

-- Terminal toggle
-- local term = require("nvchad.term")
-- map("n", "<leader>tf", term.new({ pos = "float" }), { desc = "Toggle floating terminal" })
-- map("n", "<leader>tv", term.new({ pos = "vsp" }), { desc = "Toggle vertical terminal" })
-- map("n", "<leader>th", term.new({ pos = "sp" }), { desc = "Toggle horizontal terminal" })


-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- UFO
-- map('n', 'zR', require('ufo').openAllFolds, {noremap = true, silent =true , desc = "Ultra Fold unfold all"})
-- map('n', 'zM', require('ufo').closeAllFolds, {noremap = true, silent = true, desc = "Ultra Fold fold all"})
-- map('n', 'za', require('ufo').toggleFold, {noremap = true, silent =true , desc = "Ultra Fold toggle fold"})
--map('n', 'zr', require('ufo').openFoldsExceptKinds, {desc = "Ultra unFold fold"})
--map('n', 'zm', require('ufo').closeFoldsWith, {desc = "Ultra Fold fold"})

-- Telescope mapping 
local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, { noremap = true, silent = true, desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, { noremap = true, silent = true, desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, { noremap = true, silent = true, desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, { noremap = true, silent = true, desc = 'Telescope help tags' })


-- LSP mapping config 
local function LSP_opts(desc)
    -- return { buffer = bufnr, desc = "LSP " .. desc }
    return { desc = "LSP" .. desc}
end

map("n", "gD", vim.lsp.buf.declaration, LSP_opts "Go to declaration")
map("n", "gd", vim.lsp.buf.definition, LSP_opts "Go to definition")
map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, LSP_opts "Add workspace folder")
map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, LSP_opts "Remove workspace folder")
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, LSP_opts "Code action")
map("n", "<leader>de", vim.diagnostic.open_float, LSP_opts "Dianostic open float")
map("n", "<leader>da", vim.diagnostic.setloclist, LSP_opts "Dianostic all error")
-- map("n", "<leader>wl", function()
--     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- end, LSP_opts "List workspace folders")
map("n", "<leader>D", vim.lsp.buf.type_definition, LSP_opts "Go to type definition")
-- map("n", "<leader>ra", require "nvchad.lsp.renamer", LSP_opts "NvRenamer")

