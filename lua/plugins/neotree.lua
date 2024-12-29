return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({ toggle = true })
        end,
        { desc = "Neotree toggle" },
      },
    },
    opts = {
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
      },
      popup_border_style = "rounded",
      window = {
        position = "right",
        width = 75,
      },
    },
  },
}
