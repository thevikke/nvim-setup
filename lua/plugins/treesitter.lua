return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup()
    local ensure_installed = { "lua", "javascript", "markdown", "markdown_inline", "dart" }
    require("nvim-treesitter").install(ensure_installed)
  end,
}

