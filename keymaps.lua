-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)

local M = {}

function M.mappings(maps)
  local utils = require "astronvim.utils"
  local is_available = utils.is_available

  -- Buffer
  maps.n["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" }
  maps.n["<leader>bD"] = {
    function()
      require("astronvim.utils.status").heirline.buffer_picker(
        function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
      )
    end,
    desc = "Pick to close",
  }
  maps.n["<TAB>"] =
    { function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end, desc = "Next buffer" }
  maps.n["<S-TAB>"] = {
    function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
    desc = "Previous buffer",
  }
  maps.n["<leader>bo"] =
    { function() require("astronvim.utils.buffer").close_all(true) end, desc = "Close all buffers except current" }
  maps.n["<leader>ba"] = { function() require("astronvim.utils.buffer").close_all() end, desc = "Close all buffers" }
  maps.n["<leader>bc"] = { function() require("astronvim.utils.buffer").close() end, desc = "Close buffer" }
  maps.n["<leader>bC"] =
    { function() require("astronvim.utils.buffer").close(0, true) end, desc = "Force close buffer" }
  maps.n["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" }
  maps.n["<leader>bD"] = {
    function()
      require("astronvim.utils.status").heirline.buffer_picker(
        function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
      )
    end,
    desc = "Pick to close",
  }

  -- Window jumping
  maps.n["<C-h>"] = { "<C-w>h", desc = "jump to the right window" }
  maps.n["<C-l>"] = { "<C-w>l", desc = "jump to the left window" }
  maps.n["<C-j>"] = { "<C-w>j", desc = "jump to the bottom window" }
  maps.n["<C-k>"] = { "<C-w>k", desc = "jump to the up window" }

  -- Comments, Comment.nvim
  if is_available "Comment.nvim" then
    maps.n["<C-/>"] = {
      function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Comment line",
    }
    maps.v["<C-/>"] =
      { "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", desc = "Toggle comment line" }
  end
  maps.v["<leader>/"] = false
  maps.n["<leader>/"] = false

  -- Flash (easy motion), flash.nvim
  if is_available "flash.nvim" then
    maps.n["<leader>s"] = {
      function() require("flash").jump() end,
      desc = "Flash",
    }
    maps.x["<leader>s"] = {
      function() require("flash").jump() end,
      desc = "Flash",
    }
    maps.o["<leader>s"] = {
      function() require("flash").jump() end,
      desc = "Flash",
    }
    maps.n["<leader><leader>s"] = {
      function() require("flash").treesitter() end,
      desc = "Flash Treesitter",
    }
    maps.x["<leader><leader>s"] = {
      function() require("flash").treesitter() end,
      desc = "Flash Treesitter",
    }
    maps.o["<leader><leader>s"] = {
      function() require("flash").treesitter() end,
      desc = "Flash Treesitter",
    }
  end

  return maps
end

return M
