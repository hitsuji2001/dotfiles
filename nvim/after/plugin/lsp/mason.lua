local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

mason_lspconfig.setup({
  ensure_installed = {
    -- Replace these with whatever servers you want to install
    'pyright',
    'rust_analyzer',
  },
  automatic_installation = false,
})
