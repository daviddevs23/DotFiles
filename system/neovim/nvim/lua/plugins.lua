local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
    -- Packer
    use "wbthomason/packer.nvim"

    -- Epic Theme
    use "ellisonleao/gruvbox.nvim"

    -- LSP
    use "neovim/nvim-lspconfig"

    -- Completion
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-calc"
    use "hrsh7th/cmp-emoji"
    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"

    -- Lualine
    use {
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons", opt = true }
    }

    -- Telescope
    use "BurntSushi/ripgrep"
    use {
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" } }
    }
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

    -- Treesitter
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

    -- Toggleterm
    use { "akinsho/toggleterm.nvim", tag = "*", config = function()
        require("toggleterm").setup()
    end }

    -- Colorizer
    use "norcalli/nvim-colorizer.lua"

    -- Better Looking Indents
    use "lukas-reineke/indent-blankline.nvim"

    -- Markdown Preview
    use "davidgranstrom/nvim-markdown-preview"

    -- Autopair
    use "windwp/nvim-autopairs"

    -- Harpoon
    use {
        "ThePrimeagen/harpoon",
        requires = { { "nvim-lua/plenary.nvim" } }
    }

    -- Test Python Plugin
    use "/home/david/DotFiles/system/neovim/nvim/lua/plugin.py"

    if packer_bootstrap then
        require("packer").sync()
    end
end)
