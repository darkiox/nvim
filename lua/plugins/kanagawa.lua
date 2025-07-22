return {
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				theme = "dragon",
			})
			vim.cmd("colorscheme kanagawa-dragon")

			-- Base backgrounds
			vim.api.nvim_set_hl(0, "Normal", { bg = "#1e1d1d" })
			vim.api.nvim_set_hl(0, "NormalNC", { bg = "#1e1d1d" })
			vim.api.nvim_set_hl(0, "SignColumn", { bg = "#1e1d1d" })
			vim.api.nvim_set_hl(0, "MsgArea", { bg = "#1e1d1d" })

			-- Set floating window background transparent
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })

			-- Diagnostic floating content transparent
			vim.api.nvim_set_hl(0, "DiagnosticFloating", { bg = "NONE" })

			-- Optional: Diagnostic virtual text color tweak
			vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#FF5555", bg = "NONE" })

			-- Custom border with DiagnosticFloatingBorder highlight
			local border = {
				{ "╭", "DiagnosticFloatingBorder" },
				{ "─", "DiagnosticFloatingBorder" },
				{ "╮", "DiagnosticFloatingBorder" },
				{ "│", "DiagnosticFloatingBorder" },
				{ "╯", "DiagnosticFloatingBorder" },
				{ "─", "DiagnosticFloatingBorder" },
				{ "╰", "DiagnosticFloatingBorder" },
				{ "│", "DiagnosticFloatingBorder" },
			}

			-- Setup autocmd for diagnostic float with custom border and winblend for transparency

			vim.api.nvim_create_autocmd("CursorHold", {
				callback = function()
					-- Only close diagnostic floating windows
					for _, win in ipairs(vim.api.nvim_list_wins()) do
						local config = vim.api.nvim_win_get_config(win)
						local buf = vim.api.nvim_win_get_buf(win)
						if config.relative ~= "" then
							local ft = vim.api.nvim_buf_get_option(buf, "filetype")
							-- This checks if it's a temporary diagnostic buffer (unnamed & empty filetype)
							if ft == "" and vim.api.nvim_buf_get_name(buf) == "" then
								vim.api.nvim_win_close(win, true)
							end
						end
					end

					vim.diagnostic.open_float(nil, {
						focusable = false,
						scope = "cursor",
						header = "",
						border = border,
						source = false,
						prefix = "",
						suffix = "",
						winblend = 15,
						format = function(diagnostic)
							return diagnostic.message or ""
						end,
					})
				end,
			})
		end,
	},
}
