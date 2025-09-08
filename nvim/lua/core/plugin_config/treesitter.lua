local options = {
  -- A list of parser names, or "all"
  ensure_installed = {"c",
                      "bash",
                      "lua",
                      "markdown",},
                      "rust",
                      "odin",
                      "python",
                      "vim",

  -- Install parsers synchronously (only apllied to 'ensure installed')
  sync_install = false,
  auto_install = true,
  highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
      -- disable = {"java"},
  },
  indent = { enable = true },

}
require('nvim-treesitter.configs').setup(options)
