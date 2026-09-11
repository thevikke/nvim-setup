local scroll = require("scroll")
return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      attach_to_untracked = true,
      on_attach = function(bufnr)
        local gs = require("gitsigns")

        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        -- Hunk actions
        map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
        map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
        map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
        map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")

        -- Navigation (Finnish-friendly)
        map("n", "<leader>hn", function() gs.nav_hunk("next") end, "Next hunk")
        map("n", "<leader>hN", function() gs.nav_hunk("prev") end, "Prev hunk")
      end,
    },
  },

  -- diffview
{
  "sindrets/diffview.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = {
    "DiffviewOpen",
    "DiffviewClose",
    "DiffviewFileHistory",
    "DiffviewToggleFiles",
  },
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview open" },
    { "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "Diffview close" },
    { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history" },
    { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Repo history" },
  },
  opts = {
    enhanced_diff_hl = true,
    view = {
      default = { layout = "diff2_horizontal" },
      file_history = { layout = "diff2_horizontal" },
    },
    keymaps = {
      view = {
        { "n", "<c-l>", scroll.line_above_center, { desc = "line above center" } },
        {
          "n", "ö",
          function()
            vim.cmd("normal! ]c")
            require("scroll").line_above_center()
          end,
          { desc = "next change + center" },
        },
        {
          "n", "ä",
          function()
            vim.cmd("normal! [c")
            require("scroll").line_above_center()
          end,
          { desc = "prev change + center" },
        },
      },
    file_panel = {
      { "n", "<C-l>", scroll.line_above_center, { desc = "Line above center" } },
    },
    },
    hooks = {
      diff_buf_read = function()
        vim.opt_local.wrap = false
        vim.opt_local.list = false
      end,
      diff_buf_win_enter = function()
        vim.opt_local.foldenable = false
        vim.opt_local.foldmethod = "manual"
        vim.cmd("normal! zR")
      end,
    },
  },
  config = function(_, opts)
    require("diffview").setup(opts)
    vim.opt.diffopt:append({
      "algorithm:histogram",
      "indent-heuristic",
      "linematch:60",
      "context:99999",
    })
    vim.opt.fillchars:append({ diff = "╱" })
  end,
},

  -- neogit
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    opts = {
        mappings = {
          status = {
          ["K"] = false,  -- disable Untrack on Shift+k
          ["J"] = false,  -- disable anything on Shift+j (optional)
          ["<c-v>"] = false,          -- disable the original
          ["<leader>nv"] = "VSplitOpen", -- use <leader>nv instead
          ["<c-x>"] = false,          -- disable the original
          ["<leader>nx"] = "SplitOpen", -- use <leader>nx instead
          ["<c-t>"] = false,          -- disable the original
          ["<leader>nt"] = "TabOpen", -- use <leader>nt instead
       },
      },
    },
    config = true,
    keys = {
      { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
    },
  },
}
