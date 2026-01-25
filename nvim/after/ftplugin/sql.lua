-- Disable old Vim SQL completion to avoid errors
vim.b.omni_sql_no_default_maps = 1
vim.b.sql_type_default = 'mysql'

-- Disable the problematic SQL completion keymaps safely
pcall(function()
  vim.keymap.del('i', '<C-C>', { buffer = true })
end)
