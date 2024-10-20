return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<C-f>"
        }
      },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        sql = true,
        yaml = true,
        typescript = true,
        help = true,
      },
    }
  }

}
