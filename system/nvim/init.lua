-- TODO:
----Figure out tag list and jump list
----Add Telescope
----Add lua snippets
----cheatsheet nvim
----DAP
----Git Integration
----Better window navigation - nvim window
----Easier finding words
----Improve greeter - more options after I add telescope
----treesitter
----cmp-git
----cmp-dadbod for database completion
----cmp-spell checking - null ls
----better auto pairs for brackets and stuff
----Add a terminal of some kind

-- Set options
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.hlsearch = false
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = "/home/david/.vim/undodir"
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 100
vim.opt.encoding = "utf-8"
vim.opt.showtabline = 2
vim.opt.ruler = true
vim.opt.clipboard = "unnamedplus"
vim.opt.timeoutlen = 200
vim.opt.mouse = "a"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.g.loglevel = "debug"
vim.g.presenceloglevel = "debug"

-- dashboard-nvim
local db = require('dashboard')
db.custom_header = {
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '.__   __.  _______   ______   ____    ____  __  .___  ___.',
    '|  \\ |  | |   ____| /  __  \\  \\   \\  /   / |  | |   \\/   |',
    '|   \\|  | |  |__   |  |  |  |  \\   \\/   /  |  | |  \\  /  |',
    '|  . `  | |   __|  |  |  |  |   \\      /   |  | |  |\\/|  |',
    '|  |\\   | |  |____ |  `--\'  |    \\    /    |  | |  |  |  |',
    '|__| \\__| |_______| \\______/      \\__/     |__| |__|  |__|',
    '',
    '',
}
db.custom_footer = { icon = '', desc = '', action = '' }
db.custom_center = {
    { icon = '  ',
        desc = 'New File                                ',
        action = 'SessionLoad' },
    -- {icon = '  ',
    -- desc = 'Recently latest session                 ',
    -- action ='SessionLoad'},
    -- {icon = '  ',
    -- desc = 'Recently opened files                   ',
    -- action =  'DashboardFindHistory',
    -- {icon = '  ',
    -- desc = 'Find  File                              ',
    -- action = 'Telescope find_files find_command=rg,--hidden,--files',
    -- {icon = '  ',
    -- desc ='File Browser                            ',
    -- action =  'Telescope file_browser',
    -- {icon = '  ',
    -- desc = 'Find  word                              ',
    -- action = 'Telescope live_grep',
    -- {icon = '  ',
    -- desc = 'Open Personal dotfiles                  ',
    -- action = 'Telescope dotfiles path=' .. home ..'/.dotfiles',
    -- shortcut = 'SPC f d'},
}

-- Key remaps
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "

-- Remap nav keys on to the right
keymap("n", ";", "l", opts)
keymap("n", "l", "k", opts)
keymap("n", "k", "j", opts)
keymap("n", "j", "h", opts)

keymap("v", ";", "l", opts)
keymap("v", "l", "k", opts)
keymap("v", "k", "j", opts)
keymap("v", "j", "h", opts)

keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)
keymap("v", "jk", "<ESC>", opts)
keymap("v", "kj", "<ESC>", opts)

-- Better tabbing
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)


-- Gotta make it stylish af
local colorscheme = "gruvbox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end

-- Lualine
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'gruvbox_dark',
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '', right = '' },
        always_divide_middle = true,
        globalstatus = false,
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
}

-- Barbar
-- Move to previous/next
keymap('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
keymap('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Goto buffer in position...
keymap('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
keymap('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
keymap('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
keymap('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
keymap('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
keymap('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
keymap('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
keymap('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
keymap('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
keymap('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Close buffer
keymap('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
-- Magic buffer-picking mode
keymap('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
keymap('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
keymap('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
keymap('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
keymap('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)


-- CMP Completion
vim.opt.completeopt = { "menu", "menuone", "noselect" }
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Setup nvim-cmp.
local cmp = require 'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
        { name = 'path' },
        { name = 'luasnip' },
    })
})

-- LSP
local custom_attach = function()
    -- shows information window about what you are hovering over
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
    -- goes to definition
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
    -- gives you the type definition
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
    -- rename variables, might have to hit :wa after you run this
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = 0 })
    -- got to next issue in buffer
    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, { buffer = 0 })
    -- got to next issue in buffer
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, { buffer = 0 })
    -- code actions
    vim.keymap.set("n", "cd", vim.lsp.buf.code_action, { buffer = 0 })
    -- code formatting
    vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, { buffer = 0 })
    -- vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", {buffer=0})
end

-- Python
require 'lspconfig'.pyright.setup {
    capabilities = capabilities,
    on_attach = custom_attach,
}


-- C++/C
require 'lspconfig'.clangd.setup {
    capabilities = capabilities,
    on_attach = custom_attach,
}

-- Rust
require 'lspconfig'.rust_analyzer.setup {
    capabilities = capabilities,
    on_attach = custom_attach,
}

-- Golang
require 'lspconfig'.gopls.setup {
    capabilities = capabilities,
    on_attach = custom_attach,
}

-- Bash
require 'lspconfig'.bashls.setup {
    capabilities = capabilities,
    on_attach = custom_attach,
}

-- Lua
local sumneko_binary_path = vim.fn.exepath('lua-language-server')
local sumneko_root_path = vim.fn.fnamemodify(sumneko_binary_path, ':h:h:h')

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require 'lspconfig'.sumneko_lua.setup {
    capabilities = capabilities,
    on_attach = custom_attach,
    cmd = { sumneko_binary_path, "-E", sumneko_root_path .. "/main.lua" };
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = runtime_path,
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
}

-- discord presence
require("presence"):setup({
    -- General options
    auto_update        = true, -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
    neovim_image_text  = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
    main_image         = "neovim", -- Main image display (either "neovim" or "file")
    client_id          = "793271441293967371", -- Use your own Discord application client id (not recommended)
    log_level          = nil, -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
    debounce_timeout   = 10, -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
    enable_line_number = false, -- Displays the current line number instead of the current project
    blacklist          = {}, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
    buttons            = true, -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
    file_assets        = {}, -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
    editing_text        = nil, -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
    file_explorer_text  = nil, -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
    git_commit_text     = nil, -- Format string rendered when committing changes in git (either string or function(filename: string): string)
    plugin_manager_text = nil, -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
    reading_text        = nil, -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
    workspace_text      = nil, -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
    line_number_text    = nil, -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
})

-- Plugins
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
end

-- Make packer run in a popup window
local _, packer = pcall(require, "packer")
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Plugins to install
return require('packer').startup(function(use)
    use "wbthomason/packer.nvim"
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"

    use "gruvbox-community/gruvbox"
    use "ap/vim-css-color"

    use "jiangmiao/auto-pairs" -- Get a different one
    use 'nvim-lualine/lualine.nvim'
    use "kyazdani42/nvim-web-devicons"
    use {
        'romgrk/barbar.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' }
    }
    packer.use { 'glepnir/dashboard-nvim' }

    use "neovim/nvim-lspconfig"
    use "hrsh7th/nvim-cmp"
    use 'hrsh7th/cmp-nvim-lsp'
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "saadparwaiz1/cmp_luasnip"
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"

    use 'andweeb/presence.nvim'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
