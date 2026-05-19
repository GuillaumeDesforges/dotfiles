require("copilot").setup({
	server = {
		type = "binary",
		custom_server_filepath = "copilot-language-server",
	},
	suggestion = {
		auto_trigger = true,
	},
})
