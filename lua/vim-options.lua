vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
-- Fixes copy paste between nvim and windows.
vim.opt.clipboard = "unnamedplus"

-- Keymappings------------------------------------
vim.keymap.set('n', '<S-j>', '5j',{})
vim.keymap.set('n', '<S-k>', '5k',{})
vim.keymap.set('v', '<S-j>', '5j',{})
vim.keymap.set('v', '<S-k>', '5k',{})
vim.keymap.set('i', 'jj', '<Esc>',{})
vim.keymap.set('n', '<leader>o', 'o<Esc>', { desc = "New line below, stay in Normal" })
vim.keymap.set('n', '<leader>O', 'O<Esc>', { desc = "New line above, stay in Normal" })
-- Visual x: delete + copy to clipboard
vim.keymap.set('x', 'x', '"+d', { noremap = true, silent = true })
-- Enables deleting one character with pressing x instead of also copying that character.
vim.keymap.set('n', 'x', '"_x', { noremap = true, silent = true })

-- Switch buffers between windows.
-- CTRL + w + x
-- Control + l to to center the screen.
-- vim.keymap.set('n', '<C-l>', 'zz', { noremap = true, silent = true })
local scroll = require("scroll")
vim.keymap.set("n", "<C-l>", scroll.line_above_center, {
  noremap = true,
  silent = true,
  desc = "Line above center",
})
vim.opt.wrap = false          -- horizontal scroll only works with nowrap
vim.opt.sidescrolloff = 999   -- keep cursor in the middle horizontally
-- Visual mode tab moving text back and forward.
vim.keymap.set('v', '<Tab>', '>gv', { noremap = true, silent = true })
vim.keymap.set('v', '<S-Tab>', '<gv', { noremap = true, silent = true })
-- Delete without copying
vim.keymap.set({'n', 'x'}, 'd', '"_d', { noremap = true, silent = true })
vim.keymap.set({'n', 'x'}, 'D', '"_D', { noremap = true, silent = true })
vim.keymap.set({'n', 'x'}, 'c', '"_c', { noremap = true, silent = true })
vim.keymap.set({'n', 'x'}, 'C', '"_C', { noremap = true, silent = true })
vim.keymap.set('n', '<Tab>', '>>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Tab>', '<<', { noremap = true, silent = true })

-- ======================
-- Relative line numbers.
-- ======================
-- Current line shows real line number.
-- vim.opt.number = true
-- vim.opt.relativenumber = true

-- ======================
-- Oil nvim
-- ======================
vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })

-- ======================
-- Window Management
-- ======================
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Vertical split" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Horizontal split" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equalize splits" })
vim.keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close current split" })

-- Resize window
vim.keymap.set("n", "<C-Up>",    "<C-w>+", { desc = "taller" })
vim.keymap.set("n", "<C-Down>",  "<C-w>-", { desc = "shorter" })
vim.keymap.set("n", "<C-Left>",  "<C-w><", { desc = "narrower" })
vim.keymap.set("n", "<C-Right>", "<C-w>>", { desc = "wider" })

-- avigate between windows
vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Go to right window" })-- ======================

-- Tab Management
-- ======================
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close current tab" })
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "Next tab" })
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Previous tab" })

-- ======================
-- Buffer Management
-- ======================
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>x", ":bprevious | bdelete #<CR>", { desc = "Close buffer, keep window" })
vim.keymap.set("n", "<leader>X", ":bd!<CR>", { desc = "Force close buffer" })

-- ======================
-- Quickfix list mappings
-- ======================
vim.keymap.set("n", "<leader>c", ":copen<CR>", { desc = "Open quickfix" })
vim.keymap.set("n", "<leader>C", ":cclose<CR>", { desc = "Close quickfix" })
vim.keymap.set("n", "<leader>cn", ":cnext<CR>", { desc = "Next quickfix item" })
vim.keymap.set("n", "<leader>cp", ":cprev<CR>", { desc = "Previous quickfix item" })

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ higroup = "DiffAdd", timeout = 400 })
  end,
})
