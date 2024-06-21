-- configs/cmp-config.lua

local cmp = require('cmp-snippy')
local snippy = require('nvim-snippy')

cmp.setup({
  snippet = {
    expand = function(args)
      snippy.expand_snippet(args.body)  -- Para usar snippy
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable,  -- Desactiva el mapeo por defecto de <C-y>
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'snippy' },  -- Fuente para snippy
  }, {
    { name = 'buffer' },
  })
})

-- Usa la fuente del buffer para `/` (si habilitaste `native_menu`, esto no funcionará).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Usa las fuentes de cmdline y path para ':' (si habilitaste `native_menu`, esto no funcionará).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

