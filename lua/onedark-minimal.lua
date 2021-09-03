--[[

Color scheme for reference (copied from original repo):

+---------------------------------------------+
|  Color Name  |         RGB        |   Hex   |
|--------------+--------------------+---------|
| Black        | rgb(40, 44, 52)    | #282c34 |
|--------------+--------------------+---------|
| White        | rgb(171, 178, 191) | #abb2bf |
|--------------+--------------------+---------|
| Light Red    | rgb(224, 108, 117) | #e06c75 |
|--------------+--------------------+---------|
| Dark Red     | rgb(190, 80, 70)   | #be5046 |
|--------------+--------------------+---------|
| Green        | rgb(152, 195, 121) | #98c379 |
|--------------+--------------------+---------|
| Light Yellow | rgb(229, 192, 123) | #e5c07b |
|--------------+--------------------+---------|
| Dark Yellow  | rgb(209, 154, 102) | #d19a66 |
|--------------+--------------------+---------|
| Blue         | rgb(97, 175, 239)  | #61afef |
|--------------+--------------------+---------|
| Magenta      | rgb(198, 120, 221) | #c678dd |
|--------------+--------------------+---------|
| Cyan         | rgb(86, 182, 194)  | #56b6c2 |
|--------------+--------------------+---------|
| Gutter Grey  | rgb(76, 82, 99)    | #4b5263 |
|--------------+--------------------+---------|
| Comment Grey | rgb(92, 99, 112)   | #5c6370 |
+---------------------------------------------+

--]]

-- Clear and reset.
vim.cmd "highlight clear"

if vim.g.syntax_on ~= nil then
    vim.cmd "syntax reset"
end

vim.g.colors_name = "onedark"

-- Define colors. Allow overrides.
local ovr = vim.g.onedark_overrides or {}

local red            = ovr.red            or "#E06C75"
local dark_red       = ovr.dark_red       or "#BE5046"
local green          = ovr.green          or "#98C379"
local yellow         = ovr.yellow         or "#E5C07B"
local dark_yellow    = ovr.dark_yellow    or "#D19A66"
local blue           = ovr.blue           or "#61AFEF"
local purple         = ovr.purple         or "#C678DD"
local cyan           = ovr.cyan           or "#56B6C2"
local white          = ovr.white          or "#ABB2BF"
local black          = ovr.black          or "#282C34"
local foreground     = ovr.foreground     or "#ABB2BF"
local background     = ovr.background     or "#282C34"
local comment_grey   = ovr.comment_grey   or "#5C6370"
local gutter_fg_grey = ovr.gutter_fg_grey or "#4B5263"
local cursor_grey    = ovr.cursor_grey    or "#2C323C"
local visual_grey    = ovr.visual_grey    or "#3E4452"
local menu_grey      = ovr.menu_grey      or "#3E4452"
local special_grey   = ovr.special_grey   or "#3B4048"
local vertsplit      = ovr.vertsplit      or "#3E4452"

-- Whether to hide the tildes marking end of buffer
local hide_bufend = vim.g.onedark_hide_endofbuffer

-- Whether to use italics or not
local use_italics = vim.g.onedark_use_italics

-- Util function to highlight groups.
local function hi(group, style)
    if not use_italics then
        if style.gui and style.gui == "italic" then
            style.gui = nil
        end
    end

    -- Build attr-list.
    local attrs = " "
    attrs = attrs .. "guifg=" .. (style.fg  or "NONE") .. " "
    attrs = attrs .. "guibg=" .. (style.bg  or "NONE") .. " "
    attrs = attrs .. "guisp=" .. (style.sp  or "NONE") .. " "
    attrs = attrs .. "gui="   .. (style.gui or "NONE") .. " "

    vim.cmd("highlight " .. group .. attrs)
end

-- Syntax Groups (descriptions and ordering from `:h w18`)

hi("Comment",        { fg = comment_grey, gui = "italic" })
hi("Constant",       { fg = cyan })
hi("String",         { fg = green })
hi("Character",      { fg = green })
hi("Number",         { fg = dark_yellow })
hi("Boolean",        { fg = dark_yellow })
hi("Float",          { fg = dark_yellow })
hi("Identifier",     { fg = red })
hi("Function",       { fg = blue })
hi("Statement",      { fg = purple })
hi("Conditional",    { fg = purple })
hi("Repeat",         { fg = purple })
hi("Label",          { fg = purple })
hi("Operator",       { fg = purple })
hi("Keyword",        { fg = red })
hi("Exception",      { fg = purple })
hi("PreProc",        { fg = yellow })
hi("Include",        { fg = blue })
hi("Define",         { fg = purple })
hi("Macro",          { fg = purple })
hi("PreCondit",      { fg = yellow })
hi("Type",           { fg = yellow })
hi("StorageClass",   { fg = yellow })
hi("Structure",      { fg = yellow })
hi("Typedef",        { fg = yellow })
hi("Special",        { fg = blue })
hi("SpecialChar",    { fg = dark_yellow })
hi("SpecialComment", { fg = comment_grey })
hi("Underlined",     { gui = "underline" })
hi("Error",          { fg = red })
hi("Todo",           { fg = purple })
hi("Tag",            {})
hi("Debug",          {})
hi("Delimiter",      {})
hi("Ignore",         {})

