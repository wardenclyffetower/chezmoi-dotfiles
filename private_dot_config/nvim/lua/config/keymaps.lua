-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

-- Tab to switch buffers in Normal mode
vim.api.nvim_set_keymap("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })

-- Delete all the line with D (as V visually selects the line)
vim.api.nvim_set_keymap("n", "D", "0d$", { noremap = true, silent = true })

-- select last pasted text with gp (as gv reselect last visual selection)
vim.cmd([[
  nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
]])

-- This keymap stops that behavior and you retain your original paste register to continue to apply the same changes over and over.
vim.api.nvim_set_keymap("v", "p", '"_dP', { silent = true, desc = "Paste And Retain to Repaste" })

-- Keep search results centred
vim.api.nvim_set_keymap("n", "n", "nzzzv", { noremap = true, silent = true, desc = "keep search results centered" })
vim.api.nvim_set_keymap("n", "N", "Nzzzv", { noremap = true, silent = true, desc = "keep search results centered" })

-- Remap CTRL Left/Right to same behaviour than in insert mode
vim.api.nvim_set_keymap("n", "<C-Left>", "b", { noremap = true, silent = true, desc = "Word begin" })
vim.api.nvim_set_keymap("n", "<C-Right>", "e", { noremap = true, silent = true, desc = "Word end" })
vim.api.nvim_set_keymap("n", "<C-Down>", "<C-d>", { noremap = true, silent = true, desc = "Scroll Down" })
vim.api.nvim_set_keymap("n", "<C-Up>", "<C-u>", { noremap = true, silent = true, desc = "Scroll Up" })

-- Copy Filename of current buffer
vim.api.nvim_set_keymap(
  "n",
  "<leader>jf", -- my custom keymaps start with leader j
  '<cmd>let @+ = expand("%")<CR>',
  { desc = "Copy File Name of current Buffer" }
)
