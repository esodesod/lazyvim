return {
  -- add gruvbox.nvim
  { "ellisonleao/gruvbox.nvim", opts = {
    transparent_mode = true,
  } },

  -- configure lazyvim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
  {
    -- use auto-dark-mode.nvim which reads AppleInterfaceStyle to check current mode
    -- using control center seems to toggle `defaults read -g AppleInterfaceStyle` correctly
    -- NOTE: bug using Apple Shortcuts to change to dark mode. See https://github.com/f-person/auto-dark-mode.nvim/issues/58.
    "f-person/auto-dark-mode.nvim",
    opts = {
      set_dark_mode = function()
        vim.api.nvim_set_option_value("background", "dark", {})
        -- vim.api.nvim_set_option_value("colorscheme", "tokyonight-night", {})
      end,
      set_light_mode = function()
        vim.api.nvim_set_option_value("background", "dark", {})
        -- vim.api.nvim_set_option_value("background", "light", {})
        -- vim.api.nvim_set_option_value("colorscheme", "gruvbox", {})
      end,
      update_interval = 1000,
      fallback = "dark",
    },
  },
}
