-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- work with the system clipboard (hopefully)
vim.o.clipboard = "unnamedplus"

-- vim.o.spelllang = "en_us,fr"
vim.o.spelllang = "fr"
vim.o.spell = false

vim.o.redrawtime = 3500 -- increase from 2000, to let some Telescope searches highlight

vim.o.pumheight = 15 -- also used on nvim-cmp
vim.o.pumblend = 0 -- no transparency on menu of completions
