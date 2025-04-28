local wk = require('which-key')

return {
    {
        'akinsho/toggleterm.nvim',
        config = function()
            require('toggleterm').setup()

            wk.add({
                { '<C-\\>', function() vim.cmd.ToggleTerm('direction=float') end, desc = "Open Floating Terminal", mode = { "n", "t" } },
            })
        end,
    },
}
