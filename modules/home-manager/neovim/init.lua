vim.opt.number =  true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true

vim.opt.tabstop = 2 
vim.opt.shiftwidth = 2
vim.expandtab = true

vim.g.mapleader = " "

require('base16-colorscheme').setup('black-metal-gorgoroth')

require('lualine').setup({
  options = {
    theme = 'base16',
    icons_enabled = true,
    component_separators = { left = '|', right = '|' },
    section_separators = { left = '', right = ''},
    }
})
