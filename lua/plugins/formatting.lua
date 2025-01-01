local prettier_options = { "prettierd", "prettier", stop_after_first = true }

return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    keys = {
      {
        "<leader>cf",
        function()
          local options = vim.g.disable_autoformat and { "Enable", "Disable" } or { "Disable", "Enable" }

          vim.ui.select(
            options,
            { prompt = "Format status " .. (vim.g.disable_autoformat and "disabled" or "enabled") .. "> " },
            function(choice)
              if choice == "Enable" then
                vim.g.disable_autoformat = false
              elseif choice == "Disable" then
                vim.g.disable_autoformat = true
              end
            end
          )
        end,
        desc = "Format status",
      },
    },
    opts = {
      format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 500, lsp_format = "fallback" }
      end,
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        go = { "gofmt", "goimports" },
        rust = { "rustfmt", lsp_format = "fallback" },
        javascript = prettier_options,
        json = prettier_options,
        typescript = prettier_options,
        html = prettier_options,
        css = prettier_options,
        htmlangular = prettier_options,
      },
    },
  },
}
