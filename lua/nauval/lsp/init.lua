local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end
require("lspconfig").clangd.setup({
	cmd = { "clangd", "--background-index" },
})
require("nauval.lsp.lsp-signature")
require("nauval.lsp.mason")
require("nauval.lsp.handlers").setup()
require("nauval.lsp.conform")