-- Highlighting Groups (descriptions and ordering from `:h highlight-groups`) {{{

hi("ColorColumn",  { bg = cursor_grey })
hi("Cursor",       { fg = black, bg = blue })
hi("CursorColumn", { bg = cursor_grey })
hi("CursorIM",     {})
hi("Conceal",      {})

if vim.opt.diff:get() then
  hi("CursorLine", { gui = "underline" })
else
  hi("CursorLine", { bg = cursor_grey })
end

hi("Directory",  { fg = blue })
hi("DiffAdd",    { bg = green, fg = black })
hi("DiffChange", { fg = yellow, gui = "underline" })
hi("DiffDelete", { bg = red, fg = black })
hi("DiffText",   { bg = yellow, fg = black })

if hide_bufend then
    hi("EndOfBuffer", { fg = black })
end

hi("ErrorMsg",         { fg = red })
hi("VertSplit",        { fg = vertsplit })
hi("Folded",           { fg = comment_grey })
hi("IncSearch",        { fg = yellow, bg = comment_grey })
hi("LineNr",           { fg = gutter_fg_grey })
hi("MatchParen",       { fg = blue, gui = "underline" })
hi("NonText",          { fg = special_grey })
hi("Normal",           { fg = foreground, bg = background })
hi("Pmenu",            { fg = white, bg = menu_grey })
hi("PmenuSel",         { fg = cursor_grey, bg = blue })
hi("PmenuSbar",        { bg = cursor_grey })
hi("PmenuThumb",       { bg = white })
hi("Question",         { fg = purple })
hi("QuickFixLine",     { fg = black, bg = yellow })
hi("Search",           { fg = black, bg = yellow })
hi("SpecialKey",       { fg = special_grey })
hi("SpellBad",         { fg = red, gui = "underline" })
hi("SpellCap",         { fg = dark_yellow })
hi("SpellLocal",       { fg = dark_yellow })
hi("SpellRare",        { fg = dark_yellow })
hi("StatusLine",       { fg = white, bg = cursor_grey })
hi("StatusLineNC",     { fg = comment_grey })
hi("StatusLineTerm",   { fg = white, bg = cursor_grey })
hi("StatusLineTermNC", { fg = comment_grey })
hi("TabLine",          { fg = comment_grey })
hi("TabLineSel",       { fg = white })
hi("Terminal",         { fg = white, bg = black })
hi("Title",            { fg = green })
hi("Visual",           { bg = visual_grey })
hi("VisualNOS",        { bg = visual_grey })
hi("WarningMsg",       { fg = yellow })
hi("WildMenu",         { fg = black, bg = blue })
hi("FoldColumn",       {})
hi("SignColumn",       {})
hi("CursorLineNr",     {})
hi("ModeMsg",          {})
hi("MoreMsg",          {})
hi("TabLineFill",      {})

-- Neovim LSP
hi("LspDiagnosticsDefaultError",           { fg = red })
hi("LspDiagnosticsDefaultWarning",         { fg = yellow })
hi("LspDiagnosticsDefaultInformation",     { fg = blue })
hi("LspDiagnosticsDefaultHint",            { fg = cyan })
hi("LspDiagnosticsUnderlineError",         { fg = red, gui = "underline" })
hi("LspDiagnosticsUnderlineWarning",       { fg = yellow, gui = "underline" })
hi("LspDiagnosticsUnderlineInformation",   { fg = blue, gui = "underline" })
hi("LspDiagnosticsUnderlineHint",          { fg = cyan, gui = "underline", })
hi("LspDiagnosticsVirtualTextError",       { fg = red, bg = cursor_grey  })
hi("LspDiagnosticsVirtualTextWarning",     { fg = yellow, bg = cursor_grey  })
hi("LspDiagnosticsVirtualTextInformation", { fg = blue, bg = cursor_grey  })
hi("LspDiagnosticsVirtualTextHint",        { fg = cyan, bg = cursor_grey  })

-- Must appear at the end of the file to work around this oddity:
-- https://groups.google.com/forum/#!msg/vim_dev/afPqwAFNdrU/nqh6tOM87QUJ
vim.o.background = "dark"

-- Expose highlight function
return { hi = hi }

