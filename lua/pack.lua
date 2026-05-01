vim.pack.add({
    'https://github.com/nvim-mini/mini.nvim',
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/vague-theme/vague.nvim",
    "https://github.com/webhooked/kanso.nvim",
    'https://github.com/sainnhe/sonokai',
    'https://github.com/sainnhe/gruvbox-material',
    'https://github.com/edeneast/nightfox.nvim',
})

-- Order matters!
require('mason').setup()
require('plugins.mini')

vim.g.sonokai_style = 'maia' -- 'shusia' 'andromeda' 'espresso' 'default'
vim.g.gruvbox_material_foreground = 'material' -- 'mix' 'original'
vim.g.gruvbox_material_background = 'hard' -- 'medium' 'soft'
