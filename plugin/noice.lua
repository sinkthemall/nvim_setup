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


-- Lazy load plugin
vim.api.nvim_create_autocmd("VimEnter", {
        once  = true,
        callback = function()
            vim.pack.add({
                { src = gh("MunifTanjim/nui.nvim")},
                { src = gh("folke/noice.nvim")}
            })
            require("noice").setup(conf)
        end
    }
)
