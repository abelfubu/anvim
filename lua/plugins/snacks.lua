return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
		-- stylua: ignore
    keys = {
			---@diagnostic disable-next-line: missing-fields
      { "<leader>gg", function() require("snacks").lazygit({ cwd = vim.fn.getcwd() }) end, desc = "Lazygit (Root Dir)" },
      { "<leader>gG", function() require("snacks").lazygit() end, desc = "Lazygit (cwd)" },
      { "<leader>gf", function() require("snacks").lazygit.log_file() end, desc = "Laz{ story" },
			---@diagnostic disable-next-line: missing-fields
      { "<leader>gl", function() require("snacks").lazygit.log({ cwd = vim.fn.getcwd() }) end, desc = "Lazygit Log" },
      { "<leader>gL", function() require("snacks").lazygit.log() end, desc = "Lazygit Log (cwd)" },
      { "<leader>gb", function() require("snacks").git.blame_line() end, desc = "Git blame line" },
      { "<leader>bo", function() require("snacks").bufdelete.other() end, desc = "Close other buffers" },
      { "<leader>zz", function() require("snacks").zen.zen() end, desc = "Zen mode" },
			{ "<leader>sn", function() require("snacks").notifier.show_history() end, desc = "Notifications" },
			{ "<c-/>", function() Snacks.terminal(nil) end, desc = "Terminal (Root Dir)" },
			{ "<c-_>", function() Snacks.terminal(nil) end, desc = "which_key_ignore" },
    },
    opts = {
      -- indent = { enabled = true, animate = { enabled = false } },
      lazygit = { enabled = true },
      zen = { enabled = true, toggles = { dim = false } },
      -- notifier = { enabled = true },
      terminal = { enabled = true },
      dim = { enabled = false },
      dashboard = {
        width = 78,
        sections = {
          {
            section = "terminal",
            padding = 1,
            cmd = "pwsh -NoProfile -Command " .. vim.fn.stdpath("config") .. "/assets/space_invaders.ps1",
            height = 10,
          },
          { { section = "keys", gap = 1, padding = 1 } },
        },
      },
    },
  },
}
