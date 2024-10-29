vim.g.mapleader = " "


-- normal mode
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- vim.keymap.set("n", "<C-f>", vim.cmd.Ex)

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader><CR>", "o<Esc>")


-- insert mode
vim.keymap.set("i", "<C-c>", "<esc>")
vim.keymap.set("i", "<C-j>", "<esc>o")
vim.keymap.set("i", "<C-k>", "<esc>O")

-- visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
