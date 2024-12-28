return {
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<leader>gg",
        function()
          -- should get the root git folder
          require("snacks").lazygit({ cwd = vim.fn.getcwd() })
        end,
        { desc = "Lazygit (Root Dir)" },
      },
      {
        "<leader>gG",
        function()
          require("snacks").lazygit()
        end,
        { desc = "Lazygit (cwd)" },
      },
      {
        "<leader>gf",
        function()
          require("snacks").lazygit.log_file()
        end,
        { desc = "Laz{ story" },
      },
      {
        "<leader>gl",
        function()
          require("snacks").lazygit.log({ cwd = vim.fn.getcwd() })
        end,
        { desc = "Lazygit Log" },
      },
      {
        "<leader>gL",
        function()
          require("snacks").lazygit.log()
        end,
        { desc = "Lazygit Log (cwd)" },
      },
    },
    opts = {
      lazygit = {},
    },
  },
}
