--- https://github.com/nanozuki/tabby.nvim/blob/main/lua/tabby/presets.lua

local filename = require('tabby.filename')
local util = require('tabby.util')

local hl_tabline_fill = util.extract_nvim_hl('TabLineFill') -- 背景
local hl_tabline = util.extract_nvim_hl('TabLine')
local hl_tabline_sel = util.extract_nvim_hl('TabLineSel') -- 高亮
local hl_tabline_head = util.extract_nvim_hl('String')

local function tab_label(tabid, active)
    -- local icon = active and '' or ''
    local icon = active and '' or ''
    local number = vim.api.nvim_tabpage_get_number(tabid)
    local name = util.get_tab_name(tabid)
    return string.format(' %s %d: %s ', icon, number, name)
end

local function tab_label_no_fallback(tabid, active)
  -- local icon = active and '' or ''
  local icon = active and '' or ''
  local fallback = function()
    return ''
  end
  local number = vim.api.nvim_tabpage_get_number(tabid)
  local name = util.get_tab_name(tabid, fallback)
  if name == '' then
    return string.format(' %s %d ', icon, number)
  end
  return string.format(' %s %d: %s ', icon, number, name)
end

local function win_label(winid, top)
    local icon = top and '' or ''
    return string.format(' %s %s ', icon, filename.unique(winid))
end

local presets = {
    hl = 'TabLineFill',
    layout = 'active_wins_at_tail',
    head = {
        { '  ', hl = { fg = hl_tabline_head.fg, bg = hl_tabline.bg } },
        { '', hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
    },
    active_tab = {
        label = function(tabid)
            return {
                tab_label(tabid, true),
                hl = { fg = hl_tabline_sel.fg, bg = hl_tabline_sel.bg, style = 'bold' },
            }
        end,
        left_sep = { '', hl = { fg = hl_tabline_sel.bg, bg = hl_tabline_fill.bg } },
        right_sep = { '', hl = { fg = hl_tabline_sel.bg, bg = hl_tabline_fill.bg } },
    },
    inactive_tab = {
        label = function(tabid)
            return {
                tab_label(tabid, false),
                hl = { fg = hl_tabline.fg, bg = hl_tabline_fill.bg },
            }
        end,
        left_sep = { ' ', hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
        right_sep = { ' ', hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
    },
    top_win = {
        label = function(winid)
            return {
                win_label(winid, true),
                hl = 'TabLine',
            }
        end,
        left_sep = { '', hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
        right_sep = { '', hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
    },
    win = {
        label = function(winid)
            return {
                win_label(winid),
                hl = 'TabLine',
            }
        end,
        left_sep = { '', hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
        right_sep = { '', hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
    },
    tail = {
        { '', hl = { fg = hl_tabline.bg, bg = hl_tabline_fill.bg } },
        { '  ', hl = { fg = hl_tabline.fg, bg = hl_tabline.bg } },
    },
}

require('tabby').setup({
    tabline = presets,
    -- tabline = require("tabby.presets").active_wins_at_tail,
})
vim.api.nvim_set_keymap("n", "<leader>ta", ":$tabnew<CR>", { noremap = true, silent =true })
vim.api.nvim_set_keymap("n", "<leader>tc", ":tabclose<CR>", { noremap = true, silent =true  })
vim.api.nvim_set_keymap("n", "<leader>to", ":tabonly<CR>", { noremap = true, silent =true  })
vim.api.nvim_set_keymap("n", "<leader>tn", ":tabn<CR>", { noremap = true, silent =true  })
vim.api.nvim_set_keymap("n", "<leader>tp", ":tabp<CR>", { noremap = true, silent =true  })
-- move current tab to previous position
vim.api.nvim_set_keymap("n", "<leader>tmp", ":-tabmove<CR>", { noremap = true, silent =true  })
-- move current tab to next position
vim.api.nvim_set_keymap("n", "<leader>tmn", ":+tabmove<CR>", { noremap = true, silent =true  })
