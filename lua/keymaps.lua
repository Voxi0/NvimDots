-- Leader key
vim.g.mapleader = " "

-- Buffer controls
vim.keymap.set("n", "<leader>n", "<CMD>bn<CR>", { desc = "Go To Next Buffer" })
vim.keymap.set("n", "<leader>p", "<CMD>bp<CR>", { desc = "Go To Previous Buffer" })
vim.keymap.set("n", "<leader>d", "<CMD>bd<CR>", { desc = "Close Current Buffer" })
