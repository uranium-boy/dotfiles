return {
    {
        "hrsh7th/cmp-nvim-lsp",
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
--            "rafamadriz/friendly-snippets",
        }
    },
    {
        "hrsh7th/nvim-cmp",

        config = function()
            local luasnip = require("luasnip")
            local cmp = require("cmp")

--            require("luasnip.loaders.from_vscode").lazy_load()

--            vim.api.nvim_set_keymap("i", "<C-h>", "", { noremap = true, silent = true })
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },

                window = {
                    completion = cmp.config.window.bordered(),
--                    documentation = cmp.config.window.bordered(),
                },

                mapping = cmp.mapping.preset.insert({
                    -- `Enter` key to confirm completion
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),

                    -- Ctrl+Space to trigger completion menu
                    ['<C-Space>'] = cmp.mapping.complete(),

                    -- Jump between items in the completion menu
                    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
                    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),

                    -- Navigate between snippet placeholder
                    ['<C-l>'] = cmp.mapping(function(fallback)
                        if luasnip.jumpable(1) then
                            luasnip.jump(1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),

                    -- !(DOESN'T WORK)! Jump backward in snippets with <C-h>
                    ['<C-h>'] = cmp.mapping(function(fallback)
                        if luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),

                    -- Scroll up and down in the completion documentation
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                }),

                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }),
            })


--                vim.keymap.set({ "i", "s" }, "<C-l>", function () luasnip.jump(1) end, { silent = true })
--                vim.keymap.set({ "i", "s" }, "<C-h>", function () luasnip.jump(-1) end, { silent = true })
        end
    },
}
