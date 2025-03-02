vim.opt.termguicolors = true
local status_ok, ibl = pcall(require, "ibl")
if not status_ok then
	return
end

ibl.setup({
	exclude = {
		buftypes = { "terminal", "nofile" },
		filetypes = {
			"help",
			"startify",
			"dashboard",
			"lazy",
			"neogitstatus",
			"NvimTree",
			"Trouble",
		},
	},
	indent = {
		char = "▏",
		highlight = "IndentBlanklineChar",
	},
	scope = {
		enabled = true,
		highlight = "IndentBlanklineContextChar",
		include = {
			node_type = {
				"class",
				"return",
				"function",
				"method",
				"^if",
				"^while",
				"jsx_element",
				"^for",
				"^object",
				"^table",
				"block",
				"arguments",
				"if_statement",
				"else_clause",
				"jsx_element",
				"jsx_self_closing_element",
				"try_statement",
				"catch_clause",
				"import_statement",
				"operation_type",
			},
		},
	},
})

-- HACK: work-around for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
vim.wo.colorcolumn = "99999"

vim.cmd([[highlight IndentBlanklineChar guifg=#292929]])
vim.cmd([[highlight IndentBlanklineContextChar guifg=#fcdb03]])
