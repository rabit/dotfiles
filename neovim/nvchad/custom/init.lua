-- Please check NvChad docs if you're totally new to nvchad + dont know lua!!
-- This is an example init file in /lua/custom/
-- this init.lua can load stuffs etc too so treat it like your ~/.config/nvim/
require "custom.autocmds"

-- MAPPINGS
local map = require("core.utils").map

map("n", "<leader>cc", ":Telescope <CR>")
map("n", "<leader>q", ":q <CR>")

-- vim.schedule(function()
--    vim.opt.shadafile = vim.fn.expand "$HOME" .. "/.local/share/nvim/shada/main.shada"
--    vim.cmd [[ silent! rsh ]]
-- end)

-- NOTE: the 4th argument in the map function is be a table i.e options but its most likely un-needed so dont worry about it