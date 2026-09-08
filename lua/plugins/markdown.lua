-- Treesitter parsers: :TSInstall markdown markdown_inline
-- Renderer on PATH: npm i -g beautiful-mermaid-cli then which bm
-- :checkhealth render-markdown-mermaid
return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "echasnovski/mini.nvim", -- mini.icons
    },
    ft = { "markdown", "mdx" },
    opts = {},
  },
  {
    "cavanaug/render-markdown-mermaid.nvim",
    dependencies = {
      "MeanderingProgrammer/render-markdown.nvim",
    },
    ft = { "markdown", "mdx" },
    opts = {
      mode = "unicode",
      placement = "above",
      replace = false,
      debounce = 150,
      auto_setup_render_markdown = false, -- you already set it up above
    },
  },
}
