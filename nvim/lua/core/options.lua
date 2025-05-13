
-- relative numbers :p 
vim.opt.relativenumber = true
vim.opt.number = true              -- number of line in highlited cursor
-- vim.opt.hybridlinenumber = true      
--
vim.opt.cursorline = true          -- line following cursor

-- left spacing for numberline
vim.o.signcolumn = "yes:2"

-- spaces and tabs
-- vim.opt.tabstop = 4
-- vim.opt.tabstop = 4
vim.opt.shiftwidth = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

-- go for using 2 space indent (it actually uses tabs, that the thing it seems)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.opt_local.expandtab = true      -- use spaces instead of tabs
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
  end,
})
