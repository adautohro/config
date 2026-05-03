local keymap = vim.keymap.set

keymap("n", "<leader>om", ":Mason <CR>", { desc = "Open Mason", silent = true })

-- File explorer
keymap('n', '<leader>e', function()
    if not MiniFiles.close() then MiniFiles.open(vim.api.nvim_buf_get_name(0)) end
end, { desc = 'Toggle File Explorer', silent = true })

-- Fuzzy finder
keymap("n", "<leader>pf", function()
    Snacks.picker.files()
end, { desc = "Pick files", silent = true })

keymap("n", "<leader>ps", function()
    Snacks.picker.lsp_symbols({fallback = 'treesitter'})
end, { desc = "Pick files", silent = true })

keymap("n", "<leader>ff", ":Pick files<CR>", { desc = "Pick files", silent = true })
keymap('n', '<leader>fb', ':Pick buffers<CR>', { desc = 'Pick buffers', silent = true })
keymap('n', '<leader>fgh', ':Pick git_hunks<CR>', { desc = 'Pick git hunks', silent = true })
keymap('n', '<leader>fgc', ':Pick git_commits<CR>', { desc = 'Pick git commits', silent = true })
keymap('n', '<leader>fh', ':Pick help<CR>', { desc = 'Pick help', silent = true })
keymap('n', '<leader>fl', ':Pick buf_lines<CR>', { desc = 'Pick line', silent = true })
keymap('n', '<leader>ft', ':Pick colorschemes<CR>', { desc = 'Pick colorschemes', silent = true })
keymap('n', '<leader>fk', ':Pick keymaps<CR>', { desc = 'Pick keymaps', silent = true })
keymap('n', '<leader>fc', ':Pick git_commits<CR>', { desc = 'Pick git commits', silent = true })
keymap('n', '<leader>fd', ':Pick diagnostic<CR>', { desc = 'Pick diagnostic', silent = true })
keymap('n', '<leader>fm', ':Pick manpages<CR>', { desc = 'Pick manpages', silent = true })
keymap('n', '<leader>fs',":Pick lsp scope='document_symbol'<CR>" , { desc = 'Pick workspace lsp simbols', silent = true })
keymap('n', '<leader>fS',":Pick lsp scope='workspace_symbol'<CR>" , { desc = 'Pick workspace lsp simbols', silent = true })

-- Open config file
keymap("n", "<leader>rc", ":e ~/.config/nvim/init.lua<CR>", { desc = "Open config file" })
keymap("n", "<leader>rs", ":source<CR>", { desc = "Source config" })

-- Snacks
keymap('n', '<leader>z', function()
    Snacks.zen.zen()
end, { desc = 'Toggle zen mode', silent = true })

-- Lsp format
keymap('n', '<leader>lf', ':lua vim.lsp.buf.format()<CR>', { silent = true, desc = 'Lsp format' })
keymap('n', '<leader>ld', function()
    vim.diagnostic.setloclist()
end, { desc = 'Open current buffer diagnostics' })
keymap('n', '<leader>lD', function()
    vim.diagnostic.setqflist()
end, { desc = 'Open all workspace diagnostics' })

-- Buffers
keymap('n', '<leader>bn', ':bnext<CR>', { desc = 'Next buffer' })
keymap('n', '<leader>bp', ':bprevious<CR>', { desc = 'Previous buffer' })

-- Improve tab navigation
keymap("n", "<leader>tn", "<C-w>T", { desc = "Open current file in tab" })
keymap("n", "<leader>tx", ":tabclose<CR>", { desc = "Close tab" })
keymap("n", "<A-Right>", "gt", { desc = "Move to tab right" })
keymap("n", "<A-Left>", "gT", { desc = "Move to tab left" })
keymap('n', '<leader>ta', ':tabonly<CR>', { desc = 'Close all other tabs' })

-- Improve page navigation
keymap('n', '<C-d>', '<C-d>zz', { desc = 'Half page down' })
keymap('n', '<C-u', '<C-u>zz', { desc = 'Half page up' })

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

local fterminal = require('utils.fterminal')
keymap('n', '<leader>ot', function()
    fterminal.create_terminal()
end, { desc = 'Open float terminal' })
