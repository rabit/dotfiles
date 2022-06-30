local null_ls = require "null-ls"
local sources = { null_ls.builtins.diagnostics.golangci_lint }

local M = {}

M.setup = function()
   null_ls.setup {
      debug = true,
      sources = sources,
   }
end

return M
