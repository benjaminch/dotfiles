return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      local actions = require("telescope.actions")
      local builtin = require("telescope.builtin")

      local find_files_hidden = true
      local find_files_no_ignore = false
      local live_grep_hidden = false
      local live_grep_no_ignore = false

      local function open_find_files()
        local cmd = {
          "fd",
          "--type",
          "f",
          "--strip-cwd-prefix",
        }
        if find_files_hidden then
          table.insert(cmd, "--hidden")
        end
        if find_files_no_ignore then
          table.insert(cmd, "--no-ignore")
        end
        vim.list_extend(cmd, {
          "-E",
          ".git",
          "-E",
          "target",
          "-E",
          ".terraform",
          "-E",
          "node_modules",
          "-E",
          ".vscode",
          "-E",
          ".idea",
        })

        builtin.find_files({
          find_command = cmd,
          follow = true,
          hidden = find_files_hidden,
        })
      end

      local function open_live_grep()
        builtin.live_grep({
          additional_args = function()
            local args = {}
            if live_grep_hidden then
              table.insert(args, "--hidden")
            end
            if live_grep_no_ignore then
              table.insert(args, "--no-ignore")
            end
            return args
          end,
        })
      end

      local function toggle_find_files_hidden(prompt_bufnr)
        find_files_hidden = not find_files_hidden
        actions.close(prompt_bufnr)
        open_find_files()
      end

      local function toggle_find_files_ignore(prompt_bufnr)
        find_files_no_ignore = not find_files_no_ignore
        actions.close(prompt_bufnr)
        open_find_files()
      end

      local function toggle_live_grep_hidden(prompt_bufnr)
        live_grep_hidden = not live_grep_hidden
        actions.close(prompt_bufnr)
        open_live_grep()
      end

      local function toggle_live_grep_ignore(prompt_bufnr)
        live_grep_no_ignore = not live_grep_no_ignore
        actions.close(prompt_bufnr)
        open_live_grep()
      end

      opts.defaults = opts.defaults or {}
      opts.defaults.vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--glob=!.git/",
      }

      opts.pickers = opts.pickers or {}
      opts.pickers.find_files = vim.tbl_deep_extend("force", opts.pickers.find_files or {}, {
        find_command = {
          "fd",
          "--type",
          "f",
          "--strip-cwd-prefix",
          "--hidden",
          "-E",
          ".git",
          "-E",
          "target",
          "-E",
          ".terraform",
          "-E",
          "node_modules",
          "-E",
          ".vscode",
          "-E",
          ".idea",
        },
        follow = true,
        hidden = true,
        mappings = {
          i = {
            ["<C-t>"] = toggle_find_files_hidden,
            ["<C-y>"] = toggle_find_files_ignore,
          },
          n = {
            ["<C-t>"] = toggle_find_files_hidden,
            ["<C-y>"] = toggle_find_files_ignore,
          },
        },
      })

      opts.pickers.live_grep = vim.tbl_deep_extend("force", opts.pickers.live_grep or {}, {
        mappings = {
          i = {
            ["<C-t>"] = toggle_live_grep_hidden,
            ["<C-y>"] = toggle_live_grep_ignore,
          },
          n = {
            ["<C-t>"] = toggle_live_grep_hidden,
            ["<C-y>"] = toggle_live_grep_ignore,
          },
        },
      })
    end,
  },
}
