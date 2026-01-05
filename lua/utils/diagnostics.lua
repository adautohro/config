local M = {}

local diagnostic_signs = {
    Error = '',
    Warn = '',
    Hint = '',
    Info = '',
}

M.setup = function()
    vim.diagnostic.config({
        signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = diagnostic_signs.Error,
                [vim.diagnostic.severity.WARN] = diagnostic_signs.Warn,
                [vim.diagnostic.severity.HINT] = diagnostic_signs.Hint,
                [vim.diagnostic.severity.INFO] = diagnostic_signs.Info,
            }
        },
        virtual_text = false,
        virtual_lines = {
            current_line = true,
        },
    })
end

return M
