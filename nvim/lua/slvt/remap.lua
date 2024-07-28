vim.g.mapleader = " " -- set the leader key to be the space button
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- keybind to open netrw


-- move selected text with J and K while in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") 

-- move below line to the end of the one with your cursos mantaining 
-- cursor position
vim.keymap.set("n", "J", "mzJ`z")

-- move half page bind now mantains cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- delete the highlighted words into the void registr
-- so it paste itself while mantaining copynpaste
vim.keymap.set("x", "<leader>p", "\"_dP")

--- not working needs fix later
---vim.keymap.set("n", "<leader>y", "\"+y")
---vim.keymap.set("v", "<leader>y", "\"+y")
---vim.keymap.set("n", "<leader>Y", "\"+Y")

--- more of the above one but now for normal and visual modes too
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

--- making ctrl+c behave like esc in all situations 
vim.keymap.set("i", "<C-c>", "<Esc>")

--- not sure ngl
vim.keymap.set("n", "Q", "<nop>")

-- not working or am i ritartd? 
---vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
---vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
---
---vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
---vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz")

--- sexy search and replace pog
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
