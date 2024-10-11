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
    -- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
    -- groups, mostly used for styling UI elements.
    -- Comment them out and add your own properties to override the defaults.
    -- An empty definition `{}` will clear all styling, leaving elements looking
    -- like the 'Normal' group.
    -- To be able to link to a group, it must already be defined, so you may have
    -- to reorder items as you go.
    --
    -- See :h highlight-groups
    --
    -- ColorColumn    { bg = colors.extra_light }, -- Columns set with 'colorcolumn'
    -- Conceal        { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor         { bg = get_color("yellow"), fg = get_color("gray", 800) }, -- Character under the cursor
    CurSearch      { bg = get_color("sky", "light"), fg = get_color("gray", 800) },
    -- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
    CursorColumn   { bg = get_color("gray", 950) }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    -- CursorLine     {}, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory      { fg = get_color("sky") }, -- Directory names (and other special names in listings)
    -- DiffAdd        { }, -- Diff mode: Added line |diff.txt|
    -- DiffChange     { }, -- Diff mode: Changed line |diff.txt|
    -- DiffDelete     { }, -- Diff mode: Deleted line |diff.txt|
    -- DiffText       { }, -- Diff mode: Changed text within a changed line |diff.txt|
    -- EndOfBuffer    { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    -- TermCursor     { }, -- Cursor in a focused terminal
    -- TermCursorNC   { }, -- Cursor in an unfocused terminal
    -- ErrorMsg       { }, -- Error messages on the command line
    -- VertSplit      { }, -- Column separating vertically split windows
    -- Folded         { }, -- Line used for closed folds
    -- FoldColumn     { }, -- 'foldcolumn'
    SignColumn     { bg = get_color("gray", 950) }, -- Column where |signs| are displayed
    GitSignsAdd { SignColumn, fg = get_color("green") },
    GitSignsChange { SignColumn, fg = get_color("gray", 600) },
    GitSignsDelete { SignColumn, fg = get_color("red", "bold") },
    -- IncSearch      { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    -- Substitute     { }, -- |:substitute| replacement text highlighting
    -- LineNr         { bg = get_color("gray", 950), fg = get_color("cyan") }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    LineNr         { bg = get_color("gray", 950), fg = get_color("orange", "dark_variant") }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    -- LineNrAbove    { bg = get_color("gray", 950), fg = get_color("orange", "dark_variant") }, -- Line number for when the 'relativenumber' option is set, above the cursor line
    -- LineNrBelow    { bg = get_color("gray", 950), fg = get_color("orange", "dark_variant") }, -- Line number for when the 'relativenumber' option is set, below the cursor line
    -- CursorLineNr   { bg = get_color("gray", 950), fg = get_color("gray", 200) }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    CursorLineNr   { bg = get_color("gray", 950), fg = get_color("orange", "secondary") }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    -- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
    -- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
    -- MatchParen     { }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- ModeMsg        { }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea        { bg = get_color("gray", 500) }, -- Area for messages and cmdline
    MoreMsg        { MsgArea }, -- |more-prompt|
    Normal         { bg = get_color("gray", 1000), fg = get_color("sky", "ultralight") }, -- Normal text
    NormalFloat    { bg = get_color("gray", 900), fg = get_color("gray", 0), }, -- Normal text in floating windows.
    FloatShadow    { NormalFloat }, -- Normal text in floating windows.
    FloatShadowThrough    { NormalFloat }, -- Normal text in floating windows.
    FloatBorder    { NormalFloat, fg = get_color("magenta") }, -- Border of floating windows.
    FloatTitle     { NormalFloat }, -- Title of floating windows.
    -- NonText        {  NormalFloat }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    -- NormalNC       { bg = get_color("gray", 800) }, -- normal text in non-current windows
    MsgSeparator   { NormalFloat }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    Pmenu          { bg = get_color("gray", 900) }, -- Popup menu: Normal item.
    PmenuSel       { bg = get_color("gray", 500), fg = get_color("sky", "light") }, -- Popup menu: Selected item.
    CmpSelect      { bg = get_color("gray", 500), fg = get_color("sky", "light") },
    CmpItemAbbrMatch { fg = get_color("yellow") },
    PmenuKind      { fg = get_color("magenta") }, -- Popup menu: Normal item "kind"
    PmenuKindSel   { fg = get_color("magenta") }, -- Popup menu: Selected item "kind"
    -- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
    -- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
    PmenuSbar      { bg = get_color("gray", 800) }, -- Popup menu: Scrollbar.
    -- PmenuThumb     { }, -- Popup menu: Thumb of the scrollbar.
    -- Question       { }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine   { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search         { CurSearch }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    -- SpecialKey     { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    -- SpellBad       { undercurl = "true" }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    StatusLine     { NormalFloat }, -- Status line of current window
    StatusLineNC   { NormalFloat }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine        { NormalFloat }, -- Tab pages line, not active tab page label
    TabLineFill    { NormalFloat }, -- Tab pages line, where there are no labels
    -- TabLineSel     { }, -- Tab pages line, active tab page label
    Title          { fg = get_color("chartreuse") }, -- Titles for output from ":set all", ":autocmd" etc.
    Visual         { bg = get_color("gray", 700) }, -- Visual mode selection
    VisualNOS      { Visual }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg     { Visual }, -- Warning messages
    -- Whitespace     { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    Winseparator   { NormalFloat, fg = get_color("gray", 600) }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    -- WildMenu       { }, -- Current match in 'wildmenu' completion
    -- WinBar         { }, -- Window bar of current window
    -- WinBarNC       { }, -- Window bar of not-current windows
    LspCodeLens = { NormalFloat, fg= get_color("gray", 300) },
    LspInfoBorder = { NormalFloat },
    LspInfoFiletype = { bg = get_color("gray", 400), fg = get_color("magenta") },

    NvimFloat { NormalFloat, fg = get_color("chartreuse") },
    -- Common vim syntax groups used for all kinds of code and markup.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name
    --
    -- Uncomment and edit if you want more specific syntax highlighting.

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
    -- Repeat         { }, --   for, do, while, etc.
    -- Label          { }, --   case, default, etc.
    Operator       { fg = get_color("gray", 0) }, --   "sizeof", "+", "*", etc.
    Keyword        { fg = get_color("purple") }, --   any other keyword
    Exception      { fg = get_color("orange") }, --   try, catch, throw

    -- PreProc        { }, -- (*) Generic Preprocessor
    Include        { fg = get_color("yellow"), gui = "italic" }, --   Preprocessor #include
    Define         { fg = get_color("magenta") }, --   Preprocessor #define
    Macro          { fg = get_color("yellow"),  gui = "italic" }, --   Same as Define
    -- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

    Type           { fg = get_color("chartreuse") }, -- (*) int, long, char, etc.
    -- StorageClass   { }, --   static, register, volatile, etc.
    -- Structure      { }, --   struct, union, enum, etc.
    -- Typedef        { }, --   A typedef

    Special        { fg = get_color("yellow") }, -- (*) Any special symbol
    SpecialChar    { fg = get_color("orange") }, --   Special character in a constant
    -- Tag            { }, --   You can use CTRL-] on this
    -- Delimiter      { }, --   Character that needs attention
    SpecialComment { fg = get_color("sky"), gui = "italic" }, --   Special things inside a comment (e.g. '\n')
    -- Debug          { }, --   Debugging statements

    Underlined     { gui = "underline" }, -- Text that stands out, HTML links
    -- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    Error          { bg = get_color("red", "bold"), fg = get_color("gray", 200) }, -- Any erroneous construct
    Todo           { bg = get_color("gray", 700), fg = get_color("sky", "light") }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- LspReferenceText            { } , -- Used for highlighting "text" references
    -- LspReferenceRead            { } , -- Used for highlighting "read" references
    -- LspReferenceWrite           { } , -- Used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
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

    -- Tree-Sitter syntax groups.
    --
    -- See :h treesitter-highlight-groups, some groups may not be listed,
    -- submit a PR fix to lush-template!
    --
    -- Tree-Sitter groups are defined with an "@" symbol, which must be
    -- specially handled to be valid lua code, we do this via the special
    -- sym function. The following are all valid ways to call the sym function,
    -- for more details see https://www.lua.org/pil/5.html
    --
    -- sym("@text.literal")
    -- sym('@text.literal')
    -- sym"@text.literal"
    -- sym'@text.literal'
    --
    -- For more information see https://github.com/rktjmp/lush.nvim/issues/109

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
    -- sym"@repeat"            { }, -- Repeat
    -- sym"@label"             { }, -- Label
    -- sym"@operator"          { }, -- Operator
    -- sym"@keyword"           { }, -- Keyword
    -- sym"@exception"         { }, -- Exception
    -- sym"@variable"          { }, -- Identifier
    -- sym"@type"              { }, -- Type
    -- sym"@type.definition"   { }, -- Typedef
    -- sym"@storageclass"      { }, -- StorageClass
    -- sym"@structure"         { }, -- Structure
    -- sym"@namespace"         { }, -- Identifier
    -- sym"@include"           { }, -- Include
    -- sym"@preproc"           { }, -- PreProc
    -- sym"@debug"             { }, -- Debug
    -- sym"@tag"               { }, -- Tag
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

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
