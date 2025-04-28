-- == General Settings ==

-- theming
vim.opt.termguicolors = true
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- note: setting the color theme is handled in the respective plugin file

vim.g.neovide_transparency = 0.95
vim.opt.guifont = 'Hack NFM:h16'

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4         -- 0 means "use tabstop"
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true    -- replaces tabs with spaces

vim.opt.wrap = false -- override with filetype plugins

-- add markdown as a filetype for its filetype override to take effect
vim.filetype.add(
    { extension = { md = "markdown" }, }
)

-- makes word wrap only wrap on spaces instead of in the middle of words
vim.opt.linebreak = true

-- add some visuals for wraps
vim.opt.breakindent = true
vim.opt.breakindentopt = "sbr"
vim.opt.showbreak = " "

vim.opt.incsearch = true
vim.opt.ignorecase = true

vim.opt.scrolloff = 4 -- "look ahead" while scrolling
vim.opt.signcolumn = 'yes' -- lsp hints or similar are placed in the signcolumn to the left, preventing "jiggle"

-- whitespace visuals
vim.opt.list = true
vim.opt.listchars:append({
    tab = '>-',
    trail = '⋅',
})

vim.opt.foldmethod = 'marker' -- folding codblocks marked with '{{{' '}}}'

-- == Key Mapping ==
vim.g.mapleader = " "
vim.g.maplocalleader = "_"

local kmset = vim.keymap.set

kmset({ 'n', 'i', 'v' }, '<C-s>', vim.cmd.write, { desc = 'Save' })

kmset('', '<C-d>', '10jzz')
kmset('', '<C-u>', '10kzz')
kmset('', '<C-f>', '10j')
kmset('', '<C-b>', '10k')

kmset('n', '<ESC>', vim.cmd.nohlsearch)

-- == Bootstrap lazy.nvim ==
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    defaults = { version = '*' },

    spec = { { import = "plugins" } },

    change_detection = {
        enabled = true,
        notify = false,
    },
})
