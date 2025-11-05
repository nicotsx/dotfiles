return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    -- requires = {
    --   "copilotlsp-nvim/copilot-lsp",
    -- },
    build = ":Copilot auth",
    event = "InsertEnter",
    opts = {
      -- nes = {
      --   enabled = true,
      --   auto_trigger = true,
      --   keymap = {
      --     accept_and_goto = "<leader>p",
      --     accept = false,
      --     dismiss = "<Esc>",
      --   },
      -- },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<C-f>",
        },
      },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        sql = true,
        yaml = true,
        typescript = true,
        help = true,
      },
    },
  },
}
