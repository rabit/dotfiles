-- /lua/custom/plugins/init.lua
return {
  ["ellisonleao/glow.nvim"] = { cmd = "Glow" },
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugins.null-ls").setup()
    end,
  },
  ["ethanholz/nvim-lastplace"] = {
    config = function()
      require("custom.plugins.lastplace").setup()
    end
  },
  ["goolord/alpha-nvim"] = {
    disable = false,
  },
  -- ["fedepujol/move.nvim"] = {},
}
-- just an example!
