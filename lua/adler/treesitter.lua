local configs = require("nvim-treesitter.configs")
configs.setup({
	ensure_installed = { "tsx", "json", "bash", "markdown", "javascript", "lua", "css", "php", "typescript" },
	sync_install = false,
	ignore_install = { "" }, -- List of parsers to ignore installing
	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true, disable = { "yaml" } },
	autotag = {
		enable = true,
	},
	tree_setter = {
		enable = true,
	},
	refactor = {
		highlight_definitions = {
			enable = true,
		},
		-- Set to false if you have an `updatetime` of ~100.
		clear_on_cursor_move = true,
		smart_rename = {
			enable = true,
			-- Assign keymaps to false to disable them, e.g. `smart_rename = false`.
			keymaps = {
				smart_rename = "grr",
			},
		},
		navigation = {
			enable = true,
			-- Assign keymaps to false to disable them, e.g. `goto_definition = false`.
			keymaps = {
				goto_definition = "gnd",
				list_definitions = "gnD",
				list_definitions_toc = "gO",
				goto_next_usage = "<a-*>",
				goto_previous_usage = "<a-#>",
			},
		},
	},
})
require("ts_context_commentstring").setup({
	enable_autocmd = false,
})
