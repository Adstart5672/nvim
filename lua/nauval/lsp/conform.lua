require("conform").setup({
    formatters_by_ft = {
            lua = { "stylua"  },
                -- Conform will run multiple formatters sequentially
                 python = { "isort", "black"  },
                -- Use a sub-list to run only the first available formatter
                 javascript = { { "prettierd", "prettier"  }  },
                format_after_save = function(bufnr)
                        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                                  return
                                      end
                                          -- ...additional logic...
                                      return { lsp_fallback = true  }
                         end,
    },
    
})
