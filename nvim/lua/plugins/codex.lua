return {
  {
    "ishiooon/codex.nvim",
    dependencies = {
      "folke/snacks.nvim",
    },
    cmd = {
      "Codex",
      "CodexFocus",
      "CodexSend",
      "CodexTreeAdd",
      "CodexAdd",
      "CodexDiffAccept",
      "CodexDiffDeny",
    },
    keys = {
      { "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
      { "<leader>ac", "<cmd>Codex<cr>", desc = "Toggle Codex" },
      { "<leader>af", "<cmd>CodexFocus<cr>", desc = "Focus Codex" },
      { "<leader>ar", "<cmd>Codex --resume<cr>", desc = "Resume Codex" },
      { "<leader>aC", "<cmd>Codex --continue<cr>", desc = "Continue Codex" },
      { "<leader>ab", "<cmd>CodexAdd %<cr>", desc = "Add current buffer" },
      { "<leader>as", "<cmd>CodexSend<cr>", mode = "v", desc = "Send to Codex" },
      {
        "<leader>as",
        "<cmd>CodexTreeAdd<cr>",
        desc = "Add file",
        ft = { "NvimTree", "neo-tree", "oil" },
      },
      { "<leader>aa", "<cmd>CodexDiffAccept<cr>", desc = "Accept diff" },
      { "<leader>ad", "<cmd>CodexDiffDeny<cr>", desc = "Deny diff" },
      { "<leader>az", "<cmd>Codex<cr>", desc = "Codex: Toggle" },
      { "<leader>aZ", "<cmd>CodexFocus<cr>", desc = "Codex: Focus" },
      { "<leader>av", "<cmd>CodexSend<cr>", mode = "v", desc = "Codex: Send selection" },
      { "<leader>af", "<cmd>CodexTreeAdd<cr>", desc = "Codex: Add file", ft = { "neo-tree", "oil" } },
    },
    opts = {
      -- Use absolute path to avoid PATH issues in GUI-launched Neovim sessions.
      terminal_cmd = "/Users/benjaminch/.local/bin/codex",
      -- Work around E565 from codex.nvim status indicator rendering.
      -- The plugin writes to a tiny floating window on a timer; on some redraw
      -- phases Neovim forbids text/window changes and throws.
      status_indicator = {
        enabled = false,
      },
      env = {
        ENABLE_IDE_INTEGRATION = "true",
      },
    },
  },
}
