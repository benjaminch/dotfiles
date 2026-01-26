-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Set up crates.nvim keymaps for Cargo.toml files
vim.api.nvim_create_autocmd("BufRead", {
  pattern = "Cargo.toml",
  callback = function(ev)
    local bufnr = ev.buf
    
    -- Wait for crates.nvim to load
    vim.defer_fn(function()
      local ok, crates = pcall(require, "crates")
      if ok then
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc, silent = true })
        end
        
        map("n", "<leader>rcu", crates.update_crate, "Update crate")
        map("n", "<leader>rca", crates.update_all_crates, "Update all crates")
        map("n", "<leader>rcU", crates.upgrade_crate, "Upgrade crate")
        map("n", "<leader>rcA", crates.upgrade_all_crates, "Upgrade all crates")
        map("n", "<leader>rcH", crates.open_homepage, "Open crate homepage")
        map("n", "<leader>rcR", crates.open_repository, "Open crate repository")
        map("n", "<leader>rcD", crates.open_documentation, "Open crate documentation")
        map("n", "<leader>rcC", crates.open_crates_io, "Open crates.io")
      end
    end, 100) -- Wait 100ms for crates.nvim to initialize
  end,
})
