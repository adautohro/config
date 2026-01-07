local opt = vim.opt
local keymap = vim.keymap.set
local default_colorscheme = 'vague'
local tabsize = 4

-- Disable Netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Number of line
opt.number = true
opt.relativenumber = true

-- Search options
opt.hlsearch = true  -- Highlight search matches
opt.incsearch = true  -- Highlight match while typing search
opt.ignorecase = true -- Search insensitive case
opt.smartcase = true  -- Switch to sensitive case if type uppercase letter in search

-- Indenting options
opt.smartindent = true    -- Smart indent
opt.autoindent = true     -- Copy indent from previous line inserted
opt.preserveindent = true
opt.expandtab = true      -- Use spaces when tab is inserted
opt.smarttab = true       -- Use switchwidth when insert tab
opt.tabstop = tabsize     -- Tab width
opt.softtabstop = tabsize -- Soft tab stop
opt.shiftwidth = tabsize  -- Indent width

-- Visual options
opt.signcolumn = 'yes'
opt.winborder = 'rounded'
opt.cursorline = true               -- Highlight cursor line
opt.showmode = false                -- Show modal mode in status line
opt.showmatch = true                -- Highlight matching brackets
opt.wrap = false                    -- Don't break lines
opt.scrolloff = 10                  -- Keep x lines above/below cursor
opt.sidescrolloff = 8               -- Keep x culumns before/after the cursor
opt.wildmenu = true                 -- Popup menu autocompletion in command line
opt.wildmode = "longest:full,full"  -- Autocomplete options in command line
opt.clipboard:append("unnamedplus") -- Use clipboard of system

-- Keymaps
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Plugins
keymap("n", "<leader>ol", ":Lazy <CR>", { desc = "Open Lazy", silent = true })
keymap("n", "<leader>om", ":Mason <CR>", { desc = "Open Mason", silent = true })

-- File explorer
keymap('n', '<leader>e', function()
    MiniFiles.open(vim.api.nvim_buf_get_name(0))
end, { desc = 'Open File Explorer', silent = true })

-- Fuzzy finder
keymap("n", "<leader>ff", ":Pick files<CR>", { desc = "Pick files", silent = true })
keymap('n', '<leader>fb', ':Pick buffers<CR>', { desc = 'Pick buffers', silent = true })
keymap('n', '<leader>fg', ':Pick grep_live<CR>', { desc = 'Pick grep', silent = true })
keymap('n', '<leader>fh', ':Pick help<CR>', { desc = 'Pick help', silent = true })

-- Open config file
keymap("n", "<leader>rc", ":e ~/.config/nvim/init.lua<CR>", { desc = "Open config file" })

-- Lsp format
keymap('n', '<leader>lf', ':lua vim.lsp.buf.format()<CR>', { silent = true, desc = 'Lsp format' })

-- Buffers
keymap('n', '<leader>bn', ':bnext<CR>', { desc = 'Next buffer' })
keymap('n', '<leader>bp', ':bprevious<CR>', { desc = 'Previous buffer' })

-- Improve tab navigation
keymap("n", "<leader>tn", ":<C-w>T", { desc = "Open current file in tab" })
keymap("n", "<leader>tx", ":tabclose<CR>", { desc = "Close tab" })
keymap("n", "<A-Right>", "gt", { desc = "Move to tab right" })
keymap("n", "<A-Left>", "gT", { desc = "Move to tab left" })
keymap('n', '<leader>ta', ':tabonly<CR>', { desc = 'Close all other tabs' })

-- Improve page navigation
keymap('n', '<C-d>', '<C-d>zz', { desc = 'Half page down' })
keymap('n', '<C-u', '<C-u>zz', { desc = 'Half page up'})

-- Improve window navigation
keymap("n", "<A-h>", "<C-w>h", { desc = "Switch to left window" })
keymap("n", "<A-j>", "<C-w>j", { desc = "Switch to down window" })
keymap("n", "<A-k>", "<C-w>k", { desc = "Switch to up window" })
keymap("n", "<A-l>", "<C-w>l", { desc = "Switch to right window" })

-- Split and resize window
keymap("n", "<leader>S", ":split<CR>", { desc = "Split horizontally" })
keymap("n", "<leader>s", ":vsplit<CR>", { desc = "Split vertically" })
keymap("n", "<C-Up>", ":resize +2 <CR>", { desc = "Increase window height" })
keymap("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
keymap("n", "<C-Left>", ":vertical resize +2<CR>", { desc = "Increase window width" })
keymap("n", "<C-Right>", ":vertical resize -2<CR>", { desc = "Decrease window width" })

-- Move lines down/up
keymap("n", "<S-A-j>", ":m .+1<CR>==", { desc = "Move line down" })
keymap("n", "<S-A-k>", ":m .-2<CR>==", { desc = "Move line up" })
keymap("v", "<S-A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap("v", "<S-A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Improve indenting
keymap('v', '<', '<gv', { desc = 'Indent selection right' })
keymap('v', '>', '>gv', { desc = 'Indent selection left' })

-- Highlight yanked selection
local highlight_yank_group = vim.api.nvim_create_augroup("HighlightYank", {})
vim.api.nvim_create_autocmd("TextYankPost", {
    group = highlight_yank_group,
    pattern = "*",
    callback = function()
        vim.hl.on_yank({
            higroup = "IncSearch",
            timeout = 200,
        })
    end,
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover, {
        border = 'rounded',
    }
)

require('config.lazy')
require('utils.diagnostics').setup()

-- Theme
vim.cmd.colorscheme(default_colorscheme)

vim.lsp.enable('lua_ls')
vim.lsp.enable('jdtls')
vim.lsp.enable('lemminx')
vim.lsp.enable('omnisharp')
