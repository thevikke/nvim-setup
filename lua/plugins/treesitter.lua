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
    local ensure_installed = {
      "lua",
      "javascript",
      "typescript",
      "tsx",
      "markdown",
      "markdown_inline",
      "dart",
      "go",
      "pascal",
    }
    require("nvim-treesitter").install(ensure_installed)

    vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
  end,
}

