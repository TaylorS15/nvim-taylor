return {
	{
		"datsfilipe/vesper.nvim",
		config = function()
			require("vesper").setup({
				transparent = true,
				italics = {
					comments = false,
					keywords = false,
					functions = false,
					strings = false,
					variables = false,
				},
				overrides = {
					-- Highlight groups need to be defined differently
					["String"] = { fg = "#9ad3d6" },
					["Constant"] = { fg = "#b3ceb8" },
					["Identifier"] = { fg = "#b3ceb8" },

					-- TreeSitter specific highlights
					["@string"] = { fg = "#9ad3d6" },
					["@constant"] = { fg = "#b3ceb8" },
					["@variable"] = { fg = "#b3ceb8" },
				},
				palette_overrides = {},
			})
			vim.cmd.colorscheme("vesper")
		end,
	},
}
