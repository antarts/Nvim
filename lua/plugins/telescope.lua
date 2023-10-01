require('telescope').load_extension('media_files')
require('telescope').load_extension('media')

local builtin = require('telescope.builtin')

-- 进入telescope页面会是插入模式，回到正常模式就可以用j和k来移动了

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})  -- 环境里要安装ripgrep
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require 'telescope'.setup {
  extensions = {
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = {"png", "webp", "jpg", "jpeg"},
      find_cmd = "rg", -- find command (defaults to `fd`)
      on_enter = function(filepath)
        vim.fn.setreg("+", filepath)
        vim.notify("Copied to clipboard!")
      end
    },
    media = {
      backend = 'viu',
      backend_option = {
        viu = {
          move = true, -- move to next/prev file
        },
      },
      on_confirm_single = canned.single.cope_path,
      on_confirm_multiple = canned.multiple.bulk_copy,
      cache_path = vim.fn.stdpath("cache") .. "/media",
    }
  }
}

