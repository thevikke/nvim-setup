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
-- Control + l to to center the screen.
vim.keymap.set('n', '<C-l>', 'zz', { noremap = true, silent = true })
-- Visual mode tab moving text back and forward.
vim.keymap.set('v', '<Tab>', '>gv', { noremap = true, silent = true })
vim.keymap.set('v', '<S-Tab>', '<gv', { noremap = true, silent = true })
-- Delete without copying
vim.keymap.set({'n', 'x'}, 'd', '"_d', { noremap = true, silent = true })
vim.keymap.set({'n', 'x'}, 'D', '"_D', { noremap = true, silent = true })
vim.keymap.set({'n', 'x'}, 'c', '"_c', { noremap = true, silent = true })
vim.keymap.set({'n', 'x'}, 'C', '"_C', { noremap = true, silent = true })
