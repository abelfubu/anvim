vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.termguicolors = true

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Do not show tab characters
vim.opt.list = false

-- By default we want autoformat to be enabled
vim.g.disable_autoformat = vim.g.disable_autoformat or false

if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
  vim.o.shell = "pwsh"
  vim.o.shellcmdflag = "-NoLogo -ExecutionPolicy RemoteSigned -Command"
  vim.o.shellquote = ""
  vim.o.shellxquote = ""
end
