local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",      -- Python formatter
        "prettierd",  -- JavaScript/TypeScript/CSS/HTML formatter
        "clang-format", -- C/C++ formatter
        "eslint_d",   -- JavaScript/TypeScript linter/formatter
        -- Add more tools as needed...
        "eslint-lsp",
        "prettierd",
        "tailwindcss-language-server",
        "typescript-language-server",
        "pyright",                    -- Add pyright here for Python support
        "jdtls",                      -- Add jdtls for Java support
        "clangd",                     -- Add clangd for C/C++ support
        "bash-language-server",       -- Bash/Shell scripting support
        "yaml-language-server",       -- YAML support
        "dockerfile-language-server", -- Dockerfile support
        "terraform-ls",               -- Terraform support
        "json-lsp",                   -- JSON support
        "css-lsp",                    -- Add CSS language server
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      local opts = require "plugins.configs.treesitter"
      opts.ensure_installed = {
        "lua",
        "javascript",
        "typescript",
        "tsx",
        "python",     -- Add Python here
        "java",       -- Add Java support here
        "c",          -- Add C support
        "cpp",        -- Add C++ support
        "bash",       -- Add Bash support
        "yaml",       -- Add YAML support
        "json",       -- Add JSON support
        "dockerfile", -- Add Dockerfile support
        "hcl",        -- Add HCL support for Terraform
        "css",        -- Add CSS support here
      }
      return opts
    end,
  },
  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup {
        -- Your custom settings here
        enabled = true,        -- Start auto-save when the plugin is loaded
        execution_message = {
          message = function() -- Message that shows up on every save
            return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
          end,
        },
        events = { "InsertLeave", "TextChanged" }, -- Triggers for saving
        conditions = {
          exists = true,
          filename_is_not = {},
          filetype_is_not = {},
          modifiable = true,
        },
        write_all_buffers = true, -- Save all buffers or just the current one
        debounce_delay = 135,      -- Delay in milliseconds before saving
      }
    end,
  }
}
return plugins
