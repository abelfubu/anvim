return {
  "catppuccin/nvim",
  config = function()
    require("catppuccin").setup({
      transparent_background = true,
      no_italic = true,
      default_integrations = true,
      integrations = {
        neotree = true,
        fzf = true,
        treesitter = true,
      },
      custom_highlights = function(colors)
        return {
          TabLineSelSeparator = { fg = colors.yellow, bg = colors.base },
          TabLineSelSeparatorInv = { bg = colors.yellow, fg = colors.base },
          TabLineSeparator = { fg = colors.surface1, bg = colors.base },
          TabLineSeparatorInv = { fg = colors.base, bg = colors.surface1 },
          TabLine = { bg = colors.base },
          CursorLine = { bg = "None" },
          FzfLuaCursorLine = { bg = colors.surface0 },
        }
      end,
    })

    vim.cmd.colorscheme("catppuccin-mocha")
  end,
}
