return {
	"EdenEast/nightfox.nvim",
	lazy = false, -- Load it immediately (before other plugins)
	priority = 1000, -- Make sure it’s applied first
	config = function()
		-- Enable true colors (needed for nightfox)
		vim.opt.termguicolors = true

		-- Optional: theme configuration
		require("nightfox").setup({
			options = {
				transparent = false, -- set to true if you want no background
				terminal_colors = true,
				styles = {
					comments = "italic",
					keywords = "bold",
					types = "italic,bold",
				},
			},
		})

		-- Load the Carbonfox variant
		vim.cmd("colorscheme carbonfox")
	end,
}
