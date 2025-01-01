local mocha = require("catppuccin.palettes").get_palette("mocha")

local get_icon_by_lsp = function(client_name)
  local lsp_map = {
    angularls = "󰚿",
    lua_ls = "󰢱",
    eslint = "",
    vtsls = "",
    gopls = "",
    tsserver = "",
    cssls = "",
    rustls = "󱘗",
    html = "",
    emmet_ls = "󰟛",
    jsonls = "",
  }

  return lsp_map[client_name] or "uknown-lsp"
end

---@class LualineItem
---@field color string
---@field value function|string
---@field icon function|string
---@field format? function

---Creates a lua line item
---@param items LualineItem[]
local create_lualine_items = function(items)
  local result = {}

  for _, item in ipairs(items) do
    table.insert(result, {
      type(item.icon) == "function" and item.icon or function()
        return item.icon
      end,
      separator = { left = "", right = "" },
      padding = { left = 0, right = 1 },
      color = { fg = mocha.base, bg = item.color },
    })

    table.insert(result, {
      item.value,
      color = { fg = item.color, bg = "None", gui = "bold" },
      fmt = item.format,
    })
  end

  return result
end

return {

  {
    "nvim-lualine/lualine.nvim",
    enabled = true,
    event = "VeryLazy",
    opts = function()
      local lualine_require = require("lualine_require")

      lualine_require.require = require

      vim.o.laststatus = vim.g.lualine_laststatus

      local opts = {
        options = {
          theme = "catppuccin-mocha",
          globalstatus = true,
        },
        sections = {
          lualine_a = {
            {
              "mode",
              padding = { left = 1, right = 0 },
              separator = "",
              color = { fg = mocha.blue, gui = "bold", bg = "None" },
              fmt = function(str)
                local modeMap = {
                  NORMAL = " ",
                  INSERT = " ",
                  VISUAL = "󰕢 ",
                  REPLACE = "󰛔 ",
                  COMMAND = " ",
                  TERMINAL = " ",
                  ["V-LINE"] = "󰒉 ",
                  ["V-BLOCK"] = "󰩭 ",
                }

                return (modeMap[str] or "")
              end,
            },
          },
          lualine_b = {
            {
              "branch",
              icon = { "󰊢", align = "left" },
              separator = "",
              padding = { left = 1, right = 1 },
              color = { fg = mocha.yellow, gui = "bold", bg = "None" },
            },
          },
          lualine_c = {
            {
              "diagnostics",
              separator = "",
            },
            {
              "diff",
              symbols = {
                added = " ",
                modified = " ",
                removed = " ",
              },
              source = function()
                local gitsigns = vim.b.gitsigns_status_dict
                if gitsigns then
                  return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                  }
                end
              end,
            },
          },
          lualine_x = {
            {
              cond = function()
                return vim.fn.reg_recording() ~= ""
              end,
              function()
                -- return "󰑋"
                return "󰄀"
              end,
              separator = { left = "", right = "" },
              color = { bg = mocha.red, fg = mocha.base },
              padding = { left = 0, right = 1 },
            },
            {
              function()
                local rec = vim.fn.reg_recording()
                if rec ~= "" then
                  return "@" .. rec
                end
                return ""
              end,
              color = { fg = mocha.red, gui = "bold" },
              separator = { left = "", right = "" },
            },
          },
          lualine_y = create_lualine_items({
            {
              color = mocha.yellow,
              icon = function()
                return vim.g.disable_autoformat and "" or ""
              end,
              value = function()
                return ""
              end,
            },
          }),
          lualine_z = create_lualine_items({
            {
              color = mocha.blue,
              icon = "󰗊",
              value = function()
                local clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })

                if #clients == 0 then
                  return " "
                end

                local names = vim.tbl_map(function(client)
                  return get_icon_by_lsp(client.name)
                end, clients)

                return table.concat(names, " ") .. " "
              end,
            },
            {
              color = mocha.pink,
              icon = "󰴊",
              value = function()
                return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
              end,
            },
          }),
        },
        extensions = { "neo-tree", "lazy" },
      }

      return opts
    end,
  },
}
