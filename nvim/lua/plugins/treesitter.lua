return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function ()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "lua" },
            auto_install = true,
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
--            keymaps = {
--                init_selection = "<leader>ss",
--            },
        })
    end
}
