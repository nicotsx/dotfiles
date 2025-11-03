-- Copilot Light Theme for Neovim
-- A light port of the VSCode Copilot Theme

local M = {}

-- Color palette
local colors = {
  bg = "#ffffff",
  bg_dark = "#f5f7f9",
  fg = "#5c6873",
  fg_light = "#24292e",
  fg_dark = "#9ca7b3",
  yellow = "#b58900",
  orange = "#d97923",
  red = "#cb2431",
  pink = "#c93890",
  purple = "#6f42c1",
  blue = "#0184bc",
  cyan = "#168996",
  green = "#22863a",
  border = "#e1e4e8",
  selection = "#cce5ff",
  comment = "#9ca7b3",
  line = "#f6f8fa",
  highlight = "#e8eef5",
  white = "#ffffff",
}

function M.setup()
  -- Reset all highlights
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  -- Set colorscheme name
  vim.g.colors_name = "copilot-light"

  -- Set terminal colors
  vim.g.terminal_color_0 = colors.fg_light
  vim.g.terminal_color_1 = colors.red
  vim.g.terminal_color_2 = colors.green
  vim.g.terminal_color_3 = colors.yellow
  vim.g.terminal_color_4 = colors.blue
  vim.g.terminal_color_5 = colors.purple
  vim.g.terminal_color_6 = colors.cyan
  vim.g.terminal_color_7 = colors.fg
  vim.g.terminal_color_8 = colors.fg_dark
  vim.g.terminal_color_9 = colors.red
  vim.g.terminal_color_10 = colors.green
  vim.g.terminal_color_11 = colors.yellow
  vim.g.terminal_color_12 = colors.blue
  vim.g.terminal_color_13 = colors.purple
  vim.g.terminal_color_14 = colors.cyan
  vim.g.terminal_color_15 = colors.bg

  -- Define highlight groups
  local highlights = {
    -- Editor UI
    Normal = { fg = colors.fg, bg = colors.bg },
    NormalFloat = { fg = colors.fg, bg = colors.bg_dark },
    FloatBorder = { fg = colors.border, bg = colors.bg_dark },
    Cursor = { fg = colors.bg, bg = colors.fg },
    CursorLine = { bg = colors.line },
    CursorLineNr = { fg = colors.fg_light },
    LineNr = { fg = colors.fg_dark },
    SignColumn = { bg = colors.bg },
    ColorColumn = { bg = colors.bg_dark },
    Folded = { fg = colors.fg_dark, bg = colors.bg_dark },
    FoldColumn = { fg = colors.fg_dark, bg = colors.bg },
    VertSplit = { fg = colors.border, bg = colors.bg },
    Title = { fg = colors.fg_light, bold = true },
    NonText = { fg = colors.fg_dark },
    SpecialKey = { fg = colors.fg_dark },
    Directory = { fg = colors.blue },

    -- Search
    Search = { fg = colors.fg_light, bg = "#ffd33d" },
    IncSearch = { fg = colors.fg_light, bg = "#ffd33d" },

    -- Selection
    Visual = { bg = colors.selection },
    VisualNOS = { bg = colors.selection },

    -- Statusline
    StatusLine = { fg = colors.fg, bg = colors.bg_dark },
    StatusLineNC = { fg = colors.fg_dark, bg = colors.bg_dark },
    WildMenu = { fg = colors.fg_light, bg = colors.bg_dark },

    -- Tabs
    TabLine = { fg = colors.fg, bg = colors.bg_dark },
    TabLineFill = { fg = colors.fg, bg = colors.bg_dark },
    TabLineSel = { fg = colors.fg_light, bg = colors.bg, underline = true, sp = colors.yellow },

    -- Popup menu
    Pmenu = { fg = colors.fg, bg = colors.bg_dark },
    PmenuSel = { fg = colors.fg_light, bg = colors.selection },
    PmenuSbar = { bg = colors.bg_dark },
    PmenuThumb = { bg = colors.fg_dark },

    -- Messages
    ErrorMsg = { fg = colors.red },
    WarningMsg = { fg = colors.orange },
    MoreMsg = { fg = colors.blue },
    Question = { fg = colors.blue },

    -- Diff
    DiffAdd = { fg = colors.green, bg = colors.bg },
    DiffChange = { fg = colors.yellow, bg = colors.bg },
    DiffDelete = { fg = colors.red, bg = colors.bg },
    DiffText = { fg = colors.blue, bg = colors.bg },

    -- Syntax highlighting
    Comment = { fg = colors.comment },
    Constant = { fg = colors.orange },
    String = { fg = colors.green },
    Character = { fg = colors.green },
    Number = { fg = colors.blue },
    Boolean = { fg = colors.purple },
    Float = { fg = colors.blue },

    Identifier = { fg = colors.fg_light },
    Function = { fg = colors.yellow },

    Statement = { fg = colors.purple },
    Conditional = { fg = colors.purple },
    Repeat = { fg = colors.purple },
    Label = { fg = colors.purple },
    Operator = { fg = colors.fg_light },
    Keyword = { fg = colors.purple },
    Exception = { fg = colors.purple },

    PreProc = { fg = colors.purple },
    Include = { fg = colors.purple },
    Define = { fg = colors.purple },
    Macro = { fg = colors.purple },
    PreCondit = { fg = colors.purple },

    Type = { fg = colors.blue },
    StorageClass = { fg = colors.purple },
    Structure = { fg = colors.purple },
    Typedef = { fg = colors.purple },

    Special = { fg = colors.blue },
    SpecialChar = { fg = colors.blue },
    Tag = { fg = colors.red },
    Delimiter = { fg = colors.fg },
    SpecialComment = { fg = colors.comment },
    Debug = { fg = colors.red },

    Underlined = { underline = true },
    Ignore = { fg = colors.fg_dark },
    Error = { fg = colors.red },
    Todo = { fg = colors.yellow, bold = true },

    -- Treesitter
    ["@comment"] = { link = "Comment" },
    ["@error"] = { link = "Error" },
    ["@none"] = { bg = "NONE", fg = "NONE" },
    ["@preproc"] = { link = "PreProc" },
    ["@define"] = { link = "Define" },
    ["@operator"] = { link = "Operator" },

    ["@punctuation.delimiter"] = { fg = colors.fg },
    ["@punctuation.bracket"] = { fg = colors.fg },
    ["@punctuation.special"] = { fg = colors.fg },

    ["@string"] = { link = "String" },
    ["@string.regex"] = { fg = colors.cyan },
    ["@string.escape"] = { fg = colors.blue },
    ["@string.special"] = { fg = colors.blue },

    ["@character"] = { link = "Character" },
    ["@character.special"] = { fg = colors.blue },

    ["@boolean"] = { link = "Boolean" },
    ["@number"] = { link = "Number" },
    ["@float"] = { link = "Float" },

    ["@function"] = { link = "Function" },
    ["@function.builtin"] = { fg = colors.blue },
    ["@function.call"] = { fg = colors.yellow },
    ["@function.macro"] = { fg = colors.purple },

    ["@method"] = { fg = colors.yellow },
    ["@method.call"] = { fg = colors.yellow },

    ["@constructor"] = { fg = colors.yellow },
    ["@parameter"] = { fg = colors.fg },

    ["@keyword"] = { link = "Keyword" },
    ["@keyword.function"] = { fg = colors.purple },
    ["@keyword.operator"] = { fg = colors.purple },
    ["@keyword.return"] = { fg = colors.purple },

    ["@conditional"] = { link = "Conditional" },
    ["@repeat"] = { link = "Repeat" },
    ["@debug"] = { link = "Debug" },
    ["@label"] = { link = "Label" },
    ["@include"] = { link = "Include" },
    ["@exception"] = { link = "Exception" },

    ["@type"] = { link = "Type" },
    ["@type.builtin"] = { fg = colors.blue },
    ["@type.definition"] = { fg = colors.blue },
    ["@type.qualifier"] = { fg = colors.purple },

    ["@storageclass"] = { link = "StorageClass" },
    ["@attribute"] = { fg = colors.orange },
    ["@field"] = { fg = colors.orange },
    ["@property"] = { fg = colors.orange },

    ["@variable"] = { fg = colors.fg_light },
    ["@variable.builtin"] = { fg = colors.fg_light },

    ["@constant"] = { link = "Constant" },
    ["@constant.builtin"] = { fg = colors.orange },
    ["@constant.macro"] = { fg = colors.purple },

    ["@namespace"] = { fg = colors.purple },
    ["@symbol"] = { fg = colors.orange },

    ["@text"] = { fg = colors.fg },
    ["@text.title"] = { fg = colors.green, bold = true },
    ["@text.literal"] = { fg = colors.green },
    ["@text.uri"] = { fg = colors.blue, underline = true },
    ["@text.math"] = { fg = colors.blue },
    ["@text.reference"] = { fg = colors.blue },
    ["@text.todo"] = { link = "Todo" },
    ["@text.note"] = { fg = colors.green, bold = true },
    ["@text.warning"] = { fg = colors.orange, bold = true },
    ["@text.danger"] = { fg = colors.red, bold = true },

    ["@text.diff.add"] = { link = "DiffAdd" },
    ["@text.diff.delete"] = { link = "DiffDelete" },

    ["@tag"] = { fg = colors.red },
    ["@tag.attribute"] = { fg = colors.orange },
    ["@tag.delimiter"] = { fg = colors.fg },

    -- LSP
    DiagnosticError = { fg = colors.red },
    DiagnosticWarn = { fg = colors.orange },
    DiagnosticInfo = { fg = colors.blue },
    DiagnosticHint = { fg = colors.green },

    DiagnosticUnderlineError = { undercurl = true, sp = colors.red },
    DiagnosticUnderlineWarn = { undercurl = true, sp = colors.orange },
    DiagnosticUnderlineInfo = { undercurl = true, sp = colors.blue },
    DiagnosticUnderlineHint = { undercurl = true, sp = colors.green },

    DiagnosticSignError = { fg = colors.red },
    DiagnosticSignWarn = { fg = colors.orange },
    DiagnosticSignInfo = { fg = colors.blue },
    DiagnosticSignHint = { fg = colors.green },

    LspReferenceText = { bg = colors.highlight },
    LspReferenceRead = { bg = colors.highlight },
    LspReferenceWrite = { bg = colors.highlight },

    -- Git
    GitSignsAdd = { fg = colors.green },
    GitSignsChange = { fg = colors.yellow },
    GitSignsDelete = { fg = colors.red },

    -- NvimTree
    NvimTreeNormal = { fg = colors.fg, bg = colors.bg_dark },
    NvimTreeFolderName = { fg = colors.fg },
    NvimTreeFolderIcon = { fg = colors.blue },
    NvimTreeOpenedFolderName = { fg = colors.fg_light },
    NvimTreeEmptyFolderName = { fg = colors.fg_dark },
    NvimTreeIndentMarker = { fg = colors.fg_dark },
    NvimTreeSymlink = { fg = colors.blue },
    NvimTreeRootFolder = { fg = colors.fg_dark },
    NvimTreeTypescriptIcon = { fg = colors.blue },

    -- Telescope
    TelescopeNormal = { fg = colors.fg, bg = colors.bg_dark },
    TelescopeBorder = { fg = colors.border, bg = colors.bg_dark },
    TelescopePromptBorder = { fg = colors.border, bg = colors.bg_dark },
    TelescopeResultsBorder = { fg = colors.border, bg = colors.bg_dark },
    TelescopePreviewBorder = { fg = colors.border, bg = colors.bg_dark },
    TelescopePromptPrefix = { fg = colors.blue },
    TelescopeSelectionCaret = { fg = colors.blue },
    TelescopeSelection = { fg = colors.fg_light, bg = colors.selection },

    -- Indent Blankline
    IndentBlanklineChar = { fg = colors.border },
    IndentBlanklineContextChar = { fg = colors.fg_dark },

    -- WhichKey
    WhichKey = { fg = colors.blue },
    WhichKeyGroup = { fg = colors.purple },
    WhichKeyDesc = { fg = colors.fg },
    WhichKeySeperator = { fg = colors.fg_dark },

    -- Cmp
    CmpItemAbbr = { fg = colors.fg },
    CmpItemAbbrDeprecated = { fg = colors.fg_dark, strikethrough = true },
    CmpItemAbbrMatch = { fg = colors.blue },
    CmpItemAbbrMatchFuzzy = { fg = colors.blue },
    CmpItemKind = { fg = colors.fg_dark },
    CmpItemMenu = { fg = colors.fg_dark },

    -- Neogit
    NeogitDiffAddHighlight = { fg = colors.green, bg = colors.bg_dark },
    NeogitDiffDeleteHighlight = { fg = colors.red, bg = colors.bg_dark },
    NeogitDiffContextHighlight = { bg = colors.bg },
    NeogitHunkHeader = { fg = colors.fg, bg = colors.bg_dark },
    NeogitHunkHeaderHighlight = { fg = colors.fg_light, bg = colors.bg_dark },

    -- Hop
    HopNextKey = { fg = colors.yellow, bold = true },
    HopNextKey1 = { fg = colors.blue, bold = true },
    HopNextKey2 = { fg = colors.purple },
    HopUnmatched = { fg = colors.fg_dark },

    -- Illuminate
    IlluminatedWordText = { bg = colors.highlight },
    IlluminatedWordRead = { bg = colors.highlight },
    IlluminatedWordWrite = { bg = colors.highlight },

    -- Notify
    NotifyERRORBorder = { fg = colors.red },
    NotifyWARNBorder = { fg = colors.orange },
    NotifyINFOBorder = { fg = colors.blue },
    NotifyDEBUGBorder = { fg = colors.fg_dark },
    NotifyTRACEBorder = { fg = colors.purple },
    NotifyERRORIcon = { fg = colors.red },
    NotifyWARNIcon = { fg = colors.orange },
    NotifyINFOIcon = { fg = colors.blue },
    NotifyDEBUGIcon = { fg = colors.fg_dark },
    NotifyTRACEIcon = { fg = colors.purple },
    NotifyERRORTitle = { fg = colors.red },
    NotifyWARNTitle = { fg = colors.orange },
    NotifyINFOTitle = { fg = colors.blue },
    NotifyDEBUGTitle = { fg = colors.fg_dark },
    NotifyTRACETitle = { fg = colors.purple },
  }

  -- Apply highlights
  for group, styles in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, styles)
  end
end

return M
