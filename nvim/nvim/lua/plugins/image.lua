return {
  {
    "3rd/image.nvim",
    build = true,
    opts = {
      backend = "ueberzug",
      max_height_window_percentage = 50,
      hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.svg" },
    },
  },
}
