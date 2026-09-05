vim.opt.number =  true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true

vim.opt.tabstop = 2 
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.g.mapleader = " "

require('base16-colorscheme').setup('everforest-dark-hard')

require('lualine').setup({
  options = {
    theme = 'everforest',
    icons_enabled = true,
    component_separators = { left = '|', right = '|' },
    section_separators = { left = '', right = ''},
    }
})


local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep (search text)' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find help tags' })
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = 'Find recent files' })



vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Oil.nvim
require("oil").setup({
  default_file_explorer = true, 
  columns = {
    "icon",
  },
  view_options = {
    show_hidden = false,         
  },
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory with Oil" })









