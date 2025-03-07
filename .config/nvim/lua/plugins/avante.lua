return {
	provider = "openai",
	openai = {
		model = "o3-mini",
	},
	vendors = {
		deepseek = {
			__inherited_from = "openai",
			endpoint = "https://api.deepseek.com",
			model = "deepseek-coder",
			api_key_name = "DEEPSEEK_API_KEY",
		},
	},
}
