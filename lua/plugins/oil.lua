return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    default_file_explorer = true,
    keymaps = {
      ["<C-h>"] = false,
      ["<C-l>"] = false,
      ["<C-v>"] = { "actions.select", opts = { vertical = true } },
      ["<C-x>"] = { "actions.select", opts = { horizontal = true } },
      ["<leader>or"] = "actions.refresh",
      },
    },
    -- Optional dependencies
    -- dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
}


