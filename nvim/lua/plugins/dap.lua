return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "jay-babu/mason-nvim-dap.nvim",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
    },
    event = "BufReadPost",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      ------------------------------------------------------------------
      -- DAP UI
      ------------------------------------------------------------------
      dapui.setup({
        layouts = {
          {
            elements = {
              { id = "scopes", size = 0.25 },
              { id = "breakpoints", size = 0.25 },
              { id = "stacks", size = 0.25 },
              { id = "watches", size = 0.25 },
            },
            size = 40,
            position = "left",
          },
          {
            elements = {
              { id = "repl", size = 0.5 },
              { id = "console", size = 0.5 },
            },
            size = 10,
            position = "bottom",
          },
        },
      })

      -- 自动打开 / 关闭 UI
      dap.listeners.after.event_initialized["dapui"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui"] = function()
        dapui.close()
      end

      ------------------------------------------------------------------
      -- 行内变量
      ------------------------------------------------------------------
      require("nvim-dap-virtual-text").setup()

      ------------------------------------------------------------------
      -- Mason DAP（调试器安装）
      ------------------------------------------------------------------
      require("mason-nvim-dap").setup({
        ensure_installed = {
          "debugpy", -- Python
          "codelldb", -- C / C++
        },
        automatic_installation = true,
      })

      ------------------------------------------------------------------
      -- Python (debugpy)
      ------------------------------------------------------------------
      local mason_path = vim.fn.stdpath("data") .. "/mason"
      dap.adapters.python = {
        type = "executable",
        command = mason_path .. "/packages/debugpy/venv/bin/python", -- MacOS
        -- command = mason_path .. "/packages/debugpy/venv/Scripts/python",  -- Windows
        args = { "-m", "debugpy.adapter" },
      }

      dap.configurations.python = {
        {
          name = "Launch file",
          type = "python",
          request = "launch",
          program = "${file}",
          cwd = "${workspaceFolder}",
          pythonPath = mason_path .. "/packages/debugpy/venv/bin/python", -- MacOS
          -- pythonPath = mason_path .. "/packages/debugpy/venv/Scripts/python",  -- Windows
          console = "integratedTerminal",
        },
      }

      ------------------------------------------------------------------
      -- C / C++ (codelldb)
      ------------------------------------------------------------------
      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = "codelldb",
          args = { "--port", "${port}" },
        },
      }

      dap.configurations.cpp = {
        {
          name = "Launch executable",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }

      -- C 复用 C++
      dap.configurations.c = dap.configurations.cpp

      ------------------------------------------------------------------
      -- Keymaps
      ------------------------------------------------------------------
      vim.keymap.set("n", "<F5>", dap.continue, { desc = "DAP Continue" })
      vim.keymap.set("n", "<F10>", dap.step_over, { desc = "DAP Step Over" })
      vim.keymap.set("n", "<F11>", dap.step_into, { desc = "DAP Step Into" })
      vim.keymap.set("n", "<F12>", dap.step_out, { desc = "DAP Step Out" })

      vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "DAP Toggle Breakpoint" })
      vim.keymap.set("n", "<Leader>dB", function()
        dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end, { desc = "DAP Conditional Breakpoint" })

      vim.keymap.set("n", "<Leader>dr", dap.repl.open, { desc = "DAP REPL" })
      vim.keymap.set("n", "<Leader>dl", dap.run_last, { desc = "DAP Run Last" })
    end,
  },
}
