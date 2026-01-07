return {
    'nvim-mini/mini.nvim',
    version = false,
    config = function()
        require('mini.icons').setup()
        require('mini.files').setup()
        require('mini.pick').setup()
        require('mini.diff').setup()
        require('mini.git').setup()
        require('mini.statusline').setup()
    end,
}
