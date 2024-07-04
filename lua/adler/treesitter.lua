local configs = require("nvim-treesitter.configs")
configs.setup({
	ensure_installed = { "tsx", "json", "bash", "markdown", "javascript", "lua", "css", "php", "typescript" },
	sync_install = false,
	ignore_install = { "" }, -- List of parsers to ignore installing
	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true, disable = { "yaml" } },
	autotag = {
		enable = true,
	},
})
require('ts_context_commentstring').setup {
      enable_autocmd = false,
      
}
