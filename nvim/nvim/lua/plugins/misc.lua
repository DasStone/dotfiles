return {
    {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup{}
        end,
    },

    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('lualine').setup{}
        end,
    },

    {
        'MeanderingProgrammer/render-markdown.nvim',
        config = function()
            local render_markdown = require('render-markdown')
            local wk = require('which-key')

            render_markdown.setup({})
            wk.add({ '<leader>mm', render_markdown.toggle, desc = 'Render Markdown Toggle' })
        end,
    },

    {
        'Eandrju/cellular-automaton.nvim',
        config = function()
            require('which-key').add({
                { '<leader>c',  group = 'lol' },
                { '<leader>cr', function() vim.cmd('CellularAutomaton make_it_rain') end, desc = 'Rain' },
                { '<leader>cg', function() vim.cmd('CellularAutomaton game_of_life') end, desc = 'Game' },
            })
        end,
    },

    {
        'xiyaowong/transparent.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('which-key').add({
                { '<leader>mt', function() vim.cmd('TransparentToggle') end, desc = 'Toggle Transparency' },
            })
        end,
    },

    {
        -- latex exception for treesitter is required and set in the respective plugin file
        'lervag/vimtex',
        lazy = false,
    },
}
