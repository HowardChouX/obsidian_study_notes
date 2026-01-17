## 🚀 lazy.nvim 加载时机概览

lazy.nvim 的核心优势在于其智能的懒加载机制，可以让插件在真正需要时才加载，从而显著提升 Neovim 启动速度[1]。

## 📋 主要加载触发方式

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

## ⚡ 特殊加载时机

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

## 🎯 最佳实践建议

### 1. **合理选择触发方式**[1]
- **常用插件**: 使用 `event = "VeryLazy"`
- **特定文件类型插件**: 使用 `ft` 属性
- **命令型插件**: 使用 `cmd` 属性
- **编辑模式相关插件**: 使用 `event = "InsertEnter"`
- **快捷键触发的插件**: 使用 `keys` 属性

### 2. **优先级设置**[1][4]
对于需要优先加载的插件，设置 `priority` 属性：

```lua
{
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,  -- 数值越大优先级越高
}
```

### 3. **条件加载**[4]
根据环境条件决定是否加载：

```lua
{
  "some-plugin",
  cond = function()
    -- 只在非 VSCode 环境下加载
    return not vim.g.vscode
  end,
}
```

### 4. **依赖管理**[1]
使用 `dependencies` 确保依赖插件先加载：

```lua
{
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {  -- 依赖插件会先加载
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
  },
}
```

## 🔧 高级技巧

### 自定义加载时机
对于复杂的场景，可以创建自定义事件[2]：

```lua
-- 在 VeryLazy 后创建自定义加载时机
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    if vim.bo.filetype == "dashboard" then
      -- 如果是 dashboard，下次打开文件时加载
      vim.api.nvim_create_autocmd("BufRead", {
        once = true,
        callback = function()
          vim.api.nvim_exec_autocmds("User", { pattern = "MyLoad" })
        end,
      })
    else
      -- 直接加载
      vim.api.nvim_exec_autocmds("User", { pattern = "MyLoad" })
    end
  end,
})

-- 插件配置中使用自定义事件
{ "some-plugin", event = "User MyLoad" }
```

## 📊 性能优化效果

通过合理配置懒加载，可以：
- **减少 30-70% 的启动时间**[4]
- **避免不必要的插件加载**
- **提升整体运行性能**

记住，lazy.nvim 的懒加载不是魔法，需要根据实际使用场景合理规划加载时机[2]。通过精心配置，你可以让 Neovim 启动如闪电般快速！⚡