return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      workspaces = {
        {
          name = "work",
          path = "~C:\\Users\\joshu\\CC\\the-nodes-must-grow",
        }
      },

      -- see below for full list of options 👇
    },
  }, {
    "quentingruber/pomodoro.nvim",
    lazy = false, -- needed so the pomodoro can start at launch
    opts = {
      start_at_launch = true,
      work_duration = 25,
      break_duration = 5,
      delay_duration = 1, -- The additionnal work time you get when you delay a break
      long_break_duration = 15,
      breaks_before_long = 4,
    },
  },
  
   {
      "Kurama622/profile.nvim",
      config = function()
        local comp = require("profile.components")
        require("profile").setup({
          avatar_opts = {
            force_blank = false,
          },
          user = "Kurama622",
          git_contributions = {
            start_week = 1,
            end_week = 53,
            empty_char = " ",
            full_char = { "", "󰧞", "", "", "" },
            fake_contributions = nil,
          },
          hide = {
            statusline = true,
            tabline = true,
          },
          disable_keys = { "h", "j", "k", "<Left>", "<Right>", "<Up>", "<Down>", "<C-f>" },
          cursor_pos = { 17, 48 },
          format = function()
            local header = {
              [[                                                                       ]],
              [[                                                                       ]],
              [[                                                                       ]],
              [[                                                                       ]],
              [[                                                                       ]],
              [[                                                                       ]],
              [[                                                                     ]],
              [[       ████ ██████           █████      ██                     ]],
              [[      ███████████             █████                             ]],
              [[      █████████ ███████████████████ ███   ███████████   ]],
              [[     █████████  ███    █████████████ █████ ██████████████   ]],
              [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
              [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
              [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
              [[                                                                       ]],
            }
            for _, line in ipairs(header) do
              comp:text_component_render({ comp:text_component(line, "center", "ProfileBlue") })
            end

            comp:text_component_render({
              comp:text_component("git@github.com:Kurama622/profile.nvim", "center", "ProfileRed"),
              comp:text_component("──── By Kurama622", "right", "ProfileBlue"),
            })
            comp:separator_render()
            comp:card_component_render({
              type = "table",
              content = function()
                return {
                  {
                    title = "kurama622/llm.nvim",
                    description = [[LLM Neovim Plugin: Effortless Natural
Language Generation with LLM's API]],
                  },
                  {
                    title = "kurama622/profile.nvim",
                    description = [[A Neovim plugin: Your Personal Homepage]],
                  },
                }
              end,
              hl = {
                border = "ProfileYellow",
                text = "ProfileYellow",
              },
            })
            comp:separator_render()
            comp:git_contributions_render("ProfileGreen")
          end,
        })
        vim.api.nvim_set_keymap("n", "<leader>p", "<cmd>Profile<cr>", { silent = true })

        local user_mappings = {
          n = {
            ["r"] = "<cmd>FzfLua oldfiles<cr>",
            ["f"] = "<cmd>FzfLua files<cr>",
            ["c"] = "<cmd>FzfLua files cwd=$HOME/.config/nvim<cr>",
            ["/"] = "<cmd>FzfLua live_grep<cr>",
            ["n"] = "<cmd>enew<cr>",
            ["l"] = "<cmd>Lazy<cr>",
          },
        }
        vim.api.nvim_create_autocmd("FileType", {
          pattern = "profile",
          callback = function()
            for mode, mapping in pairs(user_mappings) do
              for key, cmd in pairs(mapping) do
                vim.api.nvim_buf_set_keymap(0, mode, key, cmd, { noremap = true, silent = true })
              end
            end
          end,
        })
      end,
    },
  {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && yarn install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
},

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
