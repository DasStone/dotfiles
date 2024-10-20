require("plugin")
require("remap")

vim.opt.termguicolors = true
vim.cmd.colorscheme("catppuccin-mocha")

-- keeps terminal transparency with selected color theme
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.g.neovide_transparency = 0.95
vim.opt.guifont = 'Hack NFM:h16'

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
-- 0 means "use tabstop"
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 0
vim.opt.expandtab = true -- replaces tabs with spaces

vim.opt.smartindent = true

vim.opt.wrap = false -- override with filetype plugins

-- makes word wrap only wrap on spaces instead of in the middle of words
vim.opt.linebreak = true
-- and adds some visual to a wrapping
vim.opt.breakindent = true
vim.opt.breakindentopt = "sbr"
vim.opt.showbreak = " "

vim.opt.incsearch = true
vim.opt.ignorecase = true

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

