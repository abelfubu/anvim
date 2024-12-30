return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "helix",
      spec = {
        {
          {
            mode = { "n", "v" },
            { "<leader>t", "", group = "Test", icon = { icon = "󰙨", color = "blue" } },
            { "<leader>a", group = "Avante", icon = { icon = "", color = "orange" } },
            { "<leader>x", group = "Trouble", icon = { icon = "", color = "yellow" } },
            { "<leader>z", group = "Zen", icon = { icon = "󰰶", color = "cyan" } },
            { "<leader>d", group = "Debug", icon = { icon = "", color = "red" } },
            { "<leader>b", group = "Buffer", icon = { icon = "", color = "green" } },
            { "<leader>c", group = "Code", icon = { icon = "", color = "blue" } },
            { "<leader>g", group = "Git", icon = { icon = "", color = "yellow" } },
            { "<leader>n", group = "Npm", icon = { icon = "", color = "orange" } },
            { "<leader>f", group = "Fzf", icon = { icon = "", color = "cyan" } },
            { "<leader>q", group = "Session", icon = { icon = "", color = "red" } },
            { "<leader>s", group = "Search", icon = { icon = "", color = "blue" } },
            { "<leader>w", group = "Work", icon = { icon = "", color = "red" } },
          },
        },
      },
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
}
