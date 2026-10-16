local upstream = {
  cache = {},
  pending = {},
}

local function cwd()
  return (vim.uv or vim.loop).cwd()
end

local function git_root(bufnr)
  local name = vim.api.nvim_buf_get_name(bufnr or 0)
  local start = name ~= "" and vim.fs.dirname(name) or cwd()
  return vim.fs.root(start, ".git") or start
end

local function current_upstream()
  local root = git_root(0)
  local result = vim.system(
    { "git", "rev-parse", "--abbrev-ref", "--symbolic-full-name", "@{upstream}" },
    { cwd = root, text = true }
  ):wait()

  if result.code ~= 0 or not result.stdout then
    return nil
  end

  return vim.trim(result.stdout)
end

local function open_upstream_diff()
  local upstream_ref = current_upstream()
  if not upstream_ref then
    vim.notify("Current branch has no upstream configured", vim.log.levels.INFO)
    return
  end

  vim.cmd("DiffviewOpen " .. upstream_ref .. "...HEAD")
end

local function refresh_upstream(bufnr)
  local root = git_root(bufnr)
  if not root or upstream.pending[root] then
    return root
  end

  upstream.pending[root] = true
  vim.system({ "git", "rev-list", "--left-right", "--count", "HEAD...@{upstream}" }, { cwd = root, text = true }, function(obj)
    local state = {}

    if obj.code == 0 and obj.stdout then
      local ahead, behind = obj.stdout:match("(%d+)%s+(%d+)")
      if ahead and behind then
        state.ahead = tonumber(ahead)
        state.behind = tonumber(behind)
      end
    end

    upstream.cache[root] = state
    upstream.pending[root] = nil

    vim.schedule(function()
      pcall(vim.cmd, "redrawstatus")
    end)
  end)

  return root
end

local function upstream_status()
  local root = refresh_upstream(0)
  local state = root and upstream.cache[root]
  if not state then
    return ""
  end

  local parts = {}
  if state.ahead and state.ahead > 0 then
    table.insert(parts, "A" .. state.ahead)
  end
  if state.behind and state.behind > 0 then
    table.insert(parts, "B" .. state.behind)
  end

  if #parts == 0 and (state.ahead == 0 or state.behind == 0) then
    return "SYNC"
  end

  return table.concat(parts, " ")
end

return {
  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewFileHistory",
      "DiffviewFocusFiles",
      "DiffviewToggleFiles",
      "DiffviewRefresh",
    },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Repo Diff" },
      { "<leader>gD", open_upstream_diff, desc = "Upstream Diff" },
      { "<leader>gF", "<cmd>DiffviewFileHistory %<cr>", desc = "File History" },
      { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Branch History" },
      { "<leader>gq", "<cmd>DiffviewClose<cr>", desc = "Close Diff View" },
    },
    opts = {
      enhanced_diff_hl = true,
      file_panel = {
        listing_style = "tree",
        tree_options = {
          flatten_dirs = true,
          folder_statuses = "only_folded",
        },
        win_config = {
          position = "left",
          width = 40,
        },
      },
      view = {
        default = {
          layout = "diff2_horizontal",
        },
        file_history = {
          layout = "diff2_horizontal",
        },
        merge_tool = {
          layout = "diff3_horizontal",
        },
      },
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = function(_, opts)
      opts.current_line_blame = true
      opts.current_line_blame_opts = {
        delay = 150,
        virt_text_pos = "eol",
      }
      opts.current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>"
      opts.preview_config = {
        border = "rounded",
      }
      opts.watch_gitdir = {
        follow_files = true,
      }
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local group = vim.api.nvim_create_augroup("git_upstream_statusline", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "DirChanged", "FocusGained" }, {
        group = group,
        callback = function(args)
          refresh_upstream(args.buf)
        end,
      })

      table.insert(opts.sections.lualine_x, 1, {
        upstream_status,
        color = function()
          return { fg = Snacks.util.color("Special") }
        end,
      })
    end,
  },
}
