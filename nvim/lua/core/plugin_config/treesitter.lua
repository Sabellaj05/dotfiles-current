local options = {
  -- A list of parser names, or "all"
  ensure_installed = {"c",
                      "lua",
                      "odin",
                      "rust",
                      "python",
                      "vim",
                      "bash",
                      "markdown",},

  -- Install parsers synchronously (only apllied to 'ensure installed')
  sync_install = false,
  auto_install = true,
  highligh = {
      enable = true,
  },
}
require('nvim-treesitter.configs').setup{options}
