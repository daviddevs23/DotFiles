-- Gotta make it stylish af
require("gruvbox").setup({
    overrides = {
        SignColumn = { bg = "#3c3836" }
    }
})
vim.cmd("colorscheme gruvbox")

-- Lualine
require("lualine").setup {
    options = {
        icons_enabled = true,
        theme = "gruvbox_dark",
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" },
        always_divide_middle = true,
        globalstatus = false,
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { 'filename' },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" }
    },
}

-- Highlight hex collors
require("colorizer").setup()
