local function apply_markview_highlights()
    local heading_hls = {
        { group = "MarkviewHeading1", fg = "#f70202", bg = "#452424" },
        { group = "MarkviewHeading2", fg = "#f7e702", bg = "#454324" },
        { group = "MarkviewHeading3", fg = "#33f702", bg = "#274524" },
        { group = "MarkviewHeading4", fg = "#02f7f3", bg = "#244543" },
        { group = "MarkviewHeading5", fg = "#3477eb", bg = "#242445" },
        { group = "MarkviewHeading6", fg = "#f702f7", bg = "#452444" },
    }

    for level, hl in ipairs(heading_hls) do
        vim.api.nvim_set_hl(0, hl.group, { fg = hl.fg, bg = hl.bg })
        vim.api.nvim_set_hl(0, hl.group .. "Sign", { link = hl.group })
    end
end

apply_markview_highlights()

vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
    callback = apply_markview_highlights,
})


local conf = {
    preview = {
        enable = false,
        icon_provider = "devicons"
    },
    markdown = {
        headings = {
            enable = true,

            heading_1 = {
                style = "label",
                sign = "󰌕 ", sign_hl = "MarkviewHeading1Sign",

                icon = "󰼏  ", hl = "MarkviewHeading1",
                align = "left",
                corner_left = "",
                corner_right = "",
                padding_left = "",
                padding_right = "",
            },
            heading_2 = {
                style = "label",
                sign = "󰌖 ", sign_hl = "MarkviewHeading2Sign",

                icon = "󰎨  ", hl = "MarkviewHeading2",
                align = "left",
                corner_left = "",
                corner_right = "",
                padding_left = "",
                padding_right = "",
            },
            heading_3 = {
                style = "label",
                icon = "󰼑  ", hl = "MarkviewHeading3",
                align = "left",
                corner_left = "",
                corner_right = "",
                padding_left = "",
                padding_right = "",
            },
            heading_4 = {
                style = "label",
                icon = "󰎲  ", hl = "MarkviewHeading4",
                align = "left",
                corner_left = "",
                corner_right = "",
                padding_left = "",
                padding_right = "",
            },
            heading_5 = {
                style = "label",
                icon = "󰼓  ", hl = "MarkviewHeading5",
                align = "left",
                corner_left = "",
                corner_right = "",
                padding_left = "",
                padding_right = "",
            },
            heading_6 = {
                style = "label",
                icon = "󰎴  ", hl = "MarkviewHeading6",
                align = "left",
                corner_left = "",
                corner_right = "",
                padding_left = "",
                padding_right = "",
            },

            setext_1 = {
                style = "decorated",

                sign = "󰌕 ", sign_hl = "MarkviewHeading1Sign",
                icon = "  ", hl = "MarkviewHeading1",
                border = "▂"
            },
            setext_2 = {
                style = "decorated",

                sign = "󰌖 ", sign_hl = "MarkviewHeading2Sign",
                icon = "  ", hl = "MarkviewHeading2",
                border = "▁"
            },

            shift_width = 1,

            org_indent = false,
            org_indent_wrap = true,
            org_shift_char = " ",
            org_shift_width = 1,
        },
        block_quotes = {
            -- nvim repeats the border itself, see the patch at the bottom
            wrap = false,
        },
    }
}


vim.opt.linebreak = true
vim.opt.list = false
-- room for the repeated block quote border on wrapped lines
vim.opt.showbreak = "  "


vim.pack.add({
    { src = gh("nvim-tree/nvim-web-devicons") },
    { src = gh("OXY2DEV/markview.nvim") }
})

require("markview").setup(conf)


-- markview places the borders of a wrapped block quote by guessing where the
-- line breaks, which is off by one border when 'linebreak' is set. Let nvim
-- repeat them instead, which it gets right at any width.
local markdown = require("markview.renderers.markdown")
local block_quote = markdown.block_quote

markdown.block_quote = function (buffer, item)
    local set_extmark = vim.api.nvim_buf_set_extmark

    vim.api.nvim_buf_set_extmark = function (buf, ns, row, col, opts)
        opts.virt_text_repeat_linebreak = true
        return set_extmark(buf, ns, row, col, opts)
    end

    local ok, err = pcall(block_quote, buffer, item)
    vim.api.nvim_buf_set_extmark = set_extmark

    if not ok then
        error(err)
    end
end
