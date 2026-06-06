require("fate.core.options")
require("fate.core.keymaps")

vim.api.nvim_create_autocmd("ColorScheme", {
	desc = "Notify Iris about theme change",
	callback = function()
		local theme = vim.g.colors_name
		if theme then
			local cache_dir = vim.fn.expand("~/.cache/iris/core/")
			if vim.fn.isdirectory(cache_dir) == 0 then
				vim.fn.mkdir(cache_dir, "p")
			end
			local f = io.open(cache_dir .. "current_theme", "w")
			if f then
				f:write(theme)
				f:close()
			end
		end
	end,
})
