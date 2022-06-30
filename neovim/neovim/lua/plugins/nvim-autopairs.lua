require('nvim-autopairs').setup({
    disable_filetype = { "TelescopePrompt" },
    ignored_next_char = "[%w%.]", -- Don't add pairs if the next char is alphanumeric
    enable_check_bracket_line = false, -- Don't add pairs if it already has a close pair in the same line
    fast_wrap = {
        map = '<M-e>',
        chars = { '{', '[', '(', '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
        offset = -1, -- Offset from pattern match
        end_key = '$',
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        check_comma = true,
        highlight = 'Search',
        highlight_grey='Comment'
    },
})
local npairs = require'nvim-autopairs'
local Rule   = require'nvim-autopairs.rule'
local cond = require'nvim-autopairs.conds'
-- custom rule
-- npairs.add_rules {
--     -- auto addspace on =
--     Rule('=', '')
--         :with_pair(cond.not_inside_quote())
--         :with_pair(function(opts)
--             local last_char = opts.line:sub(opts.col - 1, opts.col - 1)
--             if last_char:match('[%w%=%s]') then
--                 return true
--             end
--             return false
--         end)
--         :replace_endpair(function(opts)
--             local prev_2char = opts.line:sub(opts.col - 2, opts.col - 1)
--             local next_char = opts.line:sub(opts.col, opts.col)
--             next_char = next_char == ' ' and '' or ' '
--             if prev_2char:match('%w$') then
--                 return '<bs> =' .. next_char
--             end
--             if prev_2char:match('%=$') then
--                 return next_char
--             end
--             if prev_2char:match('=') then
--                 return '<bs><bs>=' .. next_char
--             end
--             return ''
--         end)
--         :set_end_pair_length(0)
--         :with_move(cond.none())
--         :with_del(cond.none())
-- }
