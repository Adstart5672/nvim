local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
	return
end

gitsigns.setup({
	signs = {
		add = { link = "GitSignsAdd", text = "▎", link = "GitSignsAddNr", link = "GitSignsAddLn" },
		change = { link = "GitSignsChange", text = "▎", link = "GitSignsChangeNr", link = "GitSignsChangeLn" },
		delete = { link = "GitSignsDelete", text = "󰐊", link = "GitSignsDeleteNr", link = "GitSignsDeleteLn" },
		topdelete = { link = "GitSignsDelete", text = "󰐊", link = "GitSignsDeleteNr", link = "GitSignsDeleteLn" },
		changedelete = { link = "GitSignsChange", text = "▎", link = "GitSignsChangeNr", link = "GitSignsChangeLn" },
	},
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir = {
		interval = 1000,
		follow_files = true,
	},
	attach_to_untracked = true,
	current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = false,
	},
	current_line_blame_formatter = {
		relative_time = false,
	},
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000,
	preview_config = {
		-- Options passed to nvim_open_win
		border = "single",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
})