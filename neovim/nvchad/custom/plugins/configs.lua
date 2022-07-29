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
      "php",
      "javascript",
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

M.mason = {
    ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- web dev
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "deno",
        "emmet-ls",
        "json-lsp",

        -- shell
        "shfmt",
        "shellcheck",

        -- go
        "gopls",
        "golangci-lint-langserver",
        "golangci-lint",
         -- php
        "phpactor",
    },
}

return M
