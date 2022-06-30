local autocmd = vim.api.nvim_create_autocmd

local opt = vim.opt

autocmd({"BufNewFile", "BufRead"}, {
   pattern = "*.go",
   callback = function()
      -- vim.opt.laststatus = 0
      opt.expandtab = false
      opt.tabstop = 4
      opt.shiftwidth = 4
   end,
})

autocmd("FileType", {
   pattern = "Makefile",
   callback = function()
      opt.expandtab = false
   end,
})
