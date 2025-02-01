-- Variable to shorten making keybinds
local map = vim.keymap.set

-- Leader key
vim.g.mapleader = " "

-- Common keybinds that is available in a lot of text-editing software e.g. Notepad
-- "Control + S" to save file
map("n", "<C-s>", "<CMD>w<CR>", { desc = "Save File" })

-- Cursor movement in insert mode
map("i", "<C-b>", "<Esc>^i", { desc = "Move to The Beginning of The Line" })
map("i", "<C-e>", "<End>", { desc = "Move to The End of The Line" })

-- Useful keybinds
-- Toggle line numbers and realtive line numbers
map("n", "<leader>n", "<CMD>set nu!<CR>", { desc = "Absolute Line Numbers" })
map("n", "<leader>nr", "<CMD>set rnu!<CR>", { desc = "Relative Line Numbers" })

-- Buffer controls
map("n", "<leader>bn", "<CMD>bn<CR>", { desc = "Go To Next Buffer" })
map("n", "<leader>bp", "<CMD>bp<CR>", { desc = "Go To Previous Buffer" })
map("n", "<leader>bd", "<CMD>bd<CR>", { desc = "Close Current Buffer" })
