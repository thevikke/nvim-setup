return {
  {
    'nvim-telescope/telescope.nvim', tag = 'v0.1.9',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      -- Telescope requires: choco install ripgrep.
      local builtin = require("telescope.builtin")
      -- control + p to find file names.
      vim.keymap.set('n', '<c-p>', builtin.find_files, {})
      -- space (leader) + f + g to grep (word search) from the project.
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup ({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {
            }
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end
  }
}
