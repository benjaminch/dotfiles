return {
  {
    "ibhagwan/fzf-lua",
    opts = function(_, opts)
      local actions = require("fzf-lua.actions")

      opts = opts or {}

      -- Use fd for file finding (respects .gitignore by default)
      opts.files = vim.tbl_deep_extend("force", opts.files or {}, {
        cmd = "fd --type f --strip-cwd-prefix --hidden -E .git",
        -- Don't follow symlinks
        follow = false,
        -- Disable preview to prevent hanging on large file lists
        winopts = {
          preview = {
            hidden = "hidden", -- Disable preview
          },
        },
      })

      -- Use ripgrep for searching
      opts.grep = vim.tbl_deep_extend("force", opts.grep or {}, {
        rg_opts = "--color=never --no-heading --with-filename --line-number --column --smart-case",
      })

      -- Configure LSP symbol search to handle servers that don't support workspace symbols
      opts.lsp = vim.tbl_deep_extend("force", opts.lsp or {}, {
        symbols = {
          -- Use document symbols as fallback for servers without workspace symbol support
          icon_map = {},
          symbol_style = 1,
          async_or_timeout = 5000,
        },
      })

      -- Replace Alt-based toggles with Ctrl-based ones.
      local toggle_maps = {
        ["alt-h"] = false,
        ["alt-i"] = false,
        ["ctrl-e"] = { actions.toggle_hidden },
        ["ctrl-y"] = { actions.toggle_ignore },
      }

      opts.files = opts.files or {}
      opts.files.actions = vim.tbl_extend("force", opts.files.actions or {}, toggle_maps)

      opts.grep = opts.grep or {}
      opts.grep.actions = vim.tbl_extend("force", opts.grep.actions or {}, toggle_maps)

      return opts
    end,
  },
}
