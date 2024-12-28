return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      transparent_background = true,
      no_italic = false,
      integrations = {
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
        treesitter = true,
        treesitter_context = true,
      },
    },
  },
}
