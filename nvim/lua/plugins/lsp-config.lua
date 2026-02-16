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
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('my.lsp', {}),
                callback = function (args)
--                    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
                    local map = function (keys, func, desc)
                        vim.keymap.set("n", keys, func, { buffer = args.buf, desc = "LSP: " .. desc })
                    end

                    map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinitions")
                    map("gr", require("telescope.builtin").lsp_references,  "[G]oto [R]eferences")
                    map("gi", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementations")

                    map("[d", function()
                        vim.diagnostic.jump({ count = -1, float = true })
                    end, "Next [D]iagnostic")
                    map("]d", function()
                        vim.diagnostic.jump({ count = 1, float = true })
                    end, "Prev [D]iagnostic")

                    map("<leader>lr", vim.lsp.buf.rename, "[L]SP [R]ename")
                    map("<leader>lf", vim.lsp.buf.format, "[L]SP [F]ormat")
                    map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
                    map("K", vim.lsp.buf.hover, "Hover Documentation")

                    vim.keymap.set({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help)
                end
            })

            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls" }
            })

            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true)
                        }
                    }
                }
            })

        end
    },
}
