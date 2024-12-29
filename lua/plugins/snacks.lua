return {
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<leader>gg",
        function()
          ---@diagnostic disable-next-line: missing-fields
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
      {
        "<leader>gb",
        function()
          require("snacks").git.blame_line()
        end,
        { desc = "Git blame line" },
      },
      {
        "<leader>bo",
        function()
          require("snacks").bufdelete.other()
        end,
        { desc = "Close other buffers" },
      },
    },
    opts = {
      lazygit = {},
      dashboard = {
        width = 78,
        sections = {
          {
            section = "terminal",
            cmd = vim.fn.stdpath("config") .. "/assets/space_invaders.ps1",
            padding = 1,
            height = 10,
          },
          { { section = "keys", gap = 1, padding = 1 } },
        },
      },
    },
  },
}
