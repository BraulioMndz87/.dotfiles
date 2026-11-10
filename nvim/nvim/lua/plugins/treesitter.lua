return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({
      ensure_installed = {
        "bash",
        "c",
        "html",
        "javascript",
        "json",
        "lua",
        "python",
        "query",
        "vim",
        "vimdoc"
      },
      synv_install = false,
      highlight = {
        enable = true,
        aditional_vim_regex_highlighting = false,
    },
      indent = { enable = true },
    })
  end
}
