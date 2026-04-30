local conf = {
    suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    enabled = true,
    auto_save = true,
    auto_restore = true,
}

vim.pack.add({
    { src = gh("rmagatti/auto-session") },
})

require("auto-session").setup(conf)
