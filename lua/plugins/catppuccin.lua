return {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	priority = 1000,
	opts = {
		integrations = {
			diffview = true,
		},
		custom_highlights = function(c)
			local U = require("catppuccin.utils.colors")
			return {
				DiffAdd = { bg = U.darken(c.green, 0.28, c.base) },
				DiffDelete = { bg = U.darken(c.red, 0.28, c.base) },
				DiffChange = { bg = U.darken(c.blue, 0.20, c.base) },
				DiffText = { bg = U.darken(c.yellow, 0.28, c.base), bold = true },
				DiffviewDiffAdd = { bg = U.darken(c.green, 0.28, c.base) },
				DiffviewDiffAddAsDelete = { bg = U.darken(c.red, 0.28, c.base) },
				DiffviewDiffDelete = { fg = c.overlay0, bg = "NONE" },

				-- reading line: soft bar + underline in the theme yellow
				CursorLine = { bg = c.surface0, underline = true, sp = c.green },
				CursorLineNr = { fg = c.yellow, bold = true },
			}
		end,
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin")
		vim.opt.cursorline = true
	end,
}
