-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- For languages that don't support workspace symbols (like Kotlin),
-- use document symbols instead
local function search_symbols()
  local clients = vim.lsp.get_active_clients({ bufnr = 0 })
  
  -- Check if any active client supports workspace symbols
  local has_workspace_symbol = false
  for _, client in ipairs(clients) do
    if client.server_capabilities.workspaceSymbolProvider then
      has_workspace_symbol = true
      break
    end
  end
  
  -- If workspace symbols not supported, use document symbols
  if not has_workspace_symbol then
    require("fzf-lua").lsp_document_symbols()
  else
    require("fzf-lua").lsp_live_workspace_symbols()
  end
end

vim.keymap.set("n", "<leader>sS", search_symbols, { desc = "Workspace Symbols (with fallback)" })
