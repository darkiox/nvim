vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.api.nvim_set_keymap('n', '<C-L><C-L>', [[:lua vim.wo.relativenumber = not vim.wo.relativenumber vim.wo.number = true vim.cmd('highlight CursorLineNr guifg=#FFA500')<CR>]], { noremap = true, silent = true })
