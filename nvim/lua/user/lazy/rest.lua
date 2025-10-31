return {
  "rest-nvim/rest.nvim",
  config = function()
    require("rest-nvim").setup({
      -- Open request results in a horizontal split
      result_split_horizontal = true,
      -- Keep the http file buffer above|left when split horizontal|vertical
      result_split_in_place = true,
      -- Stay in current window (.http file) or change to results window (default)
      stay_in_current_window_after_split = false,
      -- Skip SSL verification, useful for unknown certificates
      skip_ssl_verification = false,
      -- Encode URL before making request
      encode_url = true,
      -- Highlight request on run
      highlight = {
        enabled = true,
        timeout = 150,
      },
      result = {
        -- Toggle showing URL, HTTP info, headers at top of result window
        show_url = true,
        -- Show the generated curl command
        show_curl_command = true,
        show_http_info = true,
        show_headers = true,
        -- Table of curl `--write-out` variables or false if disabled
        show_statistics = true,
        -- Executables or functions for formatting response body
        formatters = {
          json = "jq",
          html = function(body)
            return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
          end,
        },
      },
      -- Jump to request line on run
      jump_to_request = false,
      env_file = ".env",
      custom_dynamic_variables = {},
      yank_dry_run = true,
      search_back = true,
    })
  end,
}

