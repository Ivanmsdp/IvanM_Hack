local lsp = require('lsp-zero')
lsp.preset('recommended',{
-- set_lsp_keymaps = true, -- P habilitar todas las combinaciones de teclas predeterminadas,
manage_nvim_cmp = true,
})

lsp.set_sign_icons({
  error = "✘",
  warn = "▲",
  hint = "⚑",
  info = "»",
})

lsp.ensure_installed({
  "lua_ls",
})
    
lsp.setup() 

-- INFO:   :help  vim.diagnostic    
-- diagnósticos 
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})


-- declarar las "capacidades" que tiene el editor
local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config
-- Aquí utilizamos vim.tbl_deep_extend para mezclar de manera segura las capacidades que ofrece lspconfig
lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
),
----------------------------------------------------------------
-- servidores de idioma
lspconfig.clangd.setup {}  -- C++
lspconfig.zk.setup{} -- markdown  
lspconfig.bashls.setup{} -- bash 
lspconfig.pyright.setup{} -- Python 
-----------------------Solo para servidores LSP-----------creo------------------------------
-- Info:  :help lspconfig-keybindings.
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'Acciones LSP',
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      local opts = {buffer = true}
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- Muestra información sobre símbolo debajo del cursor
    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

    -- Saltar a definición
    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')

    -- Saltar a declaración
    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

    -- Mostrar implementaciones
    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')

    -- Saltar a definición de tipo
    bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

    -- Listar referencias
    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')

    -- Mostrar argumentos de función
    bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

    -- Renombrar símbolo
    bufmap('n', '<F3>', '<cmd>lua vim.lsp.buf.rename()<cr>')

    -- Listar "code actions" disponibles en la posición del cursor
    bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')

    -- Mostrar diagnósticos de la línea actual
    bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')

    -- Saltar al diagnóstico anterior
    bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')

    -- Saltar al siguiente diagnóstico
    bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
  end
})
---------------------------------------------------
--             =====Auto compleado=====
--------------------------------------------------
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
-- Para configurar nvim-cmp necesitamos dos módulos
local cmp = require('cmp')
local luasnip = require('luasnip')
local select_opts = {behavior = cmp.SelectBehavior.Select}
local cmp_action = require('lsp-zero')

cmp.setup({
    mapping = cmp.mapping.preset.insert({
    -- confirm completion
    -- ['<C-y>'] = cmp.mapping.confirm({select = true}),
    -- ['<C-ee>'] = cmp.mapping.close(),
    -- scroll up and down the documentation window
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),   
  }),
   snippet = {
   expand = function(args)
   luasnip.lsp_expand(args.body)
  end
},
-- Controla la apariencia de la ventana donde se muestra la documentación de un item. 
window = {
  documentation = cmp.config.window.bordered()
},
-- icon basado en el nombre de la fuente
formatting = {
  fields = {'menu', 'abbr', 'kind'}, -- Controla  el orden en el que aparecen  los elementos   
  format = function(entry, item)
    local menu_icon = {
      nvim_lsp = 'λ',
      luasnip = '⋗',
      buffer = 'Ω',
      path = '🖫',
      nvim_lua = "Π",
    }

    item.menu = menu_icon[entry.source.name]
    return item
  end,
},})

