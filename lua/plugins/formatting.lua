return {
  {
    "stevearc/conform.nvim",
    keys = {
      {
        "<leader>cf",
        function()
          local options = vim.g.disable_autoformat and { "Enable", "Disable" } or { "Disable", "Enable" }

          vim.ui.select(
            options,
            { prompt = "Format status " .. (vim.g.disable_autoformat and "disabled" or "enabled").. "> " },
            function(choice)
              if choice == "Enable" then
                vim.g.disable_autoformat = false
              else
                vim.g.disable_autoformat = true
              end
            end
          )
        end,
        desc = "Format status",
      },
    },
    opts = {
      format_on_save = function()
        if vim.g.disable_autoformat then
          return
        end
        return { timeout_ms = 500, lsp_format = "fallback" }
      end,
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        go = { "gofmt", "goimports" },
        rust = { "rustfmt", lsp_format = "fallback" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        html = { "prettierd", "prettier", stop_after_first = true },
        css = { "prettierd", "prettier", stop_after_first = true },
        htmlangular = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },
}
