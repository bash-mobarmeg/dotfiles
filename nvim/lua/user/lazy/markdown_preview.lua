return {
  "iamcco/markdown-preview.nvim",
  dependencies = {
    "MeanderingProgrammer/render-markdown.nvim"
  },
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },

  build = "cd app; yarn install",

  init = function()
    vim.g.mkdp_filetypes = { "markdown", "md" }
  end,

  config = function()
    vim.keymap.set("n", "<leader>mmn", ":MarkdownPreview<CR>")
    vim.keymap.set("n", "<leader>mms", ":MarkdownPreviewStop<CR>")

    vim.g.mkdp_markdown_css = "/home/user/.local/share/nvim/md.css"
    vim.g.mkdp_highlight_css = "/home/user/.local/share/nvim/mdhl.css"
  end
}
