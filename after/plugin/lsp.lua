-- Import the lspconfig plugin
local lspconfig = require('lspconfig')

-- Set up custom diagnostic highlights
vim.cmd [[
    highlight DiagnosticError guifg=#F28FAD
    highlight DiagnosticWarn guifg=#FAE3B0
    highlight DiagnosticInfo guifg=#96CDFB
    highlight DiagnosticHint guifg=#B5E8E0
]]

vim.diagnostic.config({
    virtual_text = {
        prefix = '●', -- Could be '■', '▎', '●'
        spacing = 4,
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

local signs = {
    Error = " ",
    Warn = " ",
    Hint = " ",
    Info = " "
}
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        local opts = {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            border = 'rounded',
            source = 'always',
            prefix = ' ',
            scope = 'cursor',
        }
        vim.diagnostic.open_float(nil, opts)
    end
})

require('lspconfig').pyright.setup{
    on_attach = function(client, bufnr)
        -- Enable document highlighting
        if client.server_capabilities.document_highlight then
            vim.api.nvim_exec([[
                augroup lsp_document_highlight
                    autocmd! * <buffer>
                    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
                augroup END
            ]], false)
        end
    end,
}

-- Diagnostic Highlights for Python
vim.cmd [[
    highlight DiagnosticError guifg=#F28FAD
    highlight DiagnosticWarn guifg=#FAE3B0
    highlight DiagnosticInfo guifg=#96CDFB
    highlight DiagnosticHint guifg=#B5E8E0
]]

require('lspconfig').gopls.setup{
    on_attach = function(client, bufnr)
        -- Enable document highlighting
        if client.server_capabilities.document_highlight then
            vim.api.nvim_exec([[
                augroup lsp_document_highlight
                    autocmd! * <buffer>
                    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
                augroup END
            ]], false)
        end
    end,
}

-- Diagnostic Highlights for Go
vim.cmd [[
    highlight DiagnosticError guifg=#F28FAD
    highlight DiagnosticWarn guifg=#FAE3B0
    highlight DiagnosticInfo guifg=#96CDFB
    highlight DiagnosticHint guifg=#B5E8E0
]]

require('lspconfig').ts_ls.setup{
    on_attach = function(client, bufnr)
        -- Enable document highlighting
        if client.server_capabilities.document_highlight then
            vim.api.nvim_exec([[
                augroup lsp_document_highlight
                    autocmd! * <buffer>
                    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
                augroup END
            ]], false)
        end
    end,
}

-- Diagnostic Highlights for JavaScript/TypeScript
vim.cmd [[
    highlight DiagnosticError guifg=#F28FAD
    highlight DiagnosticWarn guifg=#FAE3B0
    highlight DiagnosticInfo guifg=#96CDFB
    highlight DiagnosticHint guifg=#B5E8E0
]]


