-- winget install -e --id tree-sitter.tree-sitter-cli
-- Download: https://visualstudio.microsoft.com/visual-cpp-build-tools/
-- Install and select “Desktop development with C++”
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

