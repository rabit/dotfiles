local lspkind = require('lspkind')
local cmp = require('cmp')

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup {
    -- 指定 snippet 引擎
    snippet = {
        expand = function(args)
          -- For `vsnip` users.
          vim.fn["vsnip#anonymous"](args.body)

          -- For `luasnip` users.
          -- require('luasnip').lsp_expand(args.body)

          -- For `ultisnips` users.
          -- vim.fn["UltiSnips#Anon"](args.body)

          -- For `snippy` users.
          -- require'snippy'.expand_snippet(args.body)
        end,
    },
    -- 来源
    sources = cmp.config.sources(
    {
        { name = 'nvim_lsp' },
        -- For vsnip users.
        { name = 'vsnip' },
        -- For luasnip users.
        -- { name = 'luasnip' },
        --For ultisnips users.
        -- { name = 'ultisnips' },
        -- -- For snippy users.
        -- { name = 'snippy' },
    },
    {
        { name = 'buffer' },
        { name = 'path' }
    }
    ),

    -- 快捷键
    mapping = {
        -- 上一个
        ['<C-up>'] = cmp.mapping.select_prev_item(),
        -- 下一个
        ['<C-down>'] = cmp.mapping.select_next_item(),
        -- -- 出现补全
        -- ['<A-.>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        -- -- 取消
        -- ['<A-,>'] = cmp.mapping({
        --   i = cmp.mapping.abort(),
        --   c = cmp.mapping.close(),
        -- }),
        -- 确认
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ['<CR>'] = cmp.mapping.confirm({
          select = false ,
          behavior = cmp.ConfirmBehavior.Replace
        }),
        -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif vim.fn["vsnip#available"](1) == 1 then
                feedkey("<Plug>(vsnip-expand-or-jump)", "")
            elseif has_words_before() then
                cmp.complete()
            else
                fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                feedkey("<Plug>(vsnip-jump-prev)", "")
            end
        end, { "i", "s" }),
    },
    -- 使用lspkind-nvim显示类型图标
    formatting = {
        format = lspkind.cmp_format({
            with_text = true, -- do not show text alongside icons
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            before = function (entry, vim_item)
                -- Source 显示提示来源
                vim_item.menu = "["..string.upper(entry.source.name).."]"
                return vim_item
            end
        })
    },
    -- 排序
    sorting = {
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            require "cmp-under-comparator".under,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
}

-- Use buffer source for `/`.
-- cmp.setup.cmdline('/', {
--     sources = {
--         { name = 'buffer' }
--     }
-- })

-- Use cmdline & path source for ':'.
-- cmp.setup.cmdline(':', {
--     sources = cmp.config.sources(
--     {
--         { name = 'path' }
--     },
--     {
--         { name = 'cmdline' }
--     })
-- })

