return {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
    },

    config = function()
        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = 'Telescope [F]ind [F]iles' })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = 'Telescope [F]ind [G]rep' })
    end
}
