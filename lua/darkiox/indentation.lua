-- Function to detect and set indentation
local function detect_indentation()
    -- Get the contents of the buffer
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, true)

    -- Variables to count spaces and tabs
    local space_indent = 0
    local tab_indent = 0

    -- Loop through the lines and check the indentation
    for _, line in ipairs(lines) do
        local spaces = string.match(line, "^%s+")
        if spaces then
            if string.find(spaces, "\t") then
                tab_indent = tab_indent + 1
            else
                space_indent = space_indent + 1
            end
        end
    end

    -- Set the options based on the counts
    if tab_indent > space_indent then
        vim.bo.expandtab = false
        vim.bo.tabstop = 4
        vim.bo.shiftwidth = 4
    else
        vim.bo.expandtab = true
        vim.bo.tabstop = 4
        vim.bo.shiftwidth = 4
    end
end

-- Autocommand to run the detection function on BufRead or BufEnter
vim.api.nvim_create_autocmd({"BufRead", "BufEnter"}, {
    pattern = "*",
    callback = detect_indentation
})

