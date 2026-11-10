return{
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    vim.keymap.set('n', '<leader>n', ':Neotree filesystem reveal left<CR>', {})
  end,
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- Esto hace que los archivos ocultos se muestren por defecto
        hide_dotfiles = false,
        hide_gitignored = false, -- Opcional: por si también quieres ver lo que ignora git
      },
    },
  },
}
