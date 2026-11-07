-- Set the leader key (Space)
vim.g.mapleader = " "

-- Using system clipboard with the leader key
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])
vim.keymap.set("n", "<leader>P", [["+P]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["+d]])
vim.keymap.set("n", "<leader>D", [["+D]])

vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- move lines
vim.keymap.set("n", "<A-j>", function()
    return ":<C-u>m +" .. vim.v.count1 .. "<CR>"
end, { expr = true })

vim.keymap.set("v", "<A-j>", function()
    return ":m '>+" .. vim.v.count1 .. "<CR>gv"
end, { expr = true })

vim.keymap.set("n", "<A-k>", function()
    return ":<C-u>m -" .. (vim.v.count1 + 1) .. "<CR>"
end, { expr = true })

vim.keymap.set("v", "<A-k>", function()
    return ":m '<-" .. (vim.v.count1 + 1) .. "<CR>gv"
end, { expr = true })

vim.keymap.set("n", "<leader>u", ":Undotree<CR>")
vim.keymap.set("n", "<leader>e", function()
    if vim.bo.filetype == "netrw" then
        vim.cmd("b #")
    else
        vim.cmd("Explore")
    end
end, { desc = 'File [E]xplorer' })

vim.keymap.set("n", "<C-w>=", ":windo set nowinfixwidth<CR>:wincmd =<CR>")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files,       { desc = 'Telescope [F]ind [F]iles' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep,        { desc = 'Telescope [F]ind [G]rep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers,          { desc = 'Telescope [F]ind [B]uffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags,        { desc = 'Telescope [F]ind [H]elp tags' })
vim.keymap.set('n', '<leader>fk', builtin.keymaps,          { desc = 'Telescope [F]ind [K]eymaps' })

vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format,       { desc = '[L]sp [F]ormat' })
vim.keymap.set('n', '<leader>lr', vim.lsp.buf.format,       { desc = '[L]sp [R]ename' })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action,  { desc = '[C]ode [A]ction' })
vim.keymap.set('n', 'K',          vim.lsp.buf.hover,        { desc = '[K] Hover Documentation' })
vim.keymap.set('n', 'gd',         vim.lsp.buf.definition,   { desc = '[G]oto [D]efinition' })

vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help,    { desc = '[S]ignature help' })
