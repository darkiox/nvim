
function Catppuccin(color)
	color = color or "catppuccin"
	vim.cmd.colorscheme(color)
	
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.cmd [[
	highlight LineNr guifg=#ef9f76
	]]
	vim.cmd [[
	highlight CursorLineNr guifg=#8839ef
	]]
	-- Set solid background color (e.g., dark gray) when focused
	vim.api.nvim_set_hl(0, "Normal", { bg = "#292c3c" })

	-- Auto command to change background color on window focus
	vim.api.nvim_create_autocmd({"WinEnter", "FocusGained"}, {
		callback = function()
			vim.api.nvim_set_hl(0, "Normal", { bg = "#292c3c" }) -- Solid background color
		end,
	})

	-- Auto command to change background to transparent when not focused
	vim.api.nvim_create_autocmd({"WinLeave", "FocusLost"}, {
		callback = function()
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" }) -- Transparent background
		end,
	})
end

Catppuccin()
