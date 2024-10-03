local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

local servers = {
  "ts_ls",
  "tailwindcss",
  "eslint",
  "pyright",
  "jdtls",
  "clangd",
  "bashls",      -- Add Bash LSP
  "yamlls",      -- Add YAML LSP
  "dockerls",    -- Add Dockerfile LSP
  "terraformls", -- Add Terraform LSP
  "jsonls",      -- Add JSON LSP
  "cssls",       -- Add CSS language server here
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
