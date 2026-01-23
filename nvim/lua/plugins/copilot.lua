return {
  {
    "zbirenbaum/copilot.lua",
    enabled = false, -- Disabled due to recent LSP update causing nvim to quit
    opts = {
      suggestion = {
        keymap = {
          accept = "<Tab>",
          accept_word = false,
          accept_line = false,
        },
      },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    enabled = false, -- Disabled along with copilot.lua
  },
}
