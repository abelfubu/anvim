return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Neotree toggle" } },
    },
    opts = {
      popup_border_style = "rounded",
      window = {
        position = "right",
        width = 75,
        -- mappings = {
        --   ["s"] = function(state)
        --     local node = state.tree:get_node()
        --     if node.type == "file" then
        --       vim.cmd("Neotree open_vsplit")
        --       vim.cmd("Neotree close")
        --     end
        --   end,
        -- },
      },
    },
  },
}
