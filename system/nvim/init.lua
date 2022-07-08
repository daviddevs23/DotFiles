-- TODO:
----cheatsheet nvim
----DAP
----make a plugin for git smashing?? Or git fugitive?
----make a plugin for running files
----make a plugin for TODO (Like a popup window with a todo list)
----figure out luasnips
----refactor so that the code doesn't look like crap
----better bracket matching (for things like html tags too)
----break monolithic file into smaller files to fix shit
----checkout comment.nvim
----code runner
----checkout scrolling section
----testing plugins?
----spellsitter

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
vim.g.mapleader = " "

-- Key remaps
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

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

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)

-- Nvim Navigation
keymap("n", "<leader>w", ":lua require('nvim-window').pick()<CR>", opts)

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

-- Telescope
require('telescope').setup {
    -- ctrl v will vertical split the current prompted file
    -- ctrl x will horizontal split the current prompted file
    -- ctrl t will open in a new tab the current prompted file
    defaults = {
        prompt_prefix = ">> "
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
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'nvim_lua' },
    }, {
        { name = 'buffer' },
        { name = 'path' },
        { name = 'luasnip' },
        { name = 'spell' },
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

-- Javascript/Typescript
require 'lspconfig'.tsserver.setup {
    capabilities = capabilities,
    on_attach = custom_attach,
}

-- Ansible 
require 'lspconfig'.ansiblels.setup {
    capabilities = capabilities,
    on_attach = custom_attach,
}

-- Lua
require 'lspconfig'.sumneko_lua.setup {
    capabilities = capabilities,
    on_attach = custom_attach,
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

-- Treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "cpp", "c", "go", "bash", "javascript", "typescript", "lua", "rust", "python" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

-- Gitsigns
require('gitsigns').setup()

-- Nvim Markdown Preview
vim.g.nvim_markdown_preview_theme = "github"
vim.g.nvim_markdown_preview_format = "markdown"

-- NVIM Autopairs
require("nvim-autopairs").setup {}

-- Indent Blankline
vim.cmd [[highlight IndentBlanklineIndent1 guibg=#282828 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#32302f gui=nocombine]]

require("indent_blankline").setup {
    char = "",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
    },
    space_char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
    },
    show_trailing_blankline_indent = false,
}

-- toggle term
require("toggleterm").setup {
    open_mapping = [[<c-\>]],
    direction = 'horizontal',
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

-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Plugins
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
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
    use "BurntSushi/ripgrep"
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    use "gruvbox-community/gruvbox"
    use "ap/vim-css-color"

    use "windwp/nvim-autopairs"
    use 'nvim-lualine/lualine.nvim'
    use "kyazdani42/nvim-web-devicons"
    use {
        'romgrk/barbar.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' }
    }
    use "https://gitlab.com/yorickpeterse/nvim-window.git"

    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"
    use "hrsh7th/nvim-cmp"
    use 'hrsh7th/cmp-nvim-lsp'
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "saadparwaiz1/cmp_luasnip"
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"

    use 'andweeb/presence.nvim'
    use { "akinsho/toggleterm.nvim", tag = 'v1.*', config = function()
        require("toggleterm").setup()
    end }
    use "davidgranstrom/nvim-markdown-preview"
    use 'lewis6991/gitsigns.nvim'
    use "lukas-reineke/indent-blankline.nvim"
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    if packer_bootstrap then
        require('packer').sync()
    end
end)
