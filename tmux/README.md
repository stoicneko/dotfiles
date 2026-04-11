# Tmux 配置使用教程

基于 [theniceboy/.config](https://github.com/theniceboy/.config/blob/master/.tmux.conf) 的全量移植，适配 QWERTY 键盘布局。

## 安装

```bash
# 1. 在 dotfiles 目录运行 dotbot
cd ~/dotfiles && ./install

# 2. 启动 tmux，安装 TPM 插件
tmux
# 按 prefix + I（大写 i）安装插件（resurrect + continuum）
```

> **Prefix 键是 `Ctrl+s`**，下文用 `<P>` 表示。

## 自定义主题色

启动 tmux 前设置环境变量即可更换主题色：

```bash
# 在 ~/.config/fish/conf.d/ 中添加：
set -gx TMUX_THEME_COLOR "#b294bb"   # 默认淡紫
set -gx TMUX_THEME_COLOR "#fe8019"   # 橙色（原 Gruvbox）
set -gx TMUX_THEME_COLOR "#689d6a"   # 绿色
set -gx TMUX_THEME_COLOR "#83a598"   # 蓝色
```

---

## 快捷键速查

### Session（会话）

| 快捷键 | 功能 |
|--------|------|
| `<P> C-c` | 新建 session |
| `Alt+Shift+S` | 在当前路径新建 session |
| `<P> .` | 重命名 session |
| `<P> W` | 选择树（session/window/pane 总览）|
| `<P> [` / `<P> ]` | 上一个 / 下一个 session |
| `Ctrl+1~9` | 按位置索引切换 session |
| `<P> 1~9` | 将当前窗口移动到第 N 个 session |

### Window（窗口）

| 快捷键 | 功能 |
|--------|------|
| `Alt+o` | 在当前路径新建窗口（插入到当前窗口后面）|
| `Alt+1~9` | 切换到窗口 1~9 |
| `Alt+[` / `Alt+]` | 上一个 / 下一个窗口 |
| `Alt+Shift+{` / `Alt+Shift+}` | 向左 / 向右交换窗口位置 |
| `<P> ,` | 重命名窗口 |
| `Alt+Q` | 关闭当前 pane |
| `Alt+Shift+O` | 将当前 pane 拆分为独立窗口（break-pane）|
| `Alt+Shift+1~9` | 将当前 pane 合并到窗口 1~9 |

### Pane（面板）

| 快捷键 | 功能 |
|--------|------|
| **分割** ||
| `<P> h` | 向左分割 |
| `<P> j` | 向下分割 |
| `<P> k` | 向上分割 |
| `<P> l` | 向右分割 |
| **导航** ||
| `Alt+h/j/k/l` | 选择左/下/上/右 pane（兼容 Vim splits）|
| `Ctrl+h/j/k/l` | 同上（vim-tmux-navigator 兼容）|
| **调整大小** ||
| `Alt+Shift+H/J/K/L` | 缩放左/下/上/右（每次 3 格）|
| `Alt+f` | 缩放当前 pane（zoom 开关）|
| **布局** ||
| `<P> Space` | 切换水平/垂直布局 |
| `<P> >` / `<P> <` | 向下/向上交换 pane |
| `<P> \|` | 交换当前与上一个 pane |

### Copy Mode（复制模式）

| 快捷键 | 功能 |
|--------|------|
| `Alt+v` | 进入 copy mode |
| `v` | 开始选择 |
| `Ctrl+v` | 切换矩形选择 |
| `h/j/k/l` | 方向移动 |
| `Shift+J` / `Shift+K` | 快速下/上 5 行 |
| `H` / `L` | 跳到行首 / 行尾 |
| `e` | 下一个词尾 |
| `Ctrl+u` / `Ctrl+d` | 向上/向下滚动 5 行 |
| `y` | 复制选区到系统剪贴板 |
| `Y` | 复制到行尾 |
| `/` / `?` | 向下/向上搜索 |

### 剪贴板

| 快捷键 | 功能 |
|--------|------|
| `Ctrl+Shift+V` | 从系统剪贴板粘贴 |
| `Alt+Shift+V` | 从系统剪贴板粘贴（备用） |
| `y`（copy mode） | 复制到系统剪贴板 |

### 其他

| 快捷键 | 功能 |
|--------|------|
| `<P> r` | 重载配置 |
| `<P> C-g` | 同步输入开关（所有 pane 同时输入）|
| `Alt+b` | 标记/取消当前窗口为"未读" |
| `Alt+w` | 标记/取消当前窗口为"监视中" |
| `<P> S` | 选择树 → 垂直合并 pane |
| `<P> V` | 选择树 → 水平合并 pane |
| `<P> b` | 列出剪贴板缓冲区 |
| `<P> p` | 粘贴缓冲区 |

---

## 状态栏说明

```
┌─────────────────────────────────────────────────────────────┐
│ ^ main     1:fish  2:nvim  3:claude *      Thu Apr 10 14:30 │
│ ↑prefix    ↑当前   ↑窗口    ↑未读标记(*)      ↑时间日期      │
└─────────────────────────────────────────────────────────────┘
```

- `^` — 前缀键已按下时显示
- `*` — 窗口有未读标记（Alt+b 切换）
- `!` — 窗口正在监视中（Alt+w 切换）
- `Z` — 当前 pane 处于 zoom 状态

## Pane 边框

每个 pane 顶部显示标题栏：
- 活跃 pane：主题色背景，显示 pane 标题和编号
- 非活跃 pane：灰色背景

可通过 `tmux select-pane -T "标题"` 给 pane 设置自定义标题。

---

## 插件管理（TPM）

| 操作 | 命令 |
|------|------|
| 安装插件 | `<P> I`（大写 i）|
| 更新插件 | `<P> U` |
| 清理未使用插件 | `<P> Alt+u` |

### tmux-resurrect（会话恢复）

| 操作 | 命令 |
|------|------|
| 保存当前会话 | `<P> Ctrl+s` |
| 恢复上次保存的会话 | `<P> Ctrl+r` |

resurrect 会自动恢复以下进程：`lazygit`、`yazi`。

### tmux-continuum（自动保存）

每 5 分钟自动保存会话状态。状态栏右侧显示上次保存时间。

---

## 典型工作流

### 多项目并行开发

```bash
# 创建项目 session
tmux new -s project-a
tmux new -s project-b

# Ctrl+1/2/3 快速切换 session
# 每个 session 内 Alt+1~9 切换窗口
```

### 多 Claude Code 并行

```bash
# 在一个 session 内开多个窗口
Alt+o          # 新建窗口
claude         # 启动 Claude Code

# Alt+1~9 在不同 Claude Code 实例间跳转
# Alt+b 标记需要注意的窗口
# Alt+w 标记正在等待完成的窗口
```

### Pane 布局调整

```bash
# 先分割
<P> l          # 右侧分割
<P> j          # 下方分割

# 调整大小
Alt+Shift+H    # 左 pane 缩小
Alt+Shift+L    # 右 pane 放大

# 不满意？一键切换布局
<P> Space

# 临时全屏某个 pane
Alt+f
```

---

## 文件结构

```
~/.tmux.conf → dotfiles/tmux/tmux.conf     # 入口
~/.tmux/     → dotfiles/tmux/.tmux/        # 配置目录
  ├── conf.d/
  │   ├── 00-environment.tmux   # 终端、Shell、基础行为
  │   ├── 10-plugins.tmux       # TPM + resurrect + continuum
  │   ├── 20-hooks.tmux         # 生命周期 hooks
  │   ├── 30-keys.tmux          # 全部快捷键
  │   ├── 40-copy-mode.tmux     # vi copy-mode
  │   └── 50-theme.tmux         # 主题 + 状态栏
  ├── scripts/                  # 辅助脚本
  └── plugins/
      └── tpm/                  # TPM 插件管理器（git submodule）
```

如需本地覆盖（不提交到 dotfiles），创建 `~/.tmux.conf.local`。
