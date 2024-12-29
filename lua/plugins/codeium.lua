return {
  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspace_root = { use_lsp = true },
      enable_cmp_source = false,
      virtual_text = {
        enabled = true,
      },
    },
  },
}
