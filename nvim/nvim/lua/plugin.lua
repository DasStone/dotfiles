local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- color schemes
    {
        'rose-pine/neovim',
        lazy = false,
        priority = 1000,
    },
    {
        'catppuccin/nvim',
	    name = 'catppuccin',
        lazy = false,
        priority = 1000,
    },
    {
        "daltonmenezes/aura-theme",
        lazy = false,
        priority = 1000,
        config = function(plugin)
            vim.opt.rtp:append(plugin.dir .. '/packages/neovim')
        end,
    },
    {
        "savq/melange-nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "rebelot/kanagawa.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
    },
    {
        "sainnhe/sonokai",
        lazy = false,
        priority = 1000,
    },
    {
        "Yazeed1s/oh-lucy.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "fcancelinha/northern.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        'lervag/vimtex',
        lazy = false,
    },

    -- Mastering the vim language plugins
    "tpope/vim-repeat",
    "tpope/vim-surround",
    "christoomey/vim-system-copy", -- maybe
    "vim-scripts/ReplaceWithRegister",

    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    'nvim-telescope/telescope-project.nvim',

    'folke/which-key.nvim',

    'akinsho/toggleterm.nvim',

    'lukas-reineke/indent-blankline.nvim', -- ugly

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons', opt = true },
    },

    'numToStr/Comment.nvim',

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },
    'nvim-treesitter/nvim-treesitter-context', -- breaks often (keeps signature of function visible)
    'nvim-treesitter/nvim-treesitter-textobjects',
    'IndianBoy42/tree-sitter-just', -- adds just file support to tree sitter

    'windwp/nvim-autopairs', -- closes brackets automatically

    -- "Swiss Army knife" for nvim
    {
        'echasnovski/mini.nvim',
        version = false,
        config = function()
            require('mini.files').setup({
                windows = {
                    max_number = 3,
                    preview = true,
                    width_preview = 50,
                },
            })
        end,
    },

    -- Tex
    'barreiroleo/ltex_extra.nvim',
    {
        'lervag/vimtex',
        lazy = false,
    },

    -- Isabelle
    --'Treeniks/isabelle-syn.nvim', -- file endings and syntax highlighting
    --{
    --    'Treeniks/isabelle-lsp.nvim',
    --    branch = 'isabelle-language-server',
    --    dependencies = {
    --        'neovim/nvim-lspconfig'
    --    },
    --},

    -- LSP and autocompletion
    'neovim/nvim-lspconfig',
    'hrsh7th/nvim-cmp', -- completion framework (basically just api)
    'hrsh7th/cmp-nvim-lsp', -- connects lsp with completion framework
    'hrsh7th/cmp-path', -- adds file system path completion (works better with linux)

    -- snippet engine (required for nvim-cmp)
    'L3MON4D3/LuaSnip', -- can also be configured to help with boilerplate code

    -- funny stuff
    'eandrju/cellular-automaton.nvim',
})
