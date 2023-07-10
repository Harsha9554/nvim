local options = {
	clipboard = "unnamedplus",
	cmdheight = 1,
	completeopt = { "menuone", "noselect" },
	conceallevel = 2,
	concealcursor = "nc",
	fileencoding = "utf-8",
	hlsearch = true,
	ignorecase = true,
	pumheight = 10,
	showmode = false,
	showtabline = 4,
	smartcase = true,
	smartindent = true,
	splitbelow = true,
	splitright = true,
	termguicolors = true,
	undofile = true,
	updatetime = 300,
	expandtab = true,
	shiftwidth = 4,
	tabstop = 4,
	cursorline = true,
	number = true,
	relativenumber = true,
	numberwidth = 2,
	signcolumn = "yes",
	scrolloff = 8,
	sidescrolloff = 8,
	guifont = "monospace:h17",
	shell = "zsh",
	wrap = true,
	-- disable additional junk files
	swapfile = false,
	backup = false,
	writebackup = false,
	-- which key options
	timeout = true,
	timeoutlen = 400,
	autoread = true,
	-- folds / ufo
	spelllang = "en_us",
	spell = true,
}

vim.opt.shortmess:append("c")
vim.g.netrw_banner = 0
vim.g.python3_host_prog = "/usr/bin/python3"

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- auto-refresh
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
	command = "if mode() != 'c' | checktime | endif",
	pattern = { "*" },
})

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])

vim.opt.foldlevelstart = -1
vim.opt.foldnestmax = 5
vim.wo.foldcolumn = "1"
vim.wo.foldlevel = 99
vim.wo.foldenable = true

vim.cmd("au BufRead,BufNewFile *.txt  setfiletype text")
vim.cmd("au BufRead,BufNewFile *.json  setfiletype json")
vim.cmd("au BufRead,BufNewFile *.org  setfiletype org")
vim.cmd("au BufEnter,BufNewFile *.json silent! setlocal foldlevel=99")
vim.cmd("au BufEnter,BufNewFile *.org silent! setlocal foldlevel=99")
vim.cmd("au BufEnter,BufNewFile * silent! setlocal foldlevel=99")

