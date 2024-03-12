vim.g.mapleader = ' '
local keymap = vim.keymap

-- ---------- 插入模式 ---------- --
keymap.set("i", "jk", "<ESC>")

-- ---------- 视觉模式 ---------- --
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ---------- 正常模式 ---------- --
-- 窗口
keymap.set("n", "sv", "<C-w>v") -- 水平
keymap.set("n", "sh", "<C-w>s") -- 垂直
keymap.set("n", "sc", "<C-w>c") -- 关闭当前窗口
keymap.set("n", "so", "<C-w>o") -- 关闭其他窗口

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- ---------- 插件 ---------- --
-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
-- 切换buffer
keymap.set("n", "<S-l>", ":bnext<CR>") 
keymap.set("n", "<S-h>", ":bprevious<CR>") 

-- yazi 文件浏览器
keymap.set("n", "<leader>gy", ":Yazi<CR>")

-- ---------- AI ------------ --
-- Change '<C-g>' here to any keycode you like.
keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true })
keymap.set('i', '<C-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
keymap.set('i', '<C-:>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
keymap.set('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
