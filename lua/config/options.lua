vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false

-- Do not show tab characters
vim.opt.list = false

if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
  vim.o.shell = "pwsh"
  vim.o.shellcmdflag = "-NoLogo -ExecutionPolicy RemoteSigned -Command"
  vim.o.shellquote = ""
  vim.o.shellxquote = ""
end
