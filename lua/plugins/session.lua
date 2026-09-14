return {
  "rmagatti/auto-session",
  lazy = false,
  dependencies = { "nvim-telescope/telescope.nvim" }, -- optional; snacks/fzf-lua also work
  opts = {
    suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    session_lens = {
      load_on_setup = true, -- enables :Telescope session-lens
      previewer = false, -- or "summary"
      picker_opts = {
        -- old theme_conf belongs here now, e.g.:
        -- theme = "dropdown",
        -- layout_config = { ... },
      },
    },
  },
  keys = {
    { "<Leader>ls", "<cmd>AutoSession search<CR>", desc = "Session search" },
  },
}
