return {
  'mfussenegger/nvim-dap',
  event = 'VeryLazy',

  dependencies = {
    'rcarriga/nvim-dap-ui',
    'leoluz/nvim-dap-go',
    'nvim-neotest/nvim-nio',
  },

  keys = {
    {
      '<Leader>db',
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = 'Toggle breakpoint',
    },
    {
      '<Leader>ds',
      function()
        require('dap').continue()
      end,
      desc = 'Start Debugging',
    },
    {
      '<Leader>da',
      function()
        require('dapui').eval()
      end,
      desc = 'show values under cursor',
    },
    {
      '<Leader>di',
      function()
        require('dap').step_into()
      end,
      desc = 'step into function',
    },
    {
      '<leader>dn',
      function()
        require('dap').step_over()
      end,
      desc = 'step over to next line',
    },
    {
      '<leader>do',
      function()
        require('dap').step_out()
      end,
      desc = 'step out to calling function',
    },
    {
      '<leader>dq',
      function()
        require('dap').close()
        require('dapui').close()
      end,
      desc = 'step the debugger',
    },
    {
      '<Leader>dc',
      function()
        require('dapui').close()
      end,
      desc = 'Close debugging window',
    },
  },

  config = function(_, opts)
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('dap-go').setup()

    dapui.setup(opts)

    vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DiagnosticSignError', linehl = '', numhl = '' })
    vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = 'DiagnosticSignError', linehl = '', numhl = '' })

    -- Configure the dap event handlers

    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end

    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    require('dap-go').setup {
      dap_configurations = {
        {
          type = 'go',
          name = 'Debug Operator',
          request = 'launch',
          program = './cmd/main.go',
          -- args = require('dap-go').get_arguments,
          --buildFlags = require('dap-go').get_build_flags,
        },
      },
    }
  end,
}
