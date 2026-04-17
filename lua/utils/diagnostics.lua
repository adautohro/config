local diagnostic_signs = {
    Error = '',
    Warn = '',
    Hint = '',
    Info = '',
}

vim.diagnostic.config({
    severity_sort = true,
    update_in_insert = false,
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
