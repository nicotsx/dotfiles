-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- require("neo-tree").setup({
--   filesystem = {
--     window = {
--       mappings = {
--         ["o"] = "system_open",
--         ["e"] = function()
--           vim.api.nvim_exec("Neotree focus filesystem left", true)
--         end,
--         ["b"] = function()
--           vim.api.nvim_exec("Neotree focus buffers left", true)
--         end,
--         ["g"] = function()
--           vim.api.nvim_exec("Neotree focus git_status left", true)
--         end,
--       },
--     },
--     filtered_items = {
--       visible = false, -- when true, they will just be displayed differently than normal items
--       hide_dotfiles = false,
--       hide_gitignored = false,
--       hide_by_name = {
--         "node_modules",
--         ".git",
--         "dist",
--         ".next",
--       },
--       never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
--         ".DS_Store",
--         "thumbs.db",
--       },
--     },
--     follow_current_file = {
--       enabled = true, -- This will find and focus the file in the active buffer every time
--       leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
--     },
--     commands = {
--       system_open = function(state)
--         local node = state.tree:get_node()
--         local path = node:get_id()
--         vim.fn.jobstart({ "open", path }, { detach = true })
--       end,
--     },
--   },
-- })
require("nvim-tree").setup({
  experimental = {},
  auto_reload_on_write = false,
  disable_netrw = false,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  sort = {
    sorter = "name",
    folders_first = true,
    files_first = false,
  },
  root_dirs = {},
  prefer_startup_root = false,
  sync_root_with_cwd = true,
  reload_on_bufenter = false,
  respect_buf_cwd = false,
  on_attach = "default",
  select_prompts = false,
  view = {
    adaptive_size = false,
    centralize_selection = true,
    width = 30,
    cursorline = true,
    debounce_delay = 15,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    float = {
      enable = false,
      quit_on_focus_loss = true,
      open_win_config = {
        relative = "editor",
        border = "rounded",
        width = 30,
        height = 30,
        row = 1,
        col = 1,
      },
    },
  },
  renderer = {
    add_trailing = false,
    group_empty = false,
    highlight_git = "name",
    highlight_opened_files = "none",
    root_folder_label = ":t",
    full_name = false,
    indent_width = 2,
    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
    symlink_destination = true,
    highlight_diagnostics = "none",
    highlight_modified = "none",
    highlight_bookmarks = "none",
    highlight_clipboard = "name",
    indent_markers = {
      enable = false,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
    icons = {
      web_devicons = {
        folder = {
          enable = false,
          color = true,
        },
      },
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
        modified = true,
        diagnostics = true,
        bookmarks = true,
      },
      git_placement = "before",
      padding = " ",
      symlink_arrow = " ➛ ",
      modified_placement = "after",
      diagnostics_placement = "signcolumn",
      bookmarks_placement = "signcolumn",
    },
  },
  hijack_directories = {
    enable = false,
    auto_open = true,
  },
  update_focused_file = {
    enable = true,
    update_root = {
      enable = true,
      ignore_list = {},
    },
    exclude = false,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    show_on_open_dirs = true,
    debounce_delay = 50,
    severity = {
      min = vim.diagnostic.severity.HINT,
      max = vim.diagnostic.severity.ERROR,
    },
  },
  filters = {
    enable = true,
    dotfiles = false,
    git_clean = false,
    git_ignored = false,
    no_bookmark = false,
    no_buffer = false,
    custom = { "node_modules", "\\.cache" },
    exclude = {},
  },
  filesystem_watchers = {
    enable = true,
    debounce_delay = 50,
    ignore_dirs = {},
  },
  git = {
    enable = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
    disable_for_dirs = {},
    timeout = 400,
    cygwin_support = false,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    expand_all = {
      max_folder_discovery = 300,
      exclude = {},
    },
    file_popup = {
      open_win_config = {
        col = 1,
        row = 1,
        relative = "cursor",
        border = "shadow",
        style = "minimal",
      },
    },
    open_file = {
      quit_on_open = false,
      eject = true,
      resize_window = false,
      window_picker = {
        enable = true,
        picker = "default",
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "lazy", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
    remove_file = {
      close_window = true,
    },
  },
  trash = {
    cmd = "gio trash",
  },
  live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = true,
  },
  tab = {
    sync = {
      open = false,
      close = false,
      ignore = {},
    },
  },
  notify = {
    threshold = vim.log.levels.INFO,
    absolute_path = true,
  },
  ui = {
    confirm = {
      remove = true,
      trash = true,
      default_yes = false,
    },
  },
  modified = {
    enable = false,
    show_on_dirs = true,
    show_on_open_dirs = true,
  },
  help = {
    sort_by = "key",
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      dev = false,
      diagnostics = false,
      git = false,
      profile = false,
      watcher = false,
    },
  },
  system_open = {
    cmd = nil,
    args = {},
  },
})

require("nvim-web-devicons").set_icon({
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh",
  },
})

-- next line runs this command: highlight NvimTreeFolderIcon guifg=#6d8086
vim.cmd("highlight NvimTreeFolderIcon guifg=#fef65b")
-- vim.cmd("highlight NvimTreeFolderName guifg=#fff27a")

local aug = vim.api.nvim_create_augroup("buf_large", { clear = true })

vim.api.nvim_create_autocmd({ "BufReadPre" }, {
  callback = function()
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()))
    if ok and stats and (stats.size > 500000) then
      vim.b.large_buf = true
      vim.cmd("syntax off")
      -- vim.cmd("IndentBlanklineDisable") -- disable indent-blankline.nvim
      vim.opt_local.foldmethod = "manual"
      vim.opt_local.spell = false
    else
      vim.b.large_buf = false
    end
  end,
  group = aug,
  pattern = "*",
})

-- Auto update on VimEnter
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("VimEnter", {
  group = augroup("autoupdate"),
  callback = function()
    if require("lazy.status").has_updates then
      require("lazy").update({ show = false })
    end
  end,
})
