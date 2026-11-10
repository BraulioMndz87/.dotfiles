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
          "basedpyright",
          "clangd",
          "ts_ls",
        },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })
      vim.lsp.config("basedpyright", {
        settings = {
          basedpyright = {
            analysis = {
              semanticTokensProvider = true,
            },
          },
        },
      })

      vim.lsp.config("clangd", {})
      vim.lsp.config("ts_ls", {})

      vim.lsp.enable({
        "lua_ls",
        "basedpyright",
        "clangd",
        "ts_ls",
      })
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf, silent = true }

          -- Ver documentación de la función bajo el cursor (Hover)
          -- Presionas 'K' en modo normal y abre un flotante con la info
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

          -- Ir a la definición de la variable/función (Donde se creó)
          -- Presionas 'gd' (Go to Definition)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

          -- Ir a la declaración
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

          -- Ver dónde se está usando/referenciando esa variable en el proyecto
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

          -- Renombrar una variable/función en TODO el archivo de forma segura
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

          -- Ver las "Acciones de Código" sugeridas por el LSP (ej. importar una librería faltante)
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        end,
      })
    end,
  },
}
