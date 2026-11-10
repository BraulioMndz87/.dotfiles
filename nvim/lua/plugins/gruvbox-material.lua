return{
  "sainnhe/gruvbox-material",
  lazy = false,
  name = "gruvbox-material",
  priority = 1000,
  config = function()
    vim.g.gruvbox_material_transparent_background = 2
    vim.cmd.colorscheme "gruvbox-material"
  end
}
