-- [[wiki-link]] support
vim.opt_local.suffixesadd:append('.md')
vim.opt_local.path:append(vim.fn.expand('~/.vimemo'))
vim.opt_local.includeexpr = 'substitute(v:fname, "\\[\\[\\|\\]\\]", "", "g")'

-- gf: open or create [[link]] as ~/.vimemo/link.md
vim.keymap.set('n', 'gf', function()
    local word = vim.fn.expand('<cfile>')
    local name = word:gsub('%[%[', ''):gsub('%]%]', '')
    if name == '' then return end
    local path = vim.fn.expand('~/.vimemo/' .. name .. '.md')
    vim.cmd('edit ' .. vim.fn.fnameescape(path))
end, { buffer = true })
