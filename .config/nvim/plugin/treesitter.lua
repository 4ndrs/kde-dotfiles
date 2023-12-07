require("nvim-treesitter.configs").setup({
	-- A directory to install the parsers into.
	-- If this is excluded or nil parsers are installed
	-- to either the package dir, or the "site" dir.
	-- If a custom path is used (not nil) it must be added to the runtimepath.
	-- parser_install_dir = "$HOME/.local/share/nvim/store/parsers",
	-- vim.opt.runtimepath:append("$HOME/.local/share/nvim/store/parsers")

	-- A list of parser names, or "all"
	ensure_installed = {
		"lua",
		"javascript",
		"comment",
		"css",
		"html",
		"json",
		"python",
		"scss",
		"typescript",
		"rust",
		"tsx",
		"toml",
		"sxhkdrc",
		"sql",
		"yaml",
		"vim",
		"bash",
		"c",
		"cpp",
		"graphql",
		"make",
		"markdown",
		"markdown_inline",
		"regex",
	},

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	auto_install = true,

	highlight = {
		enable = true,
		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,

		-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
		-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
		-- the name of the parser)
		-- list of language that will be disabled
		--disable = { "gitignore" },
	},

	-- Set up nvim-ts-autotag
	autotag = {
		enable = true,
	},

	indent = {
		enable = false,
	},

	yati = {
		enable = true,
	},
})
