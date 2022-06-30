-- Just an example, supposed to be placed in /lua/custom/

local M = {}

local pluginConfs = require "custom.plugins.configs"
local userPlugins = require "custom.plugins" -- path to table

M.plugins = {
   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },
   override = {
      ["nvim-treesitter/nvim-treesitter"] = pluginConfs.treesitter,
      ["kyazdani42/nvim-tree.lua"] = pluginConfs.nvimtree,
   },
   remove = {
      "lukas-reineke/indent-blankline.nvim",
   },
   user = userPlugins
}
-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   italic_comments = false,
   theme = "onedark",
}

M.options = {
   user = function ()
      require("custom.options")
   end,
}

M.mappings = require "custom.mappings"

return M
