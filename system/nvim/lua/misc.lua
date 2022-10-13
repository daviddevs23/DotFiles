-- Gitsigns
require("gitsigns").setup()

-- Nvim Markdown Preview
vim.g.nvim_markdown_preview_theme = "github"
vim.g.nvim_markdown_preview_format = "markdown"

-- NVIM Autopairs
require("nvim-autopairs").setup {}

-- Indent Blankline
vim.opt.list = true
require("indent_blankline").setup {
    show_end_of_line = true,
}

-- toggle term
require("toggleterm").setup {
    open_mapping = [[<c-\>]],
    eirection = "horizontal",
    size = vim.fn.winheight(0) / 3,
}

-- discord presence
require("presence"):setup({
    auto_update         = true,
    neovim_image_text   = "The One True Text Editor",
    main_image          = "neovim",
    client_id           = "793271441293967371",
    log_level           = nil,
    debounce_timeout    = 10,
    enable_line_number  = false,
    blacklist           = {},
    buttons             = true,
    file_assets         = {},
    editing_text        = nil,
    file_explorer_text  = nil,
    git_commit_text     = nil,
    plugin_manager_text = nil,
    reading_text        = nil,
    workspace_text      = nil,
    line_number_text    = nil,
})

-- Pomodor Timer
require("pomodoro").setup({
    time_work = 25,
    time_break_short = 5,
    time_break_long = 20,
    timers_to_long_break = 4
})
