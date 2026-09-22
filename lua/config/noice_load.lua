-- moving the noice into config, so I can load it from init.lua, doing this so the vim.pack UI use the noice UI instead
--
-- PLugin's local config table
local conf = {
    messages = {
        enabled = true,
        -- view = "notify"
        backend = "nui"
    },
    popup = {
        enabled = true,
    },
    popupmenu = {
        enabled = true,
        backend = "nui"
    },
    views = { -- config view
        popupmenu = {
            -- border = {
            --     style = "single"
            -- },
            win_options = {
                winhighlight = {
                    Normal = "Normal",
                    FloatBorder = "DiagnosticInfo",
                },
            },
            scrollbar = false,
            -- backend = "nui"
        },
        popup = {
            border = {
                style = "single"
            }
        },
        -- messages = {
        --     border = {
        --         style = "single"
        --     }
        -- }
    },
    routes = { -- filter event
        {
            filter = {
                event = "msg_show",
                min_height = 8
            },
            view = "popup"
        }
    }

}

vim.pack.add({
    { src = gh("MunifTanjim/nui.nvim")},
    { src = gh("folke/noice.nvim")}
})
require("noice").setup(conf)
