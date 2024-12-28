local map = vim.keymap.set

map("n", "<C-s>", "<cmd>:wa<cr>")
map("n", "<C-q>", "<cmd>:qa!<cr>")
map("t", "<Esc><Esc>", "<C-\\><C-n>")
map("n", "<C-x>", "<cmd>bd!<CR>")
map("i", "<C-x>", "<cmd>bd!<CR>")
map("t", "<C-x>", "<cmd>bd!<CR>")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")
