return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      transparent_background = true,
      no_italic = false,
      integrations = {
        dropbar = { enabled = true },
        flash = true,
        fzf = true,
        gitsigns = true,
        headlines = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        neotest = true,
        neotree = true,
        noice = true,
        semantic_tokens = true,
        snacks = true,
        blink_cmp = true,
        treesitter = true,
        treesitter_context = true,
      },
      custom_highlights = function(colors)
        return {
          BlinkCmpMenuBorder = { fg = colors.blue },
        }
      end,
    },
  },
  { "olivercederborg/poimandres.nvim" },
  {
    "xero/miasma.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- require("nordic").load()
    end,
  },
  {
    "bettervim/yugen.nvim",
    config = function()
      -- vim.cmd.colorscheme("yugen")
    end,
  },
  {
    "datsfilipe/vesper.nvim",
    opts = {
      transparent = true,
      italics = {
        comments = false,
        keywords = false,
        functions = false,
        strings = false,
        variables = false,
      },
    },
  },
}
