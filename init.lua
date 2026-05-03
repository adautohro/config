require('vim._core.ui2').enable({})
require('pack')

vim.cmd.colorscheme('vague')

local opt = vim.opt
local tabsize = 4

-- Disable Netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Number of line
opt.number = true
opt.relativenumber = true

-- Search options
opt.hlsearch = true   -- Highlight search matches
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
opt.termguicolors = true
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

-- Completion
opt.completeopt = 'fuzzy,menuone,popup,noinsert'

-- Keymaps
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require('utils.keymaps')
require('utils.autocmds')
require('utils.diagnostics')

vim.lsp.enable('lua_ls')
vim.lsp.enable('jdtls')
vim.lsp.enable('lemminx')
vim.lsp.enable('omnisharp')
