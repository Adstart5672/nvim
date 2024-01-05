local fn = vim.fn

-- Automatically install Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)



-- Install your plugins here
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
        -- My plugins here
        "folke/lazy.nvim", -- Have lazy manage itself
        "nvim-lua/popup.nvim",  -- An implementation of the Popup API from vim in Neovim
        "nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
        "andweeb/presence.nvim", -- Discord presence
        "akinsho/toggleterm.nvim", -- Toggle Term
        "windwp/nvim-autopairs", -- autoPairs
        {
                "lewis6991/gitsigns.nvim",
                dependencies = {
                        "nvim-lua/plenary.nvim",
                },
        }, -- gitSign
        { "lukas-reineke/indent-blankline.nvim", main="ibl",  opts={}  }, -- indentline
        {
                "goolord/alpha-nvim",
                dependencies = { "kyazdani42/nvim-web-devicons" },
        }, -- alpha
        "kyazdani42/nvim-tree.lua", -- nvim Tree
        "folke/which-key.nvim",
        "norcalli/nvim-colorizer.lua",
        {
                "folke/trouble.nvim",
                dependencies = "kyazdani42/nvim-web-devicons",
        },

        -- multi cursor
        "mg979/vim-visual-multi",

        -- Color Scheme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,

    },
        "shaunsingh/nord.nvim",
        "navarasu/onedark.nvim",
        "EdenEast/nightfox.nvim",
        "rmehri01/onenord.nvim",
        "morhetz/gruvbox",
        "glepnir/zephyr-nvim",
        { "catppuccin/nvim" },
        { "Everblush/everblush.nvim", name = "everblush" },
        -- cmp plugins
        "hrsh7th/nvim-cmp", -- The completion plugin
        "hrsh7th/cmp-buffer", -- buffer completions
        "hrsh7th/cmp-path", -- path completions
        "hrsh7th/cmp-cmdline", -- cmdline completions
        "saadparwaiz1/cmp_luasnip", -- snippet completions
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "onsails/lspkind.nvim", -- Vscode like pictogram

        -- snippets
        { 
           "L3MON4D3/LuaSnip", 

           version = "v2.*",

           build = "make install_jsregexp"

        }, 

        "rafamadriz/friendly-snippets", -- a bunch of snippets to use

        -- LSP

        "neovim/nvim-lspconfig", -- enable LSP
        "williamboman/mason-lspconfig.nvim",
        { "williamboman/mason.nvim" },
        {
              'stevearc/conform.nvim',
                opts = {},
                
        },
        {

                "ray-x/lsp_signature.nvim",
        },
        "kkharji/lspsaga.nvim",
        {
                "j-hui/fidget.nvim",
                config = function()
                        require"fidget".setup({})
                end,
        },

        -- Telescope
        "nvim-telescope/telescope.nvim",
        "nvim-telescope/telescope-media-files.nvim",

        -- Treesitter
        {
                "nvim-treesitter/nvim-treesitter",
                build = ":TSUpdate",
        },
        "HiPhish/rainbow-delimiters.nvim",

        "windwp/nvim-ts-autotag",

        -- lualine
        {
                "nvim-lualine/lualine.nvim",
                dependencies = { "kyazdani42/nvim-web-devicons", lazy = true },
        },

        -- Comment
        "numToStr/Comment.nvim",
        "JoosepAlviste/nvim-ts-context-commentstring",

        -- bufferline
        { "akinsho/bufferline.nvim", dependencies = "kyazdani42/nvim-web-devicons" },
        "moll/vim-bbye",

        {
                "kylechui/nvim-surround",
                config = function()
                        require"nvim-surround".setup({
                                -- Configuration here, or leave empty to  defaults
      })
                end,
        },
        {
                "petertriho/nvim-scrollbar",
                config = function()
                        require"scrollbar".setup()
                end,
        },

        "ahmedkhalf/project.nvim",
})

