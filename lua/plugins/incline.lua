return {
  "b0o/incline.nvim",
  event = "BufReadPre",
  priority = 1200,
  config = function()
    local mocha = require("catppuccin.palettes").get_palette("mocha")

    require("incline").setup({
      highlight = {
        groups = {
          InclineNormal = { guibg = mocha.base, guifg = mocha.text },
          InclineNormalNC = { guibg = mocha.base, guifg = mocha.surface0 },
        },
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        if vim.bo[props.buf].modified then
          filename = "[*]" .. filename
        end

        local icon, color = require("nvim-web-devicons").get_icon_color(filename)

        return { { icon, guifg = color }, { " " }, { filename } }
      end,
    })
  end,
}
