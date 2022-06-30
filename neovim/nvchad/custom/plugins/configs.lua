-- /lua/custom/plugins/configs.lua file

local M = {}

M.treesitter = {
   ensure_installed = {
      "lua",
      "vim",
      "go",
      "bash",
      "markdown",
      "jsonc",
      "yaml",
   },
}

M.nvimtree = {
   view = {
      hide_root_folder = false,
   },
   git = {
      enable = true,
   },
}

return M
