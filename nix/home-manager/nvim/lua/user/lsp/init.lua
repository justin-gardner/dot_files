local status_ok, _ = pcall(require, "lspconfig")

if not status_ok then
  vim.notify("Failed to load lspconfig")

  return
end

require "user.lsp.mason"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"