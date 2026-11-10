return {
  {
    "echasnovski/mini.hipatterns",
    version = "*",
    event = "BufReadPost",
    config = function()
      local hipatterns = require("mini.hipatterns")
      hipatterns.setup({
        highlighters = {
          hex_color = hipatterns.gen_highlighter.hex_color({
            render = function(bufnr, extmark_id, label, data)
              return { sign_text = "■ ", sign_hl_group = data.hl_group }
            end,
          }),
        },
      })
    end,
  },
}
