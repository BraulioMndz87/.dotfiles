return {
  {
    "williamboman/mason.nvim",
    config = true,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "clangd",
          "ts_ls",
        },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      -- 🔧 Lua
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      vim.lsp.config("pyright", {})

      vim.lsp.config("clangd", {})

      vim.lsp.config("ts_ls", {})

      vim.lsp.enable({
        "lua_ls",
        "pyright",
        "clangd",
        "ts_ls",
      })
    end,
  },
}
