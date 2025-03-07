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
	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
	"andweeb/presence.nvim", -- Discord presence
	"akinsho/toggleterm.nvim", -- Toggle Term
	"windwp/nvim-autopairs", -- autoPairs
	{
		"lewis6991/gitsigns.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{ "nvzone/volt", lazy = true },
	{ "nvzone/menu", lazy = true },
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	-- gitSign
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed.
			"nvim-telescope/telescope.nvim", -- optional
			"ibhagwan/fzf-lua", -- optional
			"echasnovski/mini.pick", -- optional
		},
		config = true,
	},

	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} }, -- indentline
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	}, -- alpha
	"nvim-tree/nvim-tree.lua", -- nvim Tree
	"folke/which-key.nvim",
	"norcalli/nvim-colorizer.lua",
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
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
	{
		"hrsh7th/nvim-cmp",
	}, -- The completion plugin
	"hrsh7th/cmp-buffer", -- buffer completions
	"hrsh7th/cmp-path", -- path completions
	"hrsh7th/cmp-cmdline", -- cmdline completions
	"saadparwaiz1/cmp_luasnip", -- snippet completions
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"onsails/lspkind.nvim", -- Vscode like pictogram
	{
		"dnlhc/glance.nvim",
		cmd = "Glance",
	},
	-- snippets
	{
		"L3MON4D3/LuaSnip",

		version = "v2.*",

		build = "make install_jsregexp",
	},

	"rafamadriz/friendly-snippets", -- a bunch of snippets to use

	-- LSP

	{
		"neovim/nvim-lspconfig",
	}, -- enable LSP
	"williamboman/mason-lspconfig.nvim",
	{ "williamboman/mason.nvim", opts = { PATH = "append" } },
	{ "nvimtools/none-ls.nvim" },
	{
		"stevearc/conform.nvim",
		opts = {},
	},
	{
		"ldelossa/litee.nvim",
		event = "VeryLazy",
		opts = {
			notify = { enabled = false },
			panel = {
				orientation = "bottom",
				panel_size = 10,
			},
		},
		config = function(_, opts)
			require("litee.lib").setup(opts)
		end,
	},

	{
		"ldelossa/litee-calltree.nvim",
		dependencies = "ldelossa/litee.nvim",
		event = "VeryLazy",
		opts = {
			on_open = "panel",
			map_resize_keys = false,
		},
		config = function(_, opts)
			require("litee.calltree").setup(opts)
		end,
	},
	{

		"ray-x/lsp_signature.nvim",
	},
	"nvimdev/lspsaga.nvim",
	config = function()
		require("lspsaga").setup({
			symbol_in_winbar = { enablw = true, delay = 350 },
		})
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- optional
		"nvim-tree/nvim-web-devicons", -- optional
	},
	{ -- This plugin
		"Zeioth/compiler.nvim",
		cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
		dependencies = { "stevearc/overseer.nvim" },
		opts = {},
	},
	{ -- The task runner we use
		"stevearc/overseer.nvim",
		cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
		opts = {
			task_list = {
				direction = "bottom",
				min_height = 25,
				max_height = 25,
				default_detail = 1,
			},
		},
	},

	{
		"google/executor.nvim",
		dependencies = "MunifTanjim/nui.nvim",
		opts = {},
		cmd = {
			"ExecutorRun",
			"ExecutorSetCommand",
			"ExecutorShowDetail",
			"ExecutorHideDetail",
			"ExecutorToggleDetail",
			"ExecutorSwapToSplit",
			"ExecutorSwapToPopup",
			"ExecutorToggleDetail",
			"ExecutorReset",
		},
	},

	{
		"michaelb/sniprun",
		opts = {},
		build = "bash ./install.sh 1",
		cmd = "SnipRun",
	},

	{
		"p00f/clangd_extensions.nvim",
		lazy = true,
		ft = { "c", "cpp" },
		config = function() end,
		opts = {
			inlay_hints = {
				inline = false,
			},
			ast = {
				--These require codicons (https://github.com/microsoft/vscode-codicons)
				role_icons = {
					type = "",
					declaration = "",
					expression = "",
					specifier = "",
					statement = "",
					["template argument"] = "",
				},
				kind_icons = {
					Compound = "",
					Recovery = "",
					TranslationUnit = "",
					PackExpansion = "",
					TemplateTypeParm = "",
					TemplateTemplateParm = "",
					TemplateParamObject = "",
				},
			},
		},
	},
	{
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({})
		end,
	},
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},

		config = function()
			require("refactoring").setup()
		end,
	},
	"nvim-treesitter/nvim-treesitter-refactor",
	{
		"dense-analysis/ale",
		config = function()
			-- Configuration goes here.
			local g = vim.g

			g.ale_ruby_rubocop_auto_correct_all = 1
			g.ale_use_neovim_diagnostics_api = 1

			g.ale_linters = {
				ruby = { "rubocop", "ruby" },
				lua = { "lua_language_server" },
				cpp = { "cppcheck" },
			}
			g.ale_fixers = {
				ruby = { "rubocop" },
				lua = { "stylua" },
				cpp = { "clangtidy", "clang-format" },
			}
		end,
	},
	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-ui-select.nvim" },
	},
	"nvim-telescope/telescope-fzf-native.nvim",
	"nvim-telescope/telescope-media-files.nvim",

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				vim.list_extend(opts.ensure_installed, { "c", "cpp" })
			end
		end,
	},
	"HiPhish/rainbow-delimiters.nvim",

	"windwp/nvim-ts-autotag",

	-- lualine
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
	},

	-- Comment
	"numToStr/Comment.nvim",
	"JoosepAlviste/nvim-ts-context-commentstring",

	-- bufferline
	{ "akinsho/bufferline.nvim", dependencies = "nvim-tree/nvim-web-devicons" },
	"moll/vim-bbye",

	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to  defaults
			})
		end,
	},
	{
		"petertriho/nvim-scrollbar",
		config = function()
			require("scrollbar").setup()
		end,
	},

	"ahmedkhalf/project.nvim",
	"pocco81/auto-save.nvim",
	{
		"stevearc/aerial.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
	{ "CRAG666/code_runner.nvim", config = true },
	{
		"mrcjkb/rustaceanvim",
		version = "^4", -- Recommended
		ft = { "rust" },
	},
	{
		"pwntester/octo.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			-- OR 'ibhagwan/fzf-lua',
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("octo").setup()
		end,
	},

	"AstroNvim/astrocommunity",
	"mfussenegger/nvim-dap",
	"theHamsta/nvim-dap-virtual-text",
	"jay-babu/mason-nvim-dap.nvim",
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
	-- install without yarn or npm
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	"echasnovski/mini.nvim",
	"github/copilot.vim",
	{
		"SmiteshP/nvim-navic",
		dependencies = { "neovim/nvim-lspconfig" },
		opts = {
			icons = {
				File = " ",
				Module = " ",
				Namespace = " ",
				Package = " ",
				Class = " ",
				Method = " ",
				Property = " ",
				Field = " ",
				Constructor = " ",
				Enum = " ",
				Interface = " ",
				Function = " ",
				Variable = " ",
				Constant = " ",
				String = " ",
				Number = " ",
				Boolean = " ",
				Array = " ",
				Object = " ",
				Key = " ",
				Null = " ",
				EnumMember = " ",
				Struct = " ",
				Event = " ",
				Operator = " ",
				TypeParameter = " ",
			},
			lsp = {
				auto_attach = true,
				preference = nil,
			},
			highlight = true,
			separator = " > ",
			depth_limit = 0,
			depth_limit_indicator = "..",
			safe_output = true,
			lazy_update_context = false,
			click = false,
			format_text = function(text)
				return text
			end,
		},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},
	{
		"karb94/neoscroll.nvim",
		opts = {},
	},
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
		{
			"CopilotC-Nvim/CopilotChat.nvim",
			dependencies = {
				{ "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
				{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
			},
			build = "make tiktoken", -- Only on MacOS or Linux
			opts = {
				-- See Configuration section for options
			},
			-- See Commands section for default commands if you want to lazy load on them
		},
	},
})
