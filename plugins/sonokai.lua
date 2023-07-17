return {
  "sainnhe/sonokai",
  -- init = function() -- init function runs before the plugin is loaded
  --   vim.g.sonokai_style = "espresso",
  --   vim.g.sonokai_
  --   vim.g.sonokai_transparent_background = 2
  -- end,
  init = function() 
    vim.g.sonokai_style = "espresso"
    vim.g.sonokai_enable_italic = 1
    vim.g.sonokai_transparent_background = 2
  end,
}
