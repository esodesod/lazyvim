return {
  {
    "yetone/avante.nvim",
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    -- ⚠️ must add this setting! ! !
    build = function()
      -- conditionally use the correct build system for the current OS
      if vim.fn.has("win32") == 1 then
        return "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
      else
        return "make"
      end
    end,
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    ---@module 'avante'
    ---@type avante.Config
    opts = {
      -- mode = 'legacy',
      provider = "openai",
      providers = {
        gemini = {
          -- model = 'gemini-2.5-flash',
        },
        openai = {
          api_key_name = "",
          endpoint = "http://tux.local:1234/v1",
          model = "qwen/qwen3-coder-30b",
          -- model = 'openai/gpt-oss-20b',
          -- endpoint = 'http://localhost:1234/v1',
          -- model = 'openai/gpt-oss-120b',
          -- disable_tools = true,
          -- disabled_tools = { 'replace_in_file', 'str_replace', 'str_replace_editor', 'write_file' },
        },
        ollama = {
          -- lm studio is openai compatible
          -- __inherited_from = 'openai',
          -- api_key_name = '',
          -- endpoint = 'http://192.168.1.98:1234/v1',
          -- model = 'qwen/qwen2.5-coder-32b',
          endpoint = "http://127.0.0.1:11434",
          -- model = 'devstral:24b-small-2505-q8_0',
        },
      },
      behaviour = {
        -- auto_approve_tool_permissions = { 'replace_in_file' }, -- auto-approve replace_in_file tool only
        -- enable_fastapply = true,
        -- auto_suggestions = false, -- only on demand
        auto_focus_sidebar = true, -- jump into pane for review
        -- auto_apply_diff_after_generation = false, -- manual diff approval
        -- cursor_planning_mode = false, -- plan-apply workflow
        -- minimize_diff = true, -- disable full context diffs
      },
      -- mappings = {
      --   --- @class AvanteConflictMappings
      --   diff = {
      --     ours = 'co',
      --     theirs = 'ct',
      --     all_theirs = 'ca',
      --     both = 'cb',
      --     cursor = 'cc',
      --     next = ']x',
      --     prev = '[x',
      --   },
      --   suggestion = {
      --     accept = '<M-l>',
      --     next = '<M-]>',
      --     prev = '<M-[>',
      --     dismiss = '<C-]>',
      --   },
      --   jump = {
      --     next = ']]',
      --     prev = '[[',
      --   },
      --   submit = {
      --     normal = '<CR>',
      --     insert = '<C-s>',
      --   },
      --   cancel = {
      --     normal = { '<C-c>', '<Esc>', 'q' },
      --     insert = { '<C-c>' },
      --   },
      --   sidebar = {
      --     apply_all = 'A',
      --     apply_cursor = 'a',
      --     retry_user_request = 'r',
      --     edit_user_request = 'e',
      --     switch_windows = '<Tab>',
      --     reverse_switch_windows = '<S-Tab>',
      --     remove_file = 'd',
      --     add_file = '@',
      --     close = { '<Esc>', 'q' },
      --     close_from_input = nil, -- e.g., { normal = "<Esc>", insert = "<C-d>" }
      --   },
      -- },
      hints = { enabled = true },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "stevearc/dressing.nvim", -- for input provider dressing
      "folke/snacks.nvim", -- for input provider snacks
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
