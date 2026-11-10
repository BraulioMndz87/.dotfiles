return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      background = {
        dark = "mocha",
      },
      integrations = {
        treesitter = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
          inlay_hints = {
            background = true,
          },
        },
      },
      custom_highlights = function(colors)
        return {
          ["@variable"] = { fg = colors.saphire },
          ["@variable.builtin"] = { fg = colors.red, style = { "italic" } },
          ["@function"] = { fg = colors.blue, style = { "bold" } },
          ["@method"] = { fg = colors.teal },
          ["@function.builtin"] = { fg = colors.peach },
          ["@parameter"] = { fg = colors.maroon, style = { "italic" } },
        }
      end,
    })

    vim.cmd.colorscheme("catppuccin")
  end,
}
