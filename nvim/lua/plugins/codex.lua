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
    },
    keys = {
      { "<leader>az", "<cmd>Codex<cr>", desc = "Codex: Toggle" },
      { "<leader>aZ", "<cmd>CodexFocus<cr>", desc = "Codex: Focus" },
      { "<leader>av", "<cmd>CodexSend<cr>", mode = "v", desc = "Codex: Send selection" },
      { "<leader>af", "<cmd>CodexTreeAdd<cr>", desc = "Codex: Add file", ft = { "neo-tree", "oil" } },
    },
    opts = {
      -- Use absolute path to avoid PATH issues in GUI-launched Neovim sessions.
      terminal_cmd = "/Applications/Codex.app/Contents/Resources/codex",
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
