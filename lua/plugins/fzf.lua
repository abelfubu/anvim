return {
  "ibhagwan/fzf-lua",
	-- stylua: ignore
  keys = {
    { "<leader><leader>", "<cmd>FzfLua files<CR>", desc = "Fzf Find files" },
    { "<C-p>", "<cmd>FzfLua files<CR>", desc = "Fzf Find files" },
    { "<leader>sl", "<cmd>FzfLua live_grep<CR>", desc = "Fzf live grep" },
    { "<leader>sg", "<cmd>FzfLua grep<CR>", desc = "Fzf grep" },
    { "<leader>bb", "<cmd>FzfLua buffers<CR>", desc = "Fzf buffers" },
    { "<leader>sb", "<cmd>FzfLua blines<CR>", desc = "Fzf buffers" },
    { "<leader>sk", "<cmd>FzfLua keymaps<CR>", desc = "Fzf keymaps" },
    { "<leader>ss", "<cmd>FzfLua lsp_document_symbols<CR>", desc = "Fzf document symbols" },
    { "<leader>sS", "<cmd>FzfLua lsp_workspace_symbols<CR>", desc = "Fzf workspace symbols" },
    { "<leader>sh", "<cmd>FzfLua helptags<CR>", desc = "Fzf helptags" },
    { "gr", "<cmd>FzfLua lsp_references<CR>", desc = "Fzf lsp references" },
    { "<leader>ca", "<cmd>FzfLua lsp_code_actions<CR>", desc = "Fzf lsp code actions" },
    { "<leader>ca", "<cmd>FzfLua lsp_code_actions<CR>", desc = "Fzf lsp code actions" },
    { "<leader>fc", function() require("fzf-lua").files({ cwd = vim.fn.stdpath("config") }) end, desc = "Fzf config files" },
		{ "<leader>gs", "<cmd>FzfLua git_status<CR>", desc = "Git status" },
		{ "<leader>gB", "<cmd>FzfLua git_branches<CR>", desc = "Git branches" },
		{ "<leader>gc", "<cmd>FzfLua git_bcommits<CR>", desc = "Git buffer commits" },
		{ "<leader>gC", "<cmd>FzfLua git_commits<CR>", desc = "Git commits" },
		{ "<leader>ff", "<cmd>FzfLua<CR>", desc = "Fzf builtins" },
		{ "<leader>fo", "<cmd>FzfLua oldfiles<CR>", desc = "Fzf oldfiles" },
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
      fzf_colors = true,
      defaults = {
        formatter = "path.filename_first",
      },
      winopts = {
        preview = {
          hidden = "hidden",
        },
        treesitter = {
          enable = true,
        },
      },
      fzf_args = "--no-header",
    }
  end,
}
