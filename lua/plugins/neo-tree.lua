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
      width = 25,
    },
  },
  config = function(_, opts)
    require("neo-tree").setup(opts)
    vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
    vim.keymap.set("n", "<C-e>", ":Neotree toggle<CR>", {})
  end,
}
