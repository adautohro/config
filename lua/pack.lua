vim.pack.add({
    'https://github.com/nvim-mini/mini.nvim',
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/vague-theme/vague.nvim",
    "https://github.com/webhooked/kanso.nvim",
    'https://github.com/AlexvZyl/nordic.nvim',
})

-- Order matters!
require('mason').setup()
require('plugins.mini')
