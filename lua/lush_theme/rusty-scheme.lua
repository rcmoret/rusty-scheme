--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require('lush')
local hsl = lush.hsl

local colors = {
  orange = {
    primary = hsl(22, 100, 73),
    secondary = hsl(22, 100, 78),
    dark_variant = hsl(22, 20, 35)
  },
  yellow = {
    primary = hsl(52, 40, 67),
    bold = hsl(52, 100, 75),
  },
  chartreuse = {
    primary = hsl(112, 28, 58),
  },
  green = {
    primary = hsl(142, 30, 38),
  },
  cyan = {
    primary = hsl(172, 90, 30),
  },
  sky = {
    primary = hsl(202, 70, 68),
    light = hsl(202, 70, 82),
    ultralight = hsl(202, 100, 96)
  },
  blue = { primary = hsl(232, 100, 73), },
  purple = {
    primary = hsl(262, 67, 77),
    light = hsl(262, 67, 77).li(20)
  },
  magenta = {
    primary = hsl(322, 50, 74),
    bold = hsl(322, 60, 60),
  },
  red = {
    primary = hsl(352, 68, 70),
    bold = hsl(352, 66, 60),
  },
  gray = {
    [0] = hsl(202, 8, 98),
    [100] = hsl(202, 8, 85),
    [200] = hsl(202, 8, 75),
    [300] = hsl(202, 10, 65),
    [400] = hsl(202, 12, 55),
    [500] = hsl(202, 15, 45),
    [600] = hsl(202, 17, 35),
    [700] = hsl(202, 22, 25),
    [800] = hsl(202, 22, 20),
    [900] = hsl(202, 24, 17),
    [950] = hsl(202, 25, 13),
    [1000] = hsl(202, 30, 10)
  }
}

local get_color = function(name, supplied_variant)
  local variant = supplied_variant or "primary"
  return colors[name][variant]
