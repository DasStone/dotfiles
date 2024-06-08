require("plugin")
require("remap")

vim.opt.termguicolors = true
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

vim.opt.foldmethod = 'marker' -- folding codblocks marked with '{{{' '}}}'

-- Autocommand for MiniFilesWindowOpen event
vim.api.nvim_create_autocmd('User', {
    pattern = 'MiniFilesWindowOpen',
    callback = function(args)
      local win_id = args.data.win_id

      -- Customize window-local settings
      vim.wo[win_id].winblend = 0
      vim.api.nvim_win_set_config(win_id, { border = 'double' })
    end,
  })

