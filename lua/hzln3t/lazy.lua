local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	-- themes
	"eddyekofo94/gruvbox-flat.nvim",
	"joshdick/onedark.vim",
	"axvr/photon.vim",
	"rebelot/kanagawa.nvim",

    -- tmux
    "christoomey/vim-tmux-navigator"
 

})
