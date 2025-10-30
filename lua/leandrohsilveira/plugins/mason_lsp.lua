return {
  "williamboman/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "lua_ls",
      "stylua",
      "cssls",
      "eslint",
      "emmet_ls",
      "jsonls",
      "vtsls",
    },
  },
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "mfussenegger/nvim-dap",
    "mfussenegger/nvim-lint",
    "nvim-neotest/nvim-nio",
    "rcarriga/nvim-dap-ui",
  },
}
