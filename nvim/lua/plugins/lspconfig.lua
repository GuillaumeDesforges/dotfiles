local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- eslint
vim.lsp.enable('eslint')

-- gopls
require('lspconfig')['gopls'].setup({
	capabilities = capabilities,
	settings = {
		gopls = {
			experimentalPostfixCompletions = true,
			analyses = {
				unusedparams = true,
				shadow = false,
			},
			staticcheck = true,
		},
	},
	init_options = {
		usePlaceholders = true,
	}
})

-- golangci_lint_ls
vim.lsp.enable('golangci_lint_ls')

-- lua_ls
require('lspconfig')['lua_ls'].setup({
	capabilities = capabilities,
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if
					path ~= vim.fn.stdpath('config')
					and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
			then
				return
			end
		end

		-- when we edit Neovim config, add more settings to LuaLS
		client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
			runtime = {
				version = 'LuaJIT',
				-- Tell the language server how to find Lua modules same way as Neovim (see `:h lua-module-load`)
				path = {
					'lua/?.lua',
					'lua/?/init.lua',
				},
			},
			-- Make the server aware of Neovim runtime files
			workspace = {
				checkThirdParty = true,
				library = {
					vim.env.VIMRUNTIME,
					'${3rd}/luv/library',
				}
				-- https://github.com/neovim/nvim-lspconfig/issues/3189
				-- library = {
				--   vim.api.nvim_get_runtime_file('', true),
				-- }
			},
		})
	end,
	settings = {
		Lua = {},
	},
})

-- nixd
vim.lsp.enable('nixd')
