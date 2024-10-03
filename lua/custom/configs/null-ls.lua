local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

local opts = {
  sources = {
    null_ls.builtins.formatting.prettierd,          -- Existing prettier setup
    null_ls.builtins.formatting.black,              -- Add Black for Python formatting
    null_ls.builtins.formatting.google_java_format, -- Add Google Java Format here
    null_ls.builtins.formatting.clang_format,       -- Add clang-format for C/C++
    null_ls.builtins.formatting.shfmt,              -- Shell formatter (Bash)
    null_ls.builtins.formatting.yamlfmt,            -- YAML formatter
    null_ls.builtins.formatting.terraform_fmt,      -- Terraform formatter
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
}

return opts
