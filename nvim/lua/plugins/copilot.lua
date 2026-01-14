return {
  {
    "copilotlsp-nvim/copilot-lsp",
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    require = {
      "copilotlsp-nvim/copilot-lsp",
    },
    opts = {
      nes = {
        enabled = false,
        keymap = {
          accept_and_goto = "<leader>p",
          accept = false,
          dismiss = "<Esc>",
        },
      },
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
