return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add          = { text = "┃" },
      change       = { text = "┃" },
      delete       = { text = "_" },
      topdelete    = { text = "‾" },
      changedelete = { text = "~" },
      untracked    = { text = "┆" },
    },
    signcolumn = true,
    numhl      = false,
    linehl     = false,
    word_diff  = false,

    on_attach = function(bufnr)
      local gitsigns = require("gitsigns")

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      map("n", "]c", function()
        if vim.wo.diff then
          vim.cmd.feedkeys(vim.api.nvim_replace_termcodes("]c", true, true, true), "n", false)
        else
          gitsigns.nav_hunk("next")
        end
      end, { desc = "Siguiente cambio de Git" })

      map("n", "[c", function()
        if vim.wo.diff then
          vim.cmd.feedkeys(vim.api.nvim_replace_termcodes("[c", true, true, true), "n", false)
        else
          gitsigns.nav_hunk("prev")
        end
      end, { desc = "Cambio de Git anterior" })

      -- Actions
      map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Preparar (stage) cambio" })
      map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Deshacer (reset) cambio" })
      map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Previsualizar cambio flotante" })
      map("n", "<leader>hb", function() gitsigns.blame_line({ full = true }) end, { desc = "Ver Git Blame (autor de la línea)" })
      map("n", "<leader>hd", gitsigns.diffthis, { desc = "Ver diff del archivo" })
    end,
  },
}
