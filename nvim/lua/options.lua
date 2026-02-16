
-- Set the leader key (Space)
vim.g.mapleader = " "

-- Using system clipboard with the leader key
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])
vim.keymap.set("n", "<leader>P", [["+P]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["+d]])
vim.keymap.set("n", "<leader>D", [["+D]])

-- Indentation settings:
vim.opt.expandtab = true    -- Convert tabs to spaces
vim.opt.tabstop = 4         -- 4 spaces per tab
vim.opt.softtabstop = 4     -- 4 spaces per tab
vim.opt.shiftwidth = 4      -- 4 spaces for << command (and autoindent)

-- Highlight line length limit
vim.opt.colorcolumn = "80"

-- Display symbols for spaces and tabs
vim.opt.list = true

-- Display line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Search settings:
vim.opt.hlsearch = true     -- highlight all metching results
vim.opt.incsearch = true    -- show results incrementally as you type

-- Disable mouse
vim.opt.mouse = ""

-- Disable auto comment insertion when starting a new line after a commented line
vim.api.nvim_create_autocmd({"BufEnter"}, {
    callback = function()
        vim.cmd("set formatoptions-=r")
        vim.cmd("set formatoptions-=o")
    end
})

-- Disable wrapping for long lines
vim.opt.wrap = false

-- Center the cursor vertically
vim.opt.scrolloff = 999

-- diagnostics changed since 0.11
vim.diagnostic.config({
    virtual_lines = true
})

vim.opt.winborder = "rounded"

-- undotree config
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.g.undotree_SplitWidth = 30
vim.g.undotree_SetFocusWhenToggle = 1
