require("which-key").setup {
    plugins = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
    }
}
