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
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" }
    },
}

-- Highlight hex collors
require("colorizer").setup()


vim.api.nvim_create_autocmd(
    { "BufEnter" },
    { pattern = { "*" },
        command = "normal zR", }
)

local home = os.getenv("HOME")
local db = require("dashboard")

db.custom_header = {
 " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
 " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
 " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
 " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
 " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
 " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
}

db.custom_center = {
    { icon = "  ",
        desc = "Recently latest session                  ",
        shortcut = "SPC s l",
        action = "SessionLoad" },
    { icon = "  ",
        desc = "Recently opened files                   ",
        action = "DashboardFindHistory",
        shortcut = "SPC f h" },
    { icon = "  ",
        desc = "Find  File                              ",
        action = "Telescope find_files find_command=rg,--hidden,--files",
        shortcut = "SPC f f" },
    { icon = "  ",
        desc = "File Browser                            ",
        action = "Telescope file_browser",
        shortcut = "SPC f b" },
    { icon = "  ",
        desc = "Find  word                              ",
        action = "Telescope live_grep",
        shortcut = "SPC f w" },
    { icon = "  ",
        desc = "Open Personal dotfiles                  ",
        action = "Telescope dotfiles path=" .. home .. "/.dotfiles",
        shortcut = "SPC f d" },
}
