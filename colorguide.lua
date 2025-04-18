


-- ONEDARK HIGHLIGHTS BASED ON TREESITTER --
-- https://github.com/navarasu/onedark.nvim/blob/master/lua/onedark/highlights.lua#L133-L257
-- ------------------------------------------------------------------------------------------------------

    Delimiter = colors.LightGrey,
    Comment = {fg = c.grey, fmt = cfg.code_style.comments},
    SpecialComment = {fg = c.grey, fmt = cfg.code_style.comments},
    Todo = {fg = c.red, fmt = cfg.code_style.comments}


if vim.api.nvim_call_function("has", { "nvim-0.8" }) == 1 then
    hl.treesitter = {
        -- nvim-treesitter@0.9.2 and after
        ["@annotation"] = colors.Fg,
        ["@attribute"] = colors.Cyan,
        ["@attribute.typescript"] = colors.Blue,
        ["@boolean"] = colors.Orange,
        ["@character"] = colors.Orange,
        ["@comment"] = {fg = c.grey, fmt = cfg.code_style.comments},
        ["@comment.todo"] = {fg = c.red, fmt = cfg.code_style.comments},
        ["@comment.todo.unchecked"] = {fg = c.red, fmt = cfg.code_style.comments},
        ["@comment.todo.checked"] = {fg = c.green, fmt = cfg.code_style.comments},
        ["@constant"] = {fg = c.orange, fmt = cfg.code_style.constants},
        ["@constant.builtin"] = {fg = c.orange, fmt = cfg.code_style.constants},
        ["@constant.macro"] = {fg = c.orange, fmt = cfg.code_style.constants},
        ["@constructor"] = {fg = c.yellow, fmt = "bold"},
        ["@diff.add"] = hl.common.DiffAdded,
        ["@diff.delete"] = hl.common.DiffDeleted,
        ["@diff.plus"] = hl.common.DiffAdded,
        ["@diff.minus"] = hl.common.DiffDeleted,
        ["@diff.delta"] = hl.common.DiffChanged,
        ["@error"] = colors.Fg,
        ["@function"] = {fg = c.blue, fmt = cfg.code_style.functions},
        ["@function.builtin"] = {fg = c.cyan, fmt = cfg.code_style.functions},
        ["@function.macro"] = {fg = c.cyan, fmt = cfg.code_style.functions},
        ["@function.method"] = {fg = c.blue, fmt = cfg.code_style.functions},
        ["@keyword"] = {fg = c.purple, fmt = cfg.code_style.keywords},
        ["@keyword.conditional"] = {fg = c.purple, fmt = cfg.code_style.keywords},
        ["@keyword.directive"] = colors.Purple,
        ["@keyword.exception"] = colors.Purple,
        ["@keyword.function"] = {fg = c.purple, fmt = cfg.code_style.functions},
        ["@keyword.import"] = colors.Purple,
        ["@keyword.operator"] =  {fg = c.purple, fmt = cfg.code_style.keywords},
        ["@keyword.repeat"] = {fg = c.purple, fmt = cfg.code_style.keywords},
        ["@label"] = colors.Red,
        ["@markup.emphasis"] = {fg = c.fg, fmt = 'italic'},
        ["@markup.environment"] = colors.Fg,
        ["@markup.environment.name"] = colors.Fg,
        ["@markup.heading"] = {fg = c.orange, fmt = 'bold'},
        ["@markup.link"] = colors.Blue,
        ["@markup.link.url"] = {fg = c.cyan, fmt = 'underline'},
        ["@markup.list"] = colors.Red,
        ["@markup.math"] = colors.Fg,
        ["@markup.raw"] = colors.Green,
        ["@markup.strike"] = {fg = c.fg, fmt = 'strikethrough'},
        ["@markup.strong"] = {fg = c.fg, fmt = 'bold'},
        ["@markup.underline"] = {fg = c.fg, fmt = 'underline'},
        ["@module"] = colors.Yellow,
        ["@none"] = colors.Fg,
        ["@number"] = colors.Orange,
        ["@number.float"] = colors.Orange,
        ["@operator"] = colors.Fg,
        ["@parameter.reference"] = colors.Fg,
        ["@property"] = colors.Cyan,
        ["@punctuation.delimiter"] = colors.LightGrey,
        ["@punctuation.bracket"] = colors.LightGrey,
        ["@string"] = {fg = c.green, fmt = cfg.code_style.strings},
        ["@string.regexp"] = {fg = c.orange, fmt = cfg.code_style.strings},
        ["@string.escape"] = {fg = c.red, fmt = cfg.code_style.strings},
        ["@string.special.symbol"] = colors.Cyan,
        ["@tag"] = colors.Purple,
        ["@tag.attribute"] = colors.Yellow,
        ["@tag.delimiter"] = colors.Purple,
        ["@text"] = colors.Fg,
        ["@note"] = colors.Fg,
        ["@warning"] = colors.Fg,
        ["@danger"] = colors.Fg,
        ["@type"] = colors.Yellow,
        ["@type.builtin"] = colors.Orange,
        ["@variable"] = {fg = c.fg, fmt = cfg.code_style.variables},
        ["@variable.builtin"] = {fg = c.red, fmt = cfg.code_style.variables},
        ["@variable.member"] = colors.Cyan,
        ["@variable.parameter"] = colors.Red,
        ["@markup.heading.1.markdown"] = {fg = c.red, fmt = "bold"},
        ["@markup.heading.2.markdown"] = {fg = c.purple, fmt = "bold"},
        ["@markup.heading.3.markdown"] = {fg = c.orange, fmt = "bold"},
        ["@markup.heading.4.markdown"] = {fg = c.red, fmt = "bold"},
        ["@markup.heading.5.markdown"] = {fg = c.purple, fmt = "bold"},
        ["@markup.heading.6.markdown"] = {fg = c.orange, fmt = "bold"},
        ["@markup.heading.1.marker.markdown"] = {fg = c.red, fmt = "bold"},
        ["@markup.heading.2.marker.markdown"] = {fg = c.purple, fmt = "bold"},
        ["@markup.heading.3.marker.markdown"] = {fg = c.orange, fmt = "bold"},
        ["@markup.heading.4.marker.markdown"] = {fg = c.red, fmt = "bold"},
        ["@markup.heading.5.marker.markdown"] = {fg = c.purple, fmt = "bold"},
        ["@markup.heading.6.marker.markdown"] = {fg = c.orange, fmt = "bold"},
        -- Old configuration for nvim-treesiter@0.9.1 and below
        ["@conditional"] = {fg = c.purple, fmt = cfg.code_style.keywords},
        ["@exception"] = colors.Purple,
        ["@field"] = colors.Cyan,
        ["@float"] = colors.Orange,
        ["@include"] = colors.Purple,
        ["@method"] = {fg = c.blue, fmt = cfg.code_style.functions},
        ["@namespace"] = colors.Yellow,
        ["@parameter"] = colors.Red,
        ["@preproc"] = colors.Purple,
        ["@punctuation.special"] = colors.Red,
        ["@repeat"] = {fg = c.purple, fmt = cfg.code_style.keywords},
        ["@string.regex"] = {fg = c.orange, fmt = cfg.code_style.strings},
        ["@text.strong"] = {fg = c.fg, fmt = 'bold'},
        ["@text.emphasis"] = {fg = c.fg, fmt = 'italic'},
        ["@text.underline"] = {fg = c.fg, fmt = 'underline'},
        ["@text.strike"] = {fg = c.fg, fmt = 'strikethrough'},
        ["@text.title"] = {fg = c.orange, fmt = 'bold'},
        ["@text.literal"] = colors.Green,
        ["@text.uri"] = {fg = c.cyan, fmt = 'underline'},
        ["@text.todo"] = {fg = c.red, fmt = cfg.code_style.comments},
        ["@text.todo.unchecked"] = {fg = c.red, fmt = cfg.code_style.comments},
        ["@text.todo.checked"] = {fg = c.green, fmt = cfg.code_style.comments},
        ["@text.math"] = colors.Fg,
        ["@text.reference"] = colors.Blue,
        ["@text.environment"] = colors.Fg,
        ["@text.environment.name"] = colors.Fg,
        ["@text.diff.add"] = colors.Green,
        ["@text.diff.delete"] = colors.Red,
    } end

    if vim.api.nvim_call_function("has", { "nvim-0.9" }) == 1 then
        hl.lsp = {
            ["@lsp.type.comment"] = hl.treesitter[ "@comment"],
  end


----------------------------------------------------------------------------------------------------------------
-- https://github.com/navarasu/onedark.nvim/blob/master/lua/onedark/palette.lua ------------
---------------------------------------------------------------------------------------------------------------
--COLOR CODES USED !!! (note that this is for the `darker` variant)
  
-- `c == darker_colors`

  local darker_colors = {
		black = "#0e1013",
		bg0 = "#1f2329",
		bg1 = "#282c34",
		bg2 = "#30363f",
		bg3 = "#323641",
		bg_d = "#181b20",
		bg_blue = "#61afef",
		bg_yellow = "#e8c88c",
		fg = "#a0a8b7",
		purple = "#bf68d9",
		green = "#8ebd6b",
		orange = "#cc9057",
		blue = "#4fa6ed",
		yellow = "#e2b86b",
		cyan = "#48b0bd",
		red = "#e55561",
		grey = "#535965",
		light_grey = "#7a818e",
		dark_cyan = "#266269",
		dark_red = "#8b3434",
		dark_yellow = "#835d1a",
		dark_purple = "#7e3992",
		diff_add = "#272e23",
		diff_delete = "#2d2223",
		diff_change = "#172a3a",
		diff_text = "#274964",
  }













