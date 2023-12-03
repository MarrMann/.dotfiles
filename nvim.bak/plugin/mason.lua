require("mason").setup()
require("mason-lspconfig").setup()

local servers = {
	lua_ls = {
		Lua = {
			workspace = { checkThirdPart = false },
			telemetry = { enable = false },
		},
	},
	tsserver = {},
	rust_analyzer = { "rust", "rs" },
	html = { filetypes = { "html", "twig", "hbs" } },
	csharp_ls = {},
}

require("neodev").setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
	ensure_installed = vim.tbl_keys(servers),
})

local function on_attach(_, _)
	print("Attached to " .. vim.bo.filetype)
end

mason_lspconfig.setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = servers[server_name],
			filetypes = (servers[server_name] or {}).filetypes,
		})
	end,
})
