return {
  "esensar/nvim-dev-container",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("devcontainer").setup({
      -- 自动挂载Neovim配置和数据目录（核心配置）
      attach_mounts = {
        always = true,
        neovim_config = {
          enabled = true,
          options = {}, -- 只读挂载，避免容器修改宿主机配置
        },
        neovim_data = { enabled = true, options = {} }, -- 插件和Mason数据可读写
        neovim_state = { enabled = true, options = {} }, -- 状态数据
      },

      -- 容器运行时配置
      container_runtime = "docker", -- 或"podman"
      generate_commands = true, -- 自动生成命令

      -- 自动清理配置
      autocommands = {
        clean = true, -- 退出Neovim时自动停止容器
      },

      always_rebuild = false,
      -- 终端处理（默认在新标签页打开）
      terminal_handler = function(command)
        vim.cmd("tabnew")
        -- vim.fn.termopen(command)
        vim.fn.jobstart(command)
        vim.cmd("startinsert")
      end,
    })
  end,
}
