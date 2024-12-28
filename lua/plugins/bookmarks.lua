local function get_bookmarks_path()
  local os_name = vim.uv.os_uname().sysname
  if os_name == "Linux" then
    return os.getenv("HOME") .. "/.config/BraveSoftware/Brave-Browser/Default/Bookmarks"
  elseif os_name == "Windows_NT" then
    return os.getenv("LOCALAPPDATA") .. "\\BraveSoftware\\Brave-Browser\\User Data\\Default\\Bookmarks"
  elseif os_name == "Darwin" then
    return os.getenv("HOME") .. "/Library/Application Support/BraveSoftware/Brave-Browser/Default/Bookmarks"
  else
    error("Unsupported OS")
  end
end

local function parse_bookmarks(file_path)
  local file = io.open(file_path, "r")
  if not file then
    error("Could not open Brave bookmarks file")
  end

  local content = file:read("*a")
  file:close()

  local data = vim.json.decode(content)
  local bookmarks = {}

  local function extract_bookmarks(node)
    if node.type == "url" then
      table.insert(bookmarks, { name = node.name, url = node.url })
    elseif node.children then
      for _, child in ipairs(node.children) do
        print("child", child.name)
        extract_bookmarks(child)
      end
    else
      for _, value in pairs(node) do
        extract_bookmarks(value)
      end
    end
  end

  extract_bookmarks(data.roots)
  return bookmarks
end

local function open_url(url)
  local os_name = vim.uv.os_uname().sysname
  local cmd
  if os_name == "Linux" then
    cmd = "xdg-open '" .. url .. "'"
  elseif os_name == "Windows_NT" then
    cmd = "start " .. url
  elseif os_name == "Darwin" then
    cmd = "open '" .. url .. "'"
  else
    error("Unsupported OS")
  end
  os.execute(cmd)
end

local function show_bookmarks()
  local bookmarks_file = get_bookmarks_path()
  local bookmarks = parse_bookmarks(bookmarks_file)
  local max_width = 80

  require("fzf-lua").fzf_exec(
    vim.tbl_map(function(b)
      local name = b.name:sub(1, max_width - 1)
      return string.format("%-" .. max_width .. "s %s", name, b.url)
    end, bookmarks),
    {
      actions = {
        ["default"] = function(selected)
          local url = selected[1]:sub(max_width + 2)
          print(url)
          open_url(url)
        end,
      },
    }
  )
end

vim.keymap.set("n", "<leader>sB", function()
  show_bookmarks()
end)

return {}