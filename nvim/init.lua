vim.opt.clipboard = 'unnamedplus'

-- Plugins
require('config.lazy')

require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
