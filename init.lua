local opt = vim.opt
local keymap = vim.keymap.set

local tabsize = 4

-- Disable Netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Number of line
opt.number = true
opt.relativenumber = true

-- Search options
opt.hlsearch = false  -- Highlight search matches
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
keymap("n", "<leader>ol", ":Lazy <CR>", { desc = "Open Lazy" })
keymap("n", "<leader>om", ":Mason <CR>", { desc = "Open Mason" })

-- Neotree
keymap('n', '<leader>e', ':Neotree toggle filesystem reveal left<CR>', { desc = 'Open Nvim-Tree', silent = true })

-- Telescope
keymap("n", "<leader>ff", ":Telescope fd<CR>", { desc = "Telescope fuzzy find" })
keymap("n", "<leader>fk", ":Telescope keymaps<CR>", { desc = "Telescope find keymaps" })
keymap('n', '<leader>fb', ':Telescope buffers<CR>', { desc = 'Telescope find buffers' })
keymap('n', '<leader>ft', ':Telescope colorscheme<CR>', { desc = 'Telescope colorschemes' })
keymap('n', '<leader>fg', ':Telescope live_grep<CR>', { desc = 'Telescope live_grep' })

-- Oil
keymap('n', '<leader>oo', ':Oil --float<CR>', {desc = 'Open Oil', silent = true})

-- Open config file
keymap("n", "<leader>rc", ":e ~/.config/nvim/init.lua<CR>", { desc = "Open config file" })

-- Lsp format
keymap('n', '<leader>lf', ':lua vim.lsp.buf.format()<CR>', { silent = true, desc = 'Lsp format' })

-- Buffers
keymap('n', '<leader>bn', ':bnext<CR>', { desc = 'Next buffer' })
keymap('n', '<leader>bp', ':bprevious<CR>', { desc = 'Previous buffer' })

-- Improve tab navigation
keymap("n", "<leader>tn", ":tabnew<CR>", { desc = "Open new tab" })
keymap("n", "<leader>tx", ":tabclose<CR>", { desc = "Close tab" })
keymap("n", "<A-Right>", "gt", { desc = "Move to tab right" })
keymap("n", "<A-Left>", "gT", { desc = "Move to tab left" })
keymap('n', '<leader>ta', ':tabonly<CR>', { desc = 'Close all other tabs' })

-- Improve window navigation
keymap("n", "<A-h>", "<C-w>h", { desc = "Switch to left window" })
keymap("n", "<A-j>", "<C-w>j", { desc = "Switch to down window" })
keymap("n", "<A-k>", "<C-w>k", { desc = "Switch to up window" })
keymap("n", "<A-l>", "<C-w>l", { desc = "Switch to right window" })

-- Split and resize window
keymap("n", "<leader>sh", ":split<CR>", { desc = "Split horizontally" })
keymap("n", "<leader>sv", ":vsplit<CR>", { desc = "Split vertically" })
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
        max_width = 50,
        max_height = 30,
    }
)

require('config.lazy')
require('utils.diagnostics').setup()

-- Theme
vim.cmd.colorscheme("gruvbox-material")

vim.lsp.enable('lua_ls')
vim.lsp.enable('jdtls')
vim.lsp.enable('lemminx')
