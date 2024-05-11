local wk = require("which-key")
-- As an example, we will create the following mappings:
--  * <leader>ff find files
--  * <leader>fr show recent files
--  * <leader>fb Foobar
-- we'll document:
--  * <leader>fn new file
--  * <leader>fe edit file
-- and hide <leader>1

wk.register({

  f = {
    { "File" },
    f = { "Find Files" }, -- just a label. don't create any mapping
    g = { "Grep Find" }, -- grep
  },

  t = {
    { "Terminal" },
    v = { "Verticle" },
    h = { "Horizontal" },
  },

  s = {
    { "Split" },
    v = { "Verticle" },
    h = { "Horizontal" },
  },

  h = {{ "Find and Replace" }},
  u = {{ "Copy" }},
  o = {{ "New Line Insert" }},
  O = {{ "New Line Above Insert" }},
  g = {{ "Git" }},


}, { prefix = "<leader>" })
