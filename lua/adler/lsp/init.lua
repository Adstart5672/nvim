local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end
local navic = require("nvim-navic")
local on_attach = function(client, bufnr)
	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end
end

require("lspconfig").clangd.setup({
	cmd = { "clangd", "--background-index" },
	on_attach = on_attach,
})
require("lspconfig").ts_ls.setup({
	cmd = { "typescript-language-server", "--stidio" },
	on_attach = on_attach,
})
require("lspconfig").lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
		},
	},
	on_attach = on_attach,
})
require("adler.lsp.lsp-signature")
require("adler.lsp.mason")
require("adler.lsp.handlers").setup()
require("adler.lsp.conform")
