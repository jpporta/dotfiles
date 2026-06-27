return {
  'vimwiki/vimwiki',
  init = function()
    vim.g.vimwiki_path = '~/Documents/Wiki/'
    vim.g.vimwiki_syntax = 'markdown'
    vim.g.vimwiki_ext = 'md'
  end,
}
