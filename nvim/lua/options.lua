vim.opt.number = true
vim.opt.relativenumber = true

-- indentation settings
vim.opt.expandtab = true    -- convert tabs to spaces
vim.opt.tabstop = 4         -- columns for display tabs
vim.opt.softtabstop = 4     -- columns for insert tabs
vim.opt.shiftwidth = 4      -- 4 spaces for >> command (and autoindent)

-- display symbols for spaces and tabs
vim.opt.list = true

-- splitting a window will put the new window below the current one
vim.opt.splitbelow = true

-- ignore case in search patterns
vim.opt.ignorecase = true
-- override the 'ignorecase' if the search pattern contains upper case characters
vim.opt.smartcase = true

vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"

-- center the cursor vertically
vim.opt.scrolloff = 999

-- highlight line length limit
vim.opt.colorcolumn = "80,100"

-- disable line wrap
vim.opt.wrap = false

-- disable automatic comment insertion
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        vim.opt.formatoptions:remove({ "c", "r", "o" })
    end
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'tex', 'markdown' },
    callback = function ()
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
    end
})

vim.diagnostic.config({
    virtual_lines = true,
})

vim.opt.winborder = "rounded"

-- default on
vim.opt.hlsearch = true     -- highlight all matches
vim.opt.incsearch = true    -- show where the pattern matches

vim.g.netrw_banner = 0
vim.g.netrw_winsize = -30   -- 30 columns width
vim.g.netrw_liststyle = 3   -- tree style
vim.g.netrw_chgwin = 1

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = {
                    "vim",
                    "require",
                },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry  = {
                enable = false
            },
        },
    },
})
