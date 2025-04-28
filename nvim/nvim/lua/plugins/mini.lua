local wk = require('which-key')

return {
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

        local minifiles_toggle = function(...)
            if not MiniFiles.close() then MiniFiles.open(...) end
        end

        wk.add({
            { '<leader>e', minifiles_toggle, desc = 'Mini Files' },
        })

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
    end,
}