end

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    Cursor         { bg = get_color("yellow"), fg = get_color("gray", 800) }, -- Character under the cursor
    CurSearch      { bg = get_color("sky", "light"), fg = get_color("gray", 800) },
    CursorColumn   { bg = get_color("gray", 950) }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    Directory      { fg = get_color("sky") }, -- Directory names (and other special names in listings)
    SignColumn     { bg = get_color("gray", 950) }, -- Column where |signs| are displayed
    GitSignsAdd { SignColumn, fg = get_color("green") },
    GitSignsChange { SignColumn, fg = get_color("gray", 600) },
    GitSignsDelete { SignColumn, fg = get_color("red", "bold") },
    LineNr         { bg = get_color("gray", 950), fg = get_color("orange", "dark_variant") }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr   { bg = get_color("gray", 950), fg = get_color("orange", "secondary") }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MsgArea        { bg = get_color("gray", 500) }, -- Area for messages and cmdline
    MoreMsg        { MsgArea }, -- |more-prompt|
    Normal         { bg = get_color("gray", 1000), fg = get_color("sky", "ultralight") }, -- Normal text
    NormalFloat    { bg = get_color("gray", 900), fg = get_color("gray", 0), }, -- Normal text in floating windows.
    FloatShadow    { NormalFloat }, -- Normal text in floating windows.
    FloatShadowThrough    { NormalFloat }, -- Normal text in floating windows.
    FloatBorder    { NormalFloat, fg = get_color("magenta") }, -- Border of floating windows.
    FloatTitle     { NormalFloat }, -- Title of floating windows.
    MsgSeparator   { NormalFloat }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    Pmenu          { bg = get_color("gray", 900) }, -- Popup menu: Normal item.
    PmenuSel       { bg = get_color("gray", 500), fg = get_color("sky", "light") }, -- Popup menu: Selected item.
    CmpSelect      { bg = get_color("gray", 500), fg = get_color("sky", "light") },
    CmpItemAbbrMatch { fg = get_color("yellow") },
    PmenuKind      { fg = get_color("magenta") }, -- Popup menu: Normal item "kind"
    PmenuKindSel   { fg = get_color("magenta") }, -- Popup menu: Selected item "kind"
    PmenuSbar      { bg = get_color("gray", 800) }, -- Popup menu: Scrollbar.
    Search         { CurSearch }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    StatusLine     { NormalFloat }, -- Status line of current window
    StatusLineNC   { NormalFloat }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine        { NormalFloat }, -- Tab pages line, not active tab page label
    TabLineFill    { NormalFloat }, -- Tab pages line, where there are no labels
    Title          { fg = get_color("chartreuse") }, -- Titles for output from ":set all", ":autocmd" etc.
    Visual         { bg = get_color("gray", 700) }, -- Visual mode selection
    VisualNOS      { Visual }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg     { Visual }, -- Warning messages
    Winseparator   { NormalFloat, fg = get_color("gray", 600) }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    LspCodeLens = { NormalFloat, fg= get_color("gray", 300) },
    LspInfoBorder = { NormalFloat },
    LspInfoFiletype = { bg = get_color("gray", 400), fg = get_color("magenta") },
    NvimFloat { NormalFloat, fg = get_color("chartreuse") },
    Comment        { fg = get_color("gray", 600) }, -- Any comment
    PreProc        { fg = get_color("purple", "light") }, -- (*) Generic Preprocessor
    Constant       { fg = get_color("chartreuse") }, -- (*) Any constant
    String         { fg = get_color("blue") }, --   A string constant: "this is a string"
    Number         { fg = get_color("blue") }, --   A number constant: 234, 0xff
    Boolean        { fg = get_color("red"), gui = "italic" }, --   A boolean constant: TRUE, fals
    Identifier     { fg = get_color("sky") },
    Function       { fg = get_color("sky") }, --   Function name (also: methods for classes)
    Statement      { fg = get_color("orange", "secondary") }, -- (*) Any statement
    Character      { fg = get_color("gray", 200) }, --   A character constant: 'c', '\n'
    Conditional    { fg = get_color("red"), gui = "underline" }, --   if, then, else, endif, switch, etc.
    Operator       { fg = get_color("gray", 0) }, --   "sizeof", "+", "*", etc.
    Keyword        { fg = get_color("purple") }, --   any other keyword
    Exception      { fg = get_color("orange") }, --   try, catch, throw
    Include        { fg = get_color("yellow"), gui = "italic" }, --   Preprocessor #include
    Define         { fg = get_color("magenta") }, --   Preprocessor #define
    Macro          { fg = get_color("yellow"),  gui = "italic" }, --   Same as Define
    Type           { fg = get_color("chartreuse") }, -- (*) int, long, char, etc.
    Special        { fg = get_color("yellow") }, -- (*) Any special symbol
    SpecialChar    { fg = get_color("orange") }, --   Special character in a constant
    SpecialComment { fg = get_color("sky"), gui = "italic" }, --   Special things inside a comment (e.g. '\n')
    Underlined     { gui = "underline" }, -- Text that stands out, HTML links
    Error          { bg = get_color("red", "bold"), fg = get_color("gray", 200) }, -- Any erroneous construct
    Todo           { bg = get_color("gray", 700), fg = get_color("sky", "light") }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    DiagnosticError            { gui = "non" } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn             { gui = "non" } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo             { gui = "non" } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticHint             { fg = get_color("purple"), gui = "none" } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticOk               { gui = "none" } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticVirtualTextError { fg = get_color("red", "bold") } , -- Used for "Error" diagnostic virtual text.
    DiagnosticVirtualTextWarn  { fg = get_color("yellow", "bold") } , -- Used for "Warn" diagnostic virtual text.
    DiagnosticVirtualTextInfo  { fg = get_color("magenta", "bold") } , -- Used for "Info" diagnostic virtual text.
    DiagnosticVirtualTextHint  { fg = get_color("purple") } , -- Used for "Hint" diagnostic virtual text.
    DiagnosticVirtualTextOk    { fg = get_color("chartreuse") } , -- Used for "Ok" diagnostic virtual text.
    DiagnosticUnderlineError   { gui = "undercurl" } , -- Used to underline "Error" diagnostics.
    DiagnosticUnderlineWarn    { gui = "undercurl"  } , -- Used to underline "Warn" diagnostics.
    DiagnosticUnderlineInfo    { gui = "undercurl" } , -- Used to underline "Info" diagnostics.
    DiagnosticUnderlineHint    { gui = "underculr" } , -- Used to underline "Hint" diagnostics.
    DiagnosticUnderlineOk      { DiagnosticVirtualTextOk   } , -- Used to underline "Ok" diagnostics.
    DiagnosticFloatingError    { fg = get_color("red", "bold") } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    DiagnosticFloatingWarn     { fg = get_color("yellow", "bold")  } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    DiagnosticFloatingInfo     { fg = get_color("sky")  } , -- Used to color "Info" diagnostic messages in diagnostics float.
    DiagnosticFloatingHint     { fg = get_color("purple")  } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    DiagnosticFloatingOk       { fg = get_color("chartreuse")    } , -- Used to color "Ok" diagnostic messages in diagnostics float.
    DiagnosticSignError        { DiagnosticVirtualTextError, bg = get_color("gray", 950) } , -- Used for "Error" signs in sign column.
    DiagnosticSignWarn         { DiagnosticVirtualTextWarn,  bg = get_color("gray", 950) } , -- Used for "Warn" signs in sign column.
    DiagnosticSignInfo         { DiagnosticVirtualTextInfo,  bg = get_color("gray", 950) } , -- Used for "Info" signs in sign column.
    DiagnosticSignHint         { DiagnosticVirtualTextHint,  bg = get_color("gray", 950) } , -- Used for "Hint" signs in sign column.
    DiagnosticSignOk           { DiagnosticVirtualTextOk,  bg = get_color("gray", 950) } , -- Used for "Ok" signs in sign column.
    sym"@text.literal"      { String },
    sym"@text.reference"    { Identifier },
    sym"@text.title"        { Title },
    sym"@text.uri"          { fg = get_color("purple"), gui = "underline" },
    sym"@text.underline"    { Underlined },
    sym"@text.todo"         { Todo },
    sym"@comment"           { Comment },
    sym"@punctuation"       { fg = get_color("red") },
    sym"@constant"          { Constant },
    sym"@constant.builtin"  { fg = get_color("blue") },
    sym"@constant.macro"    { fg = get_color("yellow"), gui = "italic" },
    sym"@define"            { Define },
    sym"@macro"             { Macro },
    sym"@string"            { String },
    sym"@string.escape"     { SpecialChar },
    sym"@string.special"    { SpecialChar },
    sym"@character"         { Character },
    sym"@character.special" { SpecialChar },
    sym"@number"            { Number },
    sym"@boolean"           { Boolean },
    sym"@float"             { Number },
    sym"@function"          { Function },
    sym"@function.builtin"  { Special },
    sym"@function.macro"    { Macro },
    sym"@parameter"         { Identifier },
    sym"@method"            { Function },
    sym"@field"             { Identifier },
    sym"@property"          { Identifier },
    sym"@constructor"       { Special },
    sym"@conditional"       { Conditional },
    rubySymbol { fg = get_color("sky") },
    rubyDefine { fg = get_color("sky"), gui = "underline" },
    rubyRegexp { fg = get_color("sky"), gui = "italic" },
    rubyRegexpCharClass { rubyRegexp },
    rubyStringDelimiter { String },
    rubyFunction { fg = get_color("purple")},
    rubyInstanceVariable { fg = get_color("purple") },
    rubyPseudoVariable { fg = get_color("chartreuse") },
    rubyClass { fg = get_color("magenta"), gui = "underline" },
    rubyModule { rubyClass },
    rubyException { rubyClass },
    rubyConstant { Constant  },
    sym"@lsp.type.namespace" { rubyConstant },
    rubyClassName { rubyConstant },
    rubyArrayDelimiter { fg = get_color("red") },
    rubyCurlyBlockDelimiter { rubyArrayDelimiter },
    rubyControl { fg = get_color("orange") },
    rubyBlockParameter { rubyControl },
    rubyBlockParameterList { rubyControl },
    rubyInterpolation { fg = get_color("sky") },
    rubyInterpolationDelimiter { rubyInterpolation},
    rubyMagicComment { fg = get_color("sky"), gui = "italic"  },
    rubyAssertion { fg = get_color("purple", "light"), gui = "italic" },
    rubyTestMacro { fg = get_color("sky", "light") },
    rubyTestHelper { fg = get_color("chartreuse").li(30) },
    rubyRegexpDelimiter { fg = get_color("chartreuse"), gui = "italic" },
    rubyAccess { rubyClass },
    rubyCallback { Macro },
    rubyValidation { Macro },
    rubyEntity { Macro },
    rubyEntities { Macro },
    rubyKeyword { Macro },
    htmlTag { fg = get_color("sky", "light") },
    htmlArg { htmlTag, gui = "underline" },
    erubyExpression { Normal },
    erubyBlock { erubyExpression },
    typeScriptVariable { fg = get_color("purple") },
    sym"@lsp.type.class.javascript" { fg = get_color("orange") },
    sym"@lsp.mod.readonly.javascript" { fg = get_color("orange") },
    TelescopeNormal { NormalFloat },
    TelescopeBorder { NormalFloat, fg = get_color("sky") },
    TelescopeMatching { fg = get_color("magenta") },
    TelescopeSelection { bg = get_color("gray", 700), fg = get_color("yellow") },
    TelescopePromptBorder { TelescopeBorder },
    TelescopePromptCounter { fg = get_color("gray", 200) },
    NeoTreeDotFile { fg = get_color("gray", 500) },
    NeoTreeGitAdded { fg = get_color("green"), gui = "italic" },
    NeoTreeGitModified { fg = get_color("yellow"), gui = "italic" },
    NotifyERRORBorder { NormalFloat, fg = get_color("red", "bold") },
    NotifyERRORBody { NormalFloat },
    NotifyERRORIcon { NormalFloat },
    NotifyERRORTitle { NormalFloat },
    NotifyWARNBorder { NormalFloat, fg = get_color("yellow", "bold") },
    NotifyWARNBody { NormalFloat },
    NotifyWARNIcon { NormalFloat },
    NotifyWARNTitle { NormalFloat },
    NotifyINFOBorder { NormalFloat, fg = get_color("sky") },
    NotifyINFOBody { NormalFloat },
    NotifyINFOIcon { NormalFloat },
    NotifyINFOTitle { NormalFloat },
    NotifyDEBUGBorder { NormalFloat, fg = get_color("orange") },
    NotifyDEBUGBody { NormalFloat },
    NotifyDEBUGIcon { NormalFloat },
    NotifyDEBUGTitle { NormalFloat },
    NotifyTRACEBorder { NormalFloat, fg = get_color("green") },
    NotifyTRACEBody { NormalFloat },
    NotifyTRACEIcon { NormalFloat },
    NotifyTRACETitle { NormalFloat },
    NotifyLogTime { NormalFloat },
    NotifyLogTitle { NormalFloat },
  }
end)

return theme
