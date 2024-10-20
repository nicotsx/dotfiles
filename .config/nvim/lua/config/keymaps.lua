-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--
-- Delete default keymaps
vim.keymap.del("n", "<leader>l")

local mini_comment = require("mini.comment")
mini_comment.setup({
  mappings = {
    comment = "<leader>/",
    comment_line = "<leader>/",
    comment_visual = "<leader>/",
    textobject = "<leader>/",
  },
})

-- Buffers / Navigation
vim.keymap.set("n", "∆", ":m .-2<cr>")
vim.keymap.set("n", "º", ":m .+1<cr>")

vim.keymap.set("v", "∆", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "º", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>bb", "<cmd>bprevious<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Previous Buffer" })

vim.keymap.set("n", "<M-Left>", "<cmd>vertical resize -2<cr>", { desc = "Resize Vertical -2" })
vim.keymap.set("n", "<M-Right>", "<cmd>vertical resize +2<cr>", { desc = "Resize Vertical +2" })

-- trigger nvim-cmp completion
vim.keymap.set("i", "¬", "<cmd>lua require('cmp').complete()<cr>", { desc = "Trigger Completion" })

-- Search
vim.keymap.set("n", "<leader>sr", "<cmd>Telescope resume<cr>")
vim.keymap.set("n", "<leader>sf", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
vim.keymap.set("n", "<leader>st", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })

vim.keymap.set("n", "<leader>h", "<cmd>noh<cr>", { desc = "Clear Search Highlight" })

local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

vim.keymap.set("n", "<leader>lj", diagnostic_goto(true), { desc = "Next Diagnostic" })
vim.keymap.set("n", "<leader>lk", diagnostic_goto(false), { desc = "Previous Diagnostic" })

-- Buffers
vim.keymap.set("n", "<leader>c", LazyVim.ui.bufremove, { desc = "Close Buffer" })

-- Trigger code actions
vim.keymap.set("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Code Action" })

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle File Explorer" })

-- Tmux
vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { noremap = true, silent = true })
