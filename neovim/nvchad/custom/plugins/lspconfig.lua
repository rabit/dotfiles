local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"
-- lspservers with default config
local servers = { "html", "phpactor", "gopls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.gopls.setup{
  cmd = {'gopls'}, -- if gopls is not in $PATH, must set full path
  filetypes = { "go", "gomod", "gotmpl" },
  root_dir = require("lspconfig.util").root_pattern("go.mod", ".git"),
  single_file_support = true,
  -- for postfix snippets and analyzers
  capabilities = capabilities,
  settings = {
    gopls = {
      experimentalPostfixCompletions = true,
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = false,
    },
  },
  flags = {
    -- This will be the default in neovim 0.7+
    debounce_text_changes = 150,
  },
  on_attach = on_attach,
}

