local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	return
end

local protocol = require("vim.lsp.protocol")

local on_attach = function(client, bufnr)
	-- format on save
	--[[if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function() vim.lsp.buf.formatting_seq_sync() end
    })
  end]]
end

--[[
        The following are the language servers
        for more info run: LspInfo
]]
-- TypeScript language server
nvim_lsp.tsserver.setup({
	on_attach = on_attach,
	filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact" },
	cmd = { "typescript-language-server", "--stdio" },
	settings = {
		implicitProjectConfiguration = {
			checkJs = true,
		},
	},
})

-- Rust analyzer
require("lspconfig")["rust_analyzer"].setup({})

-- Python language server
require("lspconfig")["pyright"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
})

-- VimScript language server
require("lspconfig")["vimls"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
})

-- YAML language server
require("lspconfig").yamlls.setup({})

-- Ansible language server
require("lspconfig").ansiblels.setup({})

-- TailwindCSS language server
require("lspconfig").tailwindcss.setup({})

-- Misc servers extracted from vscode
-- Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").cssls.setup({ capabilities = capabilities })
require("lspconfig").html.setup({ capabilities = capabilities })
require("lspconfig").jsonls.setup({ capabilities = capabilities })

-- php
require("lspconfig").phpactor.setup({})

-- dart
require("lspconfig").dartls.setup({})
