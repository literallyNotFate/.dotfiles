return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
    return {
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        globalstatus = vim.o.laststatus == 3,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          {
            "filetype",
            colored = true,
            color = { fg = "#C8C093" },
            icon_only = true,
            icon = { align = "left" },
            cond = function()
              return vim.bo.filetype ~= "" and vim.fn.expand("%:t") ~= ""
            end,
          },
          {
            "filename",
            file_status = true,
            newfile_status = false,
            path = 0,
            shorting_target = 40,
            color = { fg = "#7FB4CA" },
            symbols = {
              modified = "[+]",
              readonly = "[RO]",
              unnamed = "[No Name]",
              newfile = "[New]",
            },
            cond = function()
              return vim.fn.expand("%:t") ~= ""
            end,
          },
          {
            function()
              return ">"
            end,
            cond = function()
              if vim.fn.expand("%:t") == "" then
                return false
              end

              local ok, navic = pcall(require, "nvim-navic")
              if ok and navic.is_available() then
                local location = navic.get_location()
                if location ~= "" then
                  return true
                end
              end

              local ts_ok, ts_utils = pcall(require, "nvim-treesitter.ts_utils")
              if ts_ok then
                local node = ts_utils.get_node_at_cursor()
                if node then
                  local current_node = node
                  while current_node do
                    local node_type = current_node:type()
                    if
                      node_type == "function_declaration"
                      or node_type == "function_definition"
                      or node_type == "method_definition"
                      or node_type == "function"
                    then
                      return true
                    end
                    current_node = current_node:parent()
                  end
                end
              end

              return false
            end,
          },
          {
            color = { fg = "#FFA066" },
            function()
              local ok, navic = pcall(require, "nvim-navic")
              if ok and navic.is_available() then
                local location = navic.get_location()
                if location ~= "" then
                  return "󰊕 " .. location
                end
              end

              local ts_ok, ts_utils = pcall(require, "nvim-treesitter.ts_utils")
              if ts_ok then
                local node = ts_utils.get_node_at_cursor()
                if node then
                  local current_node = node
                  while current_node do
                    local node_type = current_node:type()
                    if
                      node_type == "function_declaration"
                      or node_type == "function_definition"
                      or node_type == "method_definition"
                      or node_type == "function"
                    then
                      local start_row, start_col = current_node:start()
                      local text = vim.api.nvim_buf_get_lines(0, start_row, start_row + 1, false)[1]
                      if text then
                        local func_name = text:match("function%s+([%w_]+)")
                          or text:match("def%s+([%w_]+)")
                          or text:match("([%w_]+)%s*%(")
                          or text:match("([%w_]+)%s*=>")
                          or "function"
                        return "󰊕 " .. func_name
                      end
                    end
                    current_node = current_node:parent()
                  end
                end
              end

              return ""
            end,
            cond = function()
              if vim.fn.expand("%:t") == "" then
                return false
              end

              local ok, navic = pcall(require, "nvim-navic")
              if ok and navic.is_available() then
                local location = navic.get_location()
                if location ~= "" then
                  return true
                end
              end

              local ts_ok, ts_utils = pcall(require, "nvim-treesitter.ts_utils")
              if ts_ok then
                local node = ts_utils.get_node_at_cursor()
                if node then
                  local current_node = node
                  while current_node do
                    local node_type = current_node:type()
                    if
                      node_type == "function_declaration"
                      or node_type == "function_definition"
                      or node_type == "method_definition"
                      or node_type == "function"
                    then
                      return true
                    end
                    current_node = current_node:parent()
                  end
                end
              end

              return false
            end,
          },
        },
        lualine_c = {},
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            sections = { "error", "warn", "info", "hint" },
            diagnostics_color = {
              error = "DiagnosticError",
              warn = "DiagnosticWarn",
              info = "DiagnosticInfo",
              hint = "DiagnosticHint",
            },
            symbols = {
              error = "󰅚 ",
              warn = "󰀪 ",
              info = "󰋽 ",
              hint = "󰌶 ",
            },
            colored = true,
            update_in_insert = false,
            always_visible = false,
          },
        },
        lualine_y = {
          {
            "location",
            color = { bg = "#2A2A37", fg = "#C8C093" },
            cond = function()
              return vim.fn.expand("%:t") ~= ""
            end,
          },
        },
        lualine_z = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = { "neo-tree", "lazy" },
    }
  end,
}
