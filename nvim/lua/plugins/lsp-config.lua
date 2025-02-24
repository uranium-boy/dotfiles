return {
    {
        "williamboman/mason.nvim",

        lazy = false,

        config = function()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",

        lazy = false,

        config = function()
        end
    },
    {
        "neovim/nvim-lspconfig",

        lazy = false,

        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls" }
            })

            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })
            lspconfig.intelephense.setup({
                capabilities = capabilities
            })
            lspconfig.clangd.setup({
                capabilities = capabilities
            })
            lspconfig.sourcekit.setup({
                capabilities = capabilities
            })

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
        end
    }
}
