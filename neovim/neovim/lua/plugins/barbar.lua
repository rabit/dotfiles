local tree_toggle_cmd = ":lua local set_bar_offset = require('bufferline.state').set_offset \z
                         local nt = require('nvim-tree') \z
                         local ntv = require('nvim-tree.view') \z
                         if ntv.is_visible() then \z
                         set_bar_offset(0) nt.toggle() else \z
                         nt.toggle(true) set_bar_offset(ntv.View.width, 'NvimTree') end"

vim.cmd ("command ModNvimTreeFindFileToggle " .. tree_toggle_cmd)
vim.api.nvim_set_keymap("n", "<Leader>e", "<cmd>ModNvimTreeFindFileToggle<CR>", { noremap = true, silent = true })
