return {
	providers = {
		deepseek = {
			__inherited_from = "openai",
			endpoint = "https://api.deepseek.com/v1",
			api_key_name = "DEEPSEEK_API_KEY",
			model = "deepseek-chat",
		},
	},
}
