return {
  {
    "rachartier/tiny-cmdline.nvim",
    -- Requires Neovim >= 0.12
    event = "VeryLazy",
    init = function()
      -- Must be set before the plugin initializes or the cmdline stays at the bottom
      vim.o.cmdheight = 0
    end,
    opts = {
      width = {
        value = "60%",
        min = 40,
        max = 80,
      },
      position = {
        x = "50%",
        y = "50%",
      },
      border = nil, -- inherit vim.o.winborder, else "rounded"
      menu_col_offset = 3,
      -- Keep search native at the bottom; only ":" is centered
      native_types = { "/", "?" },
      title = {
        enabled = false,
        pos = "center",
      },
      -- Keep blink's completion menu glued to the floating cmdline
      on_reposition = function(...)
        return require("tiny-cmdline").adapters.blink(...)
      end,
    },
    config = function(_, opts)
      -- ui2 is required on 0.12
      pcall(function()
        require("vim._core.ui2").enable({})
      end)
      require("tiny-cmdline").setup(opts)
    end,
  },
}
