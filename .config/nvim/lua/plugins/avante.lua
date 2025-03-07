return {
	provider = "openai",
	openai = {
		-- model = "gpt-4o-mini", -- your desired model (or use gpt-4o, etc.)
		model = "o3-mini", -- your desired model (or use gpt-4o, etc.)
	},
	vendors = {
		deepseek = {
			__inherited_from = "openai",
			endpoint = "https://api.deepseek.com",
			model = "deepseek-coder",
			api_key_name = "DEEPSEEK_API_KEY", -- Get API key from environment variable
		},
	},
}
