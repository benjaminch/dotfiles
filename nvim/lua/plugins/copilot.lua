return {
  {
    "zbirenbaum/copilot.lua",
    enabled = false,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Prevent Mason from starting Copilot independently of the plugins.
        copilot = { enabled = false },
      },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    enabled = false,
  },
}
