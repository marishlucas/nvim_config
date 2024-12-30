return {
  {
    "mfussenegger/nvim-dap", -- DAP (Debug Adapter Protocol) plugin
    config = function()
      local dap = require("dap")

      -- GDB adapter configuration for debugging Assembly
      dap.adapters.gdb = {
        type = "executable",
        command = "gdb", -- Adjust this to the correct path for gdb if needed
        name = "gdb",
      }

      -- Configuration for debugging Assembly programs
      dap.configurations.asm = {
        {
          name = "Debug Assembly Program",
          type = "gdb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = true,
          args = {}, -- Add any program arguments here if necessary
          runInTerminal = true,
        },
      }
    end,

    -- Add keybindings for DAP using LazyVim's keys = {} format
    keys = {
      {
        "<F5>",
        function()
          require("dap").continue()
        end,
        desc = "Start/Continue Debugging",
      },
      {
        "<F10>",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
      },
      {
        "<F11>",
        function()
          require("dap").step_into()
        end,
        desc = "Step Into",
      },
      {
        "<F12>",
        function()
          require("dap").step_out()
        end,
        desc = "Step Out",
      },
    },
  },

  {
    "rcarriga/nvim-dap-ui", -- UI for nvim-dap
    requires = { "mfussenegger/nvim-dap" },
    config = function()
      local dapui = require("dapui")
      dapui.setup()

      -- Automatically open/close dapui when debugging starts/ends
      local dap = require("dap")
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
}
