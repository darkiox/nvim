require("darkiox.packer")
require("darkiox.remap")

vim.opt.clipboard = 'unnamedplus'

vim.wo.number = true

-- Autocommand to reload the buffer on Git checkout
vim.api.nvim_create_autocmd({"BufEnter", "FocusGained"}, {
    callback = function()
        if vim.fn.getbufvar(vim.fn.bufnr(), "&modifiable") == 1 then
            vim.cmd("checktime")
        end
    end,
})
