return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- show all hidden items
        show_hidden_count = true,
        hide_dotfiles = false, -- show all .files
        hide_gitignored = false, -- do not hide the gitignored files
        hide_by_name = {
          ".git",
          ".DS_Store",
          -- 'thumbs.db',
        },
        never_show = {},
      },
    },
  },
}
