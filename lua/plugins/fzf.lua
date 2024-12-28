return {
  "ibhagwan/fzf-lua",
  keys = {
    { "<leader><leader>", "<cmd>FzfLua files<CR>", { desc = "Fzf Find files" } },
    { "<leader>sl", "<cmd>FzfLua live_grep<CR>", { desc = "Fzf live grep" } },
    { "<leader>sg", "<cmd>FzfLua grep<CR>", { desc = "Fzf grep" } },
    { "<leader>bb", "<cmd>FzfLua buffers<CR>", { desc = "Fzf buffers" } },
    { "<leader>sb", "<cmd>FzfLua blines<CR>", { desc = "Fzf buffers" } },
    { "<leader>sk", "<cmd>FzfLua keymaps<CR>", { desc = "Fzf keymaps" } },
    { "<leader>ss", "<cmd>FzfLua lsp_document_symbols<CR>", { desc = "Fzf document symbols" } },
    { "<leader>sS", "<cmd>FzfLua lsp_workspace_symbols<CR>", { desc = "Fzf workspace symbols" } },
    { "<leader>sh", "<cmd>FzfLua helptags<CR>", { desc = "Fzf helptags" } },
    { "gr", "<cmd>FzfLua lsp_references<CR>", { desc = "Fzf lsp references" } },
    { "<leader>ca", "<cmd>FzfLua lsp_code_actions<CR>", { desc = "Fzf lsp code actions" } },
  },
  opts = function()
    local config = require("fzf-lua.config")

    config.defaults.keymap.fzf["ctrl-q"] = "select-all+accept"
    config.defaults.keymap.fzf["ctrl-u"] = "half-page-up"
    config.defaults.keymap.fzf["ctrl-d"] = "half-page-down"
    config.defaults.keymap.fzf["ctrl-x"] = "jump"
    config.defaults.keymap.fzf["ctrl-f"] = "preview-page-down"
    config.defaults.keymap.fzf["ctrl-b"] = "preview-page-up"
    config.defaults.keymap.builtin["<c-f>"] = "preview-page-down"
    config.defaults.keymap.builtin["<c-b>"] = "preview-page-up"
    config.defaults.actions.files["ctrl-t"] = require("trouble.sources.fzf").actions.open

    return {
      defaults = {
        formatter = "path.filename_first",
      },
      winopts = {
        preview = {
          hidden = "hidden",
        },
      },
      fzf_args = "--no-header",
    }
  end,
}
