

vim.pack.add({
    { src = gh('nvim-lua/plenary.nvim') },
    { src = gh('nvim-telescope/telescope.nvim'), version = "master"},
    { src = gh('nvim-telescope/telescope-ui-select.nvim'), version = "master"}
})


-- PLugin's local config table, this one is special, we must create it after vim.pack.add
local conf = { 
    extensions = {
        ["ui-select"] = {
        require("telescope.themes").get_dropdown {}
        -- even more opts

        }
    }
} 

-- Im load it from the start, not lazy load yet
require("telescope").setup(conf)
require("telescope").load_extension("ui-select")
