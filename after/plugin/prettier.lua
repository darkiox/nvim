local prettier = require("prettier")

prettier.setup({
  bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
})

-- Autocommand to format on save using the :Prettier command
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.css", "*.graphql", "*.html", "*.js", "*.jsx", "*.json", "*.less", "*.md", "*.scss", "*.ts", "*.tsx", "*.yaml" },
  command = "Prettier",
})

