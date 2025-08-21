vim.lsp.enable("pyright")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable('eslint')
vim.lsp.enable('golangci_lint_ls')
vim.lsp.enable('nixd')
vim.lsp.enable('ruff')
vim.lsp.enable("gopls")
vim.lsp.enable("lua_ls")
vim.lsp.enable("tsgo")

-- custom configs
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- not in latest luarocks release of nvim-lspconfig
vim.lsp.config('tsgo', {
	capabilities = capabilities,
	cmd = { 'pnpm', 'tsgo', '--lsp', '--stdio' },
	filetypes = {
		'javascript',
		'javascriptreact',
		'javascript.jsx',
		'typescript',
		'typescriptreact',
		'typescript.tsx',
	},
	root_dir = function(bufnr, on_dir)
		-- The project root is where the LSP can be started from
		-- As stated in the documentation above, this LSP supports monorepos and simple projects.
		-- We select then from the project root, which is identified by the presence of a package
		-- manager lock file.
		local project_root_markers = { 'package-lock.json', 'yarn.lock', 'pnpm-lock.yaml', 'bun.lockb', 'bun.lock' }
		-- Give the root markers equal priority by wrapping them in a table
		local project_root = vim.fs.root(bufnr, project_root_markers)
		if not project_root then
			return
		end

		on_dir(project_root)
	end,
})

vim.lsp.config("gopls", {
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

vim.lsp.config('lua_ls', {
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
