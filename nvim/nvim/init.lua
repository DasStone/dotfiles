require("plugin")
require("remap")

vim.cmd.colorscheme("catppuccin_mocha")

-- keeps terminal transparency with selected color theme
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.g.neovide_transparency = 0.95
vim.opt.guifont = 'Hack NFM:h16'

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true -- replaces tabs with spaces

vim.opt.smartindent = true

vim.opt.wrap = false -- override with filetype plugins

vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 4 -- "look ahead" while scrolling
vim.opt.signcolumn = 'yes' -- lsp hints or similar are placed in the signcolumn to the left, preventing screen "jiggle"