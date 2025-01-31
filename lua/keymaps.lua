-- Leader key
vim.g.mapleader = " "

-- Keybindings
vim.keymap.set('n', '<leader>n', "<CMD>set nu!<CR>", { desc = "Absolute Line Numbers" })
vim.keymap.set('n', '<leader>rn', "<CMD>set rnu!<CR>", { desc = "Relative Line Numbers" })

-- Buffer controls
vim.keymap.set("n", "<leader>bn", "<CMD>bn<CR>", { desc = "Go To Next Buffer" })
vim.keymap.set("n", "<leader>bp", "<CMD>bp<CR>", { desc = "Go To Previous Buffer" })
vim.keymap.set("n", "<leader>bd", "<CMD>bd<CR>", { desc = "Close Current Buffer" })
