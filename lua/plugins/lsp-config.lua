-- We need to define the language servers and the client side for neo vim.
return {
  {
    "mason-org/mason.nvim",
    opts = {}
  },
  {
      -- Bridges mason.nvim with nvim-lspconfig.
      -- Mason is the package manager for lsps, mson lspconfig is the bridge between mason and nvim-lspconfig.
      "mason-org/mason-lspconfig.nvim",
      opts = {
        ensure_installed = { "lua_ls", "ts_ls" }
      },
      dependencies = {
          { "mason-org/mason.nvim", opts = {} },
          "neovim/nvim-lspconfig",
      },
  },
  -- nvim-lspconfig configures those servers so neovim knows how to communicate with them.
  {
  "neovim/nvim-lspconfig",
  config = function()
    vim.lsp.enable("lua_ls")
    vim.lsp.enable("ts_ls")

    vim.diagnostic.config({
      virtual_text = false,
      virtual_lines = false,
      signs = true,
      underline = true,
      float = {
        border = "rounded",
        source = true,
        focusable = false,
      },
    })

    local function hover_or_diag()
      local lnum = vim.api.nvim_win_get_cursor(0)[1] - 1
      local diags = vim.diagnostic.get(0, { lnum = lnum })
      if #diags > 0 then
        vim.diagnostic.open_float({ scope = "line" })
      else
        vim.lsp.buf.hover()
      end
    end

    -- vim.api.nvim_create_autocmd("CursorHold", {
    --   callback = function()
    --     vim.diagnostic.open_float({ scope = "cursor", focus = false })
    --   end,
    -- })
    -- vim.o.updatetime = 300
    --
    local buf = vim.lsp.buf
    vim.keymap.set("n", "gd", buf.definition, { desc = "Go to Definition" })
    vim.keymap.set("n", "gD", buf.declaration, { desc = "Go to Declaration" })
    vim.keymap.set("n", "gi", buf.implementation, { desc = "Go to Implementation" })
    vim.keymap.set("n", "gr", buf.references, { desc = "Go to References" })
    vim.keymap.set("n", "gh", hover_or_diag, { desc = "Diagnostic or hover" })
    vim.keymap.set("n", "<leader>ca", buf.code_action, { desc = "Code Action" })
    vim.keymap.set("n", "<leader>rn", buf.rename, { desc = "Rename" })
    vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })
  end,
  }
}

