return {
    { 'folke/lazy.nvim' },
    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        opts = {
            preset = 'helix',
            delay = 0,
            triggers = {
                { '<auto>', mode = 'nixsotc' },
                { 'y',      mode = 'n' }, -- surround
            },
            spec = {
                { '<leader>b', group = 'Buffer' },
                { '<leader>m', group = 'Misc' },
                -- I'd rather have this together with Telescope's config
                -- but idk how lazy.nvim and which-key are supposed to be
                -- working together wrt keybind groups.
                { '<leader>t', group = 'Telescope' },
            },
        },
    },
}
