-- /lua/custom/plugins/init.lua
return {
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  ["ellisonleao/glow.nvim"] = { branch = 'main' },
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
