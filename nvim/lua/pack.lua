vim.cmd.packadd("nvim.undotree")

vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/L3MON4D3/LuaSnip",
    "https://github.com/rafamadriz/friendly-snippets",
    { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1"), },

    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-telescope/telescope.nvim",

    -- "https://github.com/abecodes/tabout.nvim",

    "https://github.com/folke/tokyonight.nvim",
})

require("mason").setup()
require("mason-lspconfig").setup()

require("luasnip.loaders.from_vscode").lazy_load()
require("blink.cmp").setup({
    completion = {
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 500
        }
    }
})

local actions = require("telescope.actions")
require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                ["<C-k>"] = actions.cycle_history_next,
                ["<C-j>"] = actions.cycle_history_prev,
            }
        }
    }
})

require("tokyonight").setup({
    transparent = true,
    styles = {
        sidebars = "transparent",
        floats = "transparent"
    }
})
