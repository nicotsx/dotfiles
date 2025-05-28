return {
  "mfussenegger/nvim-lint",
  event = "LazyFile",
  opts = {
    linters_by_ft = {
      python = { "pylint" },
    },
    linters = {
      pylint = {
        prepend_args = {
          "--rcfile",
          function(ctx)
            local rcfile = vim.fs.find({ ".pylintrc" }, { path = ctx.filename, upward = true })[1]
            return rcfile and vim.fn.fnameescape(rcfile) or ""
          end,
          "load-plugins=pylint_django",
        },
        condition = function(ctx)
          return ctx.ft == "python" and vim.fs.find({ ".pylintrc" }, { path = ctx.filename, upward = true })[1]
        end,
      },
    },
  },
}
