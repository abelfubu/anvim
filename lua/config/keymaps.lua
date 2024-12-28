local map = vim.keymap.set

map("n", "<C-s>", "<cmd>:wa<cr>")
map("n", "<leader>qq", "<cmd>:qa!<cr>")
map("t", "<Esc><Esc>", "<C-\\><C-n>")
map("n", "<C-x>", "<cmd>bd!<CR>")
map("i", "<C-x>", "<cmd>bd!<CR>")
map("t", "<C-x>", "<cmd>bd!<CR>")

-- Windows
map("n", "<C-l>", "<C-w>l")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

-- Splits
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })

-- Move Lines
vim.keymap.set("n", "<Up>", "mz:m-2<CR>`z==", { noremap = true, silent = true })
vim.keymap.set("n", "<Down>", "mz:m+<CR>`z==", { noremap = true, silent = true })
vim.keymap.set("i", "<Down>", "<Esc>:m+<CR>==gi", { noremap = true, silent = true })
vim.keymap.set("i", "<Up>", "<Esc>:m-2<CR>==gi", { noremap = true, silent = true })
vim.keymap.set("v", "<Down>", ":m'>+<CR>gv=`<my`>mzgv`yo`z", { noremap = true, silent = true })
vim.keymap.set("v", "<Up>", ":m'<-2<CR>gv=`>my`<mzgv`yo`z", { noremap = true, silent = true })
