require("llm").setup({
    -- [[ Github Models ]]
    url = "https://models.inference.ai.azure.com/chat/completions",
    model = "gpt-4o",
    api_type = "openai",
    -- max_tokens = 4096,
    max_tokens = 8000,
    -- model = "gpt-4o-mini",
    -- fetch_key = function()
    --   return vim.env.GITHUB_TOKEN
    -- end,
    prefix = {
      user = { text = "> ", hl = "Title" },
      assistant = { text = ">> ", hl = "Added" },
    },
    app_handler = {
        AttachToChat = {
            handler = require("llm.tools").attach_to_chat_handler,
            opts = {
              is_codeblock = true,
              inline_assistant = true,
              display = {
                mapping = {
                  mode = "n",
                  keys = { "d" },
                },
                action = nil,
              },
              -- accept diff
              accept = {
                mapping = {
                  mode = "n",
                  keys = { "Y", "y" },
                },
                action = nil,
              },
              -- reject diff
              reject = {
                mapping = {
                  mode = "n",
                  keys = { "N", "n" },
                },
                action = nil,
              },
              -- close diff
              close = {
                mapping = {
                  mode = "n",
                  keys = { "<esc>" },
                },
                action = nil,
              },
            },
          },
      },
    chat_ui_opts = {
      relative = "editor",
      position = "50%",
      size = {
        width = "95%",
        height = "95%",
      },
      win_options = {
        winblend = 0,
        winhighlight = "Normal:String,FloatBorder:Float",
      },
      input = {
        float = {
          border = {
            text = {
              top = " Enter Your Question ",
              top_align = "center",
            },
          },
          win_options = {
            winblend = 0,
            winhighlight = "Normal:LlmRedLight,FloatBorder:LlmPurpleNormal,FloatTitle:LlmYellowNormal",
          },
          size = { height = "20%", width = "95%" },
          order = 2,
        },
      },
    },
})
