return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "lua",
      "javascript",
      "python",
      "html",
      "bash",
      "json",
      "c",
    },
    highlight = { enable = true },
    indent = { enable = true },
  },
}
