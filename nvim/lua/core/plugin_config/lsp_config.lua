require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'lua_ls',
    'bashls',
    'clangd',
    'gopls',
    'pyright',
    'yamlls',
    'dockerls',
    'rust_analyzer',
    'ols',
    'terraformls',
  }

})


local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item.
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, 
  }, {
    { name = 'buffer' },
  })
})

--
-- Setup LSP servers with capabilities.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(_, _)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
  vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float, {}) -- Shows diagnostic message in a float
end


require("lspconfig").lua_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
    },
  },
}
require("lspconfig").bashls.setup {
  capabilities = capabilities,
  on_attach = on_attach
}
require("lspconfig").clangd.setup {
  capabilities = capabilities,
  on_attach = on_attach
}
require("lspconfig").pyright.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

require("lspconfig").yamlls.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

require("lspconfig").dockerls.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

require("lspconfig").rust_analyzer.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

require("lspconfig").ols.setup {
  capabilities = capabilities,
  on_attach = on_attach
}
require("lspconfig").terraformls.setup {
  capabilities = capabilities,
  on_attach = on_attach
}
require("lspconfig").gopls.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

-- =================================================================
-- ==             JAVA LSP (JDTLS) AUTOCOMMAND                  ==
-- =================================================================
-- This command creates an autocommand that will run our custom
-- jdtls setup function every time you open a file with the .java
-- filetype. 
-- =================================================================
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'java',
    callback = function()
        require('core.plugin_config.jdtls_config').setup()
    end
})

-- =================================================================
-- ==            SHOW DIAGNOSTICS ON CURSOR HOLD                ==
-- =================================================================
-- This command creates an autocommand that shows the diagnostic
-- (error/warning) message in a floating window when you hover your
-- cursor over the line.
-- =================================================================
vim.api.nvim_create_autocmd('CursorHold', {
  pattern = '*',
  callback = function()
    vim.diagnostic.open_float(nil, {
      focusable = false,
      scope = 'line',
    })
  end,
})

-- =================================================================
-- ==        SET KEYMAPS FOR JDTLS WHEN IT ATTACHES             ==
-- =================================================================
-- jdtls doesn't use the standard on_attach function, so we watch for
-- any LSP attaching and if it's jdtls, we set the keymaps here.
-- =================================================================
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client.name == 'jdtls' then
      -- To disable semantic highlighting for Java, uncomment the following line
      client.server_capabilities.semanticTokensProvider = nil

      local bufopts = { noremap=true, silent=true, buffer=ev.buf }
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
      vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, bufopts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
      vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float, bufopts)

      -- Override the LSP's incorrect semantic token for Java modifiers
      vim.api.nvim_set_hl(0, '@lsp.type.modifier.java', { link = '@keyword' })
    end
  end,
})
