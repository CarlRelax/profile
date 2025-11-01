return {
  registries = {
    "github:mason-org/mason-registry", -- 默认
    "https://registry.cnpmjs.org/mason-registry/", -- 国内镜像
  },
  pip = {
    upgrade_pip = false,
    install_args = { "--index-url=https://pypi.tuna.tsinghua.edu.cn/simple" },
  },
}
