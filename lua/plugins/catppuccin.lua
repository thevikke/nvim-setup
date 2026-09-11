
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
        DiffAdd    = { bg = U.darken(c.green,  0.60, c.base) },
        DiffDelete = { bg = U.darken(c.red,    0.30, c.base) },
        DiffChange = { bg = U.darken(c.blue,   0.20, c.base) },
        DiffText   = { bg = U.darken(c.yellow, 0.35, c.base), bold = true },

        DiffviewDiffAdd         = { bg = U.darken(c.green, 0.30, c.base) },
        DiffviewDiffAddAsDelete = { bg = U.darken(c.red,   0.30, c.base) },
        DiffviewDiffDelete      = { fg = c.overlay0, bg = "NONE" },
      }
    end,
  },
  config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme "catppuccin"
  end
}
