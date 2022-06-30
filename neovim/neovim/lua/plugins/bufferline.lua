require("bufferline").setup {
    mode = "buffers",
    options = {
        -- 使用 nvim 内置lsp
        diagnostics = "nvim_lsp",
        -- 左侧让出 nvim-tree 的位置
        offsets = {{
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left"
        }},
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        separator_style = "thin",
        always_show_bufferline = false,
        left_mouse_command = nil,
        right_mouse_command = nil,
        -- 使用 bufdelete.nvim 套件，避免刪除所有的Tab
        -- close_command = function(bufnum)
        --     require('bufdelete').bufdelete(bufnum, true)
        -- end,
        numbers = function(opts)
            return string.format('%s%s', opts.ordinal, opts.raise(opts.id))
        end,
    }
}
