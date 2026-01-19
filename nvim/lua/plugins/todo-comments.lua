return {
    -- Highlight todo, notes, etc in comments
    -- FIX: FIXME: ISSUE: BUG: FIXIT:
    -- TODO:
    -- NOTE: INFO:
    -- HACK:
    -- WARN: WARNING: XXX:
    -- PERF: OPTIM: PERFORMANCE: OPTIMIZE:
    -- TEST: TESTING: PASSED:
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  }
