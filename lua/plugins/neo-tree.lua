-- return {
--   "nvim-neo-tree/neo-tree.nvim",
--   branch = "v3.x",
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     "MunifTanjim/nui.nvim",
--     "nvim-tree/nvim-web-devicons",
--   },
--   lazy = false,
--   opts = {
--     window = {
--       position = "left",
--       width = 25,
--     },
--   },
--   config = function(_, opts)
--     require("neo-tree").setup(opts)
--     vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
--     vim.keymap.set("n", "<C-e>", ":Neotree toggle<CR>", {})
--     vim.keymap.set("n", "<C-d>", ":Neotree dir=", { desc = "Neo-tree: Go to path" })
--   end,
-- }
--
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  opts = {
    window = {
      position = "left",
      width = 30,
      mappings = {
        ["<cr>"] = "open",                  -- open in current window
        ["l"] = "open",
        ["S"] = "open_split",               -- open in horizontal split
        ["s"] = "open_vsplit",              -- open in vertical split
        ["t"] = "open_tabnew",              -- open in new tab
        ["h"] = "close_node",
        ["P"] = { "toggle_preview", config = { use_float = true } },
      },
    },
    filesystem = {
      follow_current_file = {
        enabled = true,
      },
    },
  },
  config = function(_, opts)
    require("neo-tree").setup(opts)

    vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", { desc = "Neo-tree reveal" })
    vim.keymap.set("n", "<C-e>", ":Neotree toggle<CR>", { desc = "Neo-tree toggle" })
    vim.keymap.set("n", "<C-d>", ":Neotree dir=", { desc = "Neo-tree go to path" })
  end,
}
