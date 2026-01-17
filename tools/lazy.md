## 主要加载触发方式

### 1. **事件触发 (event)**
最常用的懒加载方式，当指定事件发生时自动加载插件[1]：

```lua
-- 在插入模式进入时加载
{
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  config = function()
    -- 插件配置
  end,
}

-- 在 Neovim 启动完成后加载
{ "stevearc/dressing.nvim", event = "VeryLazy" }
```

**常用事件类型**：
- `VeryLazy`: Neovim 启动完成后触发（最常用）[1][2]
- `BufReadPost`: 缓冲区读取完成后触发
- `InsertEnter`: 进入插入模式时触发
- `BufNewFile`: 创建新文件时触发[1]

### 2. **命令触发 (cmd)**
执行特定命令时才加载插件[1]：

```lua
{
  "dstein64/vim-startuptime",
  cmd = "StartupTime",  -- 执行 StartupTime 命令时加载
  init = function()
    vim.g.startuptime_tries = 10
  end,
}
```

### 3. **文件类型触发 (ft)**
根据编辑的文件类型加载插件[1]：

```lua
{
  "nvim-neorg/neorg",
  ft = "norg",  -- 编辑 .norg 文件时加载
  opts = {
    load = {
      ["core.defaults"] = {},
    },
  },
}
```

### 4. **按键触发 (keys)**
按下特定快捷键时加载插件[1][2]：

```lua
{
  "smoka7/hop.nvim",
  keys = {
    { "<leader>hp", ":HopWord<CR>", desc = "hop word" },
  },
  opts = {
    hint_position = 3,
  },
}
```

##  特殊加载时机

### VeryLazy 事件
这是 lazy.nvim 提供的特殊事件，在所有启动完成、进入 Neovim 后才加载插件[1][2]：

```lua
-- 适用于需要在启动后加载但不影响启动速度的插件
{ "folke/which-key.nvim", event = "VeryLazy" }
```

### 立即加载（禁用懒加载）
某些插件需要立即加载，如主题插件[1][4]：

```lua
{
  "folke/tokyonight.nvim",
  lazy = false,        -- 禁用懒加载
  priority = 1000,     -- 高优先级确保最先加载
  config = function()
    vim.cmd([[colorscheme tokyonight]])
  end,
}
```

