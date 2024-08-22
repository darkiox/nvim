vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.api.nvim_set_keymap('n', '<C-L><C-L>', [[:lua vim.wo.relativenumber = not vim.wo.relativenumber vim.wo.number = true vim.cmd('highlight CursorLineNr guifg=#FFA500')<CR>]], { noremap = true, silent = true })

-- Function to toggle wrap, linebreak, and breakindent
function ToggleWrap()
    if vim.wo.wrap then
        vim.wo.wrap = false
        vim.wo.linebreak = false
        vim.wo.breakindent = false
    else
        vim.wo.wrap = true
        vim.wo.linebreak = true
        vim.wo.breakindent = true
    end
end

-- Map Alt+Z to toggle wrap
vim.api.nvim_set_keymap('n', '<A-z>', ':lua ToggleWrap()<CR>', { noremap = true, silent = true })

-- Ctrl arrows resize
vim.api.nvim_set_keymap('n', '<C-Up>',    ':resize +2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Down>',  ':resize -2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Left>',  ':vertical resize -2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize +2<CR>', { noremap = true, silent = true })

-- Remap Ctrl+c to copy (yank) in visual mode
vim.api.nvim_set_keymap('v', '<C-c>', 'y', { noremap = true, silent = true })

-- Remap Ctrl+v to paste in visual mode
vim.api.nvim_set_keymap('v', '<C-v>', 'p', { noremap = true, silent = true })

