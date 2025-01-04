local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	replace = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	keys = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	win = {
		no_overlap = true,
		border = "rounded", -- none, single, double, shadow
		title_pos = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	filter = function(mapping)
		-- example to exclude mappings without a description
		-- return mapping.desc and mapping.desc ~= ""
		return true
	end, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = { { "<auto>", mode = "nxso" } }, -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local wk = require("which-key")
wk.add({
	{ "<leader>a", "<cmd>Alpha<cr>", desc = "Alpha", nowait = true, remap = false },
	{
		"<leader>P",
		"<cmd>lua require('telescope').extensions.projects.projects()<cr>",
		desc = "Projects",
		nowait = true,
		remap = false,
	},
	{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer", nowait = true, remap = false },
	{ "<leader>w", "<cmd>w!<CR>", desc = "Save", nowait = true, remap = false },
	{ "<leader>q", "<cmd>q!<CR>", desc = "Quit", nowait = true, remap = false },
	{ "<leader>c", "<cmd>Bdelete!<CR>", desc = "Close Buffer", nowait = true, remap = false },
	{ "<leader>h", "<cmd>nohlsearch<CR>", desc = "No Highlight", nowait = true, remap = false },
	{
		"<leader>b",
		"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
		desc = "Buffers",
		nowait = true,
		remap = false,
	},
	{ "<leader>F", "<cmd>Telescope live_grep<cr>", desc = "Find Text", nowait = true, remap = false },
	{
		"<leader>P",
		"<cmd>lua require('telescope').extensions.projects.projects()<cr>",
		desc = "Projects",
		nowait = true,
		remap = false,
	},
	{ "<leader>p", group = "Lazy", nowait = true, remap = false },
	{ "<leader>pS", "<cmd>Lazy check<cr>", desc = "Check", nowait = true, remap = false },
	{ "<leader>pc", "<cmd>Lazy profile<cr>", desc = "Profile", nowait = true, remap = false },
	{ "<leader>pi", "<cmd>Lazy install<cr>", desc = "Install", nowait = true, remap = false },
	{ "<leader>ps", "<cmd>Lazy sync<cr>", desc = "Sync", nowait = true, remap = false },
	{ "<leader>pu", "<cmd>Lazy update<cr>", desc = "Update", nowait = true, remap = false },
	{ "<leader>g", group = "Git", nowait = true, remap = false },
	{ "<leader>g", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", desc = "Lazygit", nowait = true, remap = false },
	{ "<leader>j", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "Next Hunk", nowait = true, remap = false },
	{ "<leader>k", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "Prev Hunk", nowait = true, remap = false },
	{ "<leader>l", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame", nowait = true, remap = false },
	{
		"<leader>p",
		"<cmd>lua require 'gitsigns'.preview_hunk()<cr>",
		desc = "Preview Hunk",
		nowait = true,
		remap = false,
	},
	{ "<leader>r", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk", nowait = true, remap = false },
	{
		"<leader>R",
		"<cmd>lua require 'gitsigns'.reset_buffer()<cr>",
		desc = "Reset Buffer",
		nowait = true,
		remap = false,
	},
	{ "<leader>s", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk", nowait = true, remap = false },
	{
		"<leader>u",
		"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
		desc = "Undo Stage Hunk",
		nowait = true,
		remap = false,
	},
	{ "<leader>o", "<cmd>Telescope git_status<cr>", desc = "Open changed file", nowait = true, remap = false },
	{ "<leader>b", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch", nowait = true, remap = false },
	{ "<leader>c", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit", nowait = true, remap = false },
	{
		"<leader>d",
		"<cmd>Gitsigns diffthis HEAD<cr>",
		desc = "Diff",
		nowait = true,
		remap = false,
	},
	{ "<leader>l", group = "LSP", nowait = true, remap = false },
	{ "<leader>lI", "<cmd>Mason<cr>", desc = "Installer Info", nowait = true, remap = false },
	{
		"<leader>lS",
		"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
		desc = "Workspace Symbols",
		nowait = true,
		remap = false,
	},
	{ "<leader>la", "<cmd>Lspsaga code_action<CR>", desc = "Code Action", nowait = true, remap = false },
	{
		"<leader>ld",
		"<cmd>Telescope lsp_document_diagnostics<cr>",
		desc = "Document Diagnostics",
		nowait = true,
		remap = false,
	},
	{ "<leader>lf", "<cmd>lua vim.lsp.buf.format {async=false}<cr>", desc = "Format", nowait = true, remap = false },
	{ "<leader>li", "<cmd>LspInfo<cr>", desc = "Info", nowait = true, remap = false },
	{ "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "Next Diagnostic", nowait = true, remap = false },
	{ "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic", nowait = true, remap = false },
	{ "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action", nowait = true, remap = false },
	{ "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix", nowait = true, remap = false },
	{ "<leader>lr", "<cmd>Lspsaga rename<CR>", desc = "Rename", nowait = true, remap = false },
	{
		"<leader>ls",
		"<cmd>Telescope lsp_document_symbols<cr>",
		desc = "Document Symbols",
		nowait = true,
		remap = false,
	},
	{ "<leader>lt", "<cmd>TroubleToggle<cr>", desc = "Trouble", nowait = true, remap = false },
	{ "<leader>lw", "<cmd>Telescope diagnostics<cr>", desc = "Workspace Diagnostics", nowait = true, remap = false },
	{ "<leader>s", group = "Search", nowait = true, remap = false },
	{ "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands", nowait = true, remap = false },
	{ "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages", nowait = true, remap = false },
	{ "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers", nowait = true, remap = false },
	{ "<leader>sb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch", nowait = true, remap = false },
	{ "<leader>sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme", nowait = true, remap = false },
	{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help", nowait = true, remap = false },
	{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps", nowait = true, remap = false },
	{ "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File", nowait = true, remap = false },

	{ "<leader>t", group = "Terminal", nowait = true, remap = false },
	{ "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float", nowait = true, remap = false },
	{
		"<leader>th",
		"<cmd>ToggleTerm size=10 direction=horizontal<cr>",
		desc = "Horizontal",
		nowait = true,
		remap = false,
	},
	{ "<leader>tn", "<cmd>TermExec cmd='node'<cr>", desc = "Node", nowait = true, remap = false },
	{ "<leader>tt", "<cmd>TermExec cmd='htop'<cr>", desc = "Htop", nowait = true, remap = false },
	{ "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Vertical", nowait = true, remap = false },
})
