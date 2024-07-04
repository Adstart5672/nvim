local status_ok, trouble = pcall(require, "trouble")


if not status_ok then
	return
end

trouble.setup({
	position = "bottom",
	width = 35,
	auto_preview = false,
  warn_no_results = false,
  open_no_results = true,
})

-- vim.cmd([[
--   autocmd!
--   autocmd VimEnter * silent!lua require('trouble').open()
--   autocmd VimEnter * ++nested split term://zsh
--   autocmd VimEnter * wincmd r
--   autocmd VimEnter * 4wincmd +
--   autocmd VimEnter * 1wincmd w
-- ]])
