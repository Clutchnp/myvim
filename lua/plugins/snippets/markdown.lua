local ls = require("luasnip")
ls.snippets = {
  markdown = {
    ls.parser.parse_snippet("mk", "$$"), -- For "mk"
    ls.parser.parse_snippet("bb", "**"), -- For "bb"
    ls.parser.parse_snippet("ii", "*"),  -- For "ii"
    ls.parser.parse_snippet("cb", "```"), -- For "cb"
  },
}

return ls.snippets
