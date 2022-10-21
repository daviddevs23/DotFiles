-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
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
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
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
return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use "BurntSushi/ripgrep"
    use {
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" } }
    }
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

    use "ellisonleao/gruvbox.nvim"
    use "ap/vim-css-color"

    use "windwp/nvim-autopairs"
    use "nvim-lualine/lualine.nvim"
    use "kyazdani42/nvim-web-devicons"
    use {
        "romgrk/barbar.nvim",
        requires = { "kyazdani42/nvim-web-devicons" }
    }
    use "https://gitlab.com/yorickpeterse/nvim-window.git"

    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "saadparwaiz1/cmp_luasnip"
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"

    use "andweeb/presence.nvim"
    use { "akinsho/toggleterm.nvim", tag = "*", config = function()
        require("toggleterm").setup()
    end }
    use "norcalli/nvim-colorizer.lua"
    use "davidgranstrom/nvim-markdown-preview"
    use "lewis6991/gitsigns.nvim"
    use "lukas-reineke/indent-blankline.nvim"
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

    use "mfussenegger/nvim-dap"
    use "leoluz/nvim-dap-go"
    use "rcarriga/nvim-dap-ui"
    use "theHamsta/nvim-dap-virtual-text"
    use "nvim-telescope/telescope-dap.nvim"

    use {
        "wthollingsworth/pomodoro.nvim",
        requires = "MunifTanjim/nui.nvim"
    }

    -- My own plugins for testing

    use "/home/david/Code/trailingSpace.nvim"

    if packer_bootstrap then
        require("packer").sync()
    end
end)
