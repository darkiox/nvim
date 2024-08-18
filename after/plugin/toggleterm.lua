-- First, ensure toggleterm is set up
require("toggleterm").setup{
  -- You can add any additional setup options here
}

-- Key binding for Alt+Shift+T to toggle terminal visibility
vim.api.nvim_set_keymap("n", "<A-T>", ":ToggleTerm<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<A-T>", "<C-\\><C-n>:ToggleTerm<CR>", { noremap = true, silent = true })

-- Key binding for Alt+T to toggle focus between terminal and current buffer without hiding terminal
vim.api.nvim_set_keymap("n", "<A-t>", "<C-w>w", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<A-t>", "<C-\\><C-n><C-w>w", { noremap = true, silent = true })

