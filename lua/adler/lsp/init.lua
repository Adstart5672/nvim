local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end
require("lspconfig").clangd.setup({
  cmd = { "clangd", "--background-index" },
})
require("lspconfig").tsserver.setup({
  cmd = { "typescript-language-server", "--stidio" },
})

require("adler.lsp.lsp-signature")
require("adler.lsp.mason")
require("adler.lsp.handlers").setup()
require("adler.lsp.conform")
