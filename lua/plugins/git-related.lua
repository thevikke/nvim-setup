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
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>",  desc = "Git Diffview" },
      { "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
    },
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
