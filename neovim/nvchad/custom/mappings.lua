-- custom.mappings

local M = {}

--
-- M.disabled = {
--    "<C-n>",
-- }

M.my = {
    n = {
        ["<c-a><up>"] = { "<cmd> :m .-2<CR>", "  Moves a line up", opts = { noremap = true, silent = true } },
        ["<c-a><down>"] = { "<cmd> :m .+1<CR>", "  Moves a line down", opts = { noremap = true, silent = true } },
        -- ["<a-up>"] = { "<cmd> MoveLine(-1)<CR>", "  Moves a line up", opts = { noremap = true, silent = true } },
        -- ["<a-down>"] = { "<cmd> MoveLine(1)<CR>", "  Moves a line down", opts = { noremap = true, silent = true } },
        -- ["<a-right>"] = { "<cmd> MoveHChar(1)<CR>", "  Moves the character under the cursor right", opts = { noremap = true, silent = true } },
        -- ["<a-left>"] = { "<cmd> MoveHChar(-1)<CR>", "  Moves the character under the cursor left", opts = { noremap = true, silent = true } },
    },
    v = {
        -- ["<F12>"] = { "<cmd> MoveHBlock(1)<CR>", "  Moves a visual area right", opts = { noremap = true, silent = true } },
        -- ["<F11>"] = { "<cmd> MoveHBlock(-1)<CR>", "  Moves a visual area left", opts = { noremap = true, silent = true } },
        -- ["<c-a><up>"] = { "<cmd> :'<,'>m '>-3<CR>gv", "  Moves visual lines up", opts = { noremap = true, silent = true } },
        -- ["<c-a><down>"] = { "<cmd> :'<,'>m '<+2<CR>gv", "  Moves visual lines down", opts = { noremap = true, silent = true } },
        ["<c-a><right>"] = { ">gv", "  Ident a visual area right", opts = { noremap = true, silent = true } },
        ["<c-a><left>"] = { "<gv", "  Ident a visual area left", opts = { noremap = true, silent = true } },
    }
}

return M
