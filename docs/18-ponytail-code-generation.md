# Ponytail 代码生成规范

本规范适用于根据 UISL `.sl` 生成或更新目标平台代码，是 UISL v0.6.0 的强制实现规范。

Ponytail 的目标不是代码高尔夫，而是：在完整理解当前模块后，生成最少、正确、可维护、可追踪的实现。少写代码不能以遗漏语义、安全、校验、错误处理或可访问性为代价。

## 一、开始前必须完成的阅读

生成任何代码、文件、组件、hook、store、adapter 或依赖前，必须读取：

1. 当前 Profile。
2. 当前模块相关的全部 `.sl`。
3. 被引用的 layout、component、design、token、profile 和其他文件。
4. `profile.outputRef` 指向模块的全部代码和配置。
5. 仓库根 workspace 配置、`package-lock.json` 和目标模块实际引用的共享代码。
6. 现有公共组件、API 封装、类型、状态、样式、工具函数和测试模式。
7. 现有 trace manifest、`data-uisl`、UISL 注释或 debug key。

不得只读取单个页面 `.sl` 后重新搭建一套孤立实现。

## 二、实现阶梯

对每个 UISL 节点、行为或目标文件，依次判断，并停在第一个足够完成任务的层级：

1. **是否需要生成代码？** 已有默认行为、纯静态描述或目标平台天然覆盖时，不增加额外逻辑。
2. **当前模块是否已有实现？** 复用已有组件、函数、类型、API、状态、样式和页面模式。
3. **`platformAdapter` 是否已有映射？** 使用指定实现，不重新生成同类组件。
4. **框架或平台是否原生支持？** 优先 HTML、React、Vue、Taro、浏览器或 Tauri 的原生能力。
5. **Profile 声明且已安装的依赖是否支持？** 使用现有 UI、图标、图表和样式库。
6. **是否可以在当前文件用一个小函数、handler 或模板片段完成？** 可以则不增加额外层级。
7. **最后才生成最小的新组件、新文件、新 Rust command 或安装 Profile 已授权依赖。**

两个方案都能完成时，选择文件更少、依赖更少、调用路径更直接、边界条件正确的方案。

## 三、强制禁止的过度实现

除非 UISL、Profile、现有项目模式或用户明确要求，否则不得生成：

- 只有一个实现的 interface、factory 或 adapter。
- 只包装一个第三方组件且不增加业务语义的 wrapper。
- 为单次简单请求自动拆分 repository、service、controller、hook 多层结构。
- 为简单 behavior 创建 action engine、event bus、middleware 或状态机。
- 为未来可能扩展创建空目录、barrel file、registry、plugin system 或配置层。
- Profile 未指定的新依赖。
- 与现有模块重复的组件、工具函数、类型或 API 客户端。
- 为了追求“统一架构”而重写未受影响代码。

## 四、组件边界

组件抽取由语义和当前模块决定，不使用“至少复用两次”之类固定阈值。

### 一次使用也可以抽取

- 组件具有稳定业务语义，例如产品表单、指标卡片或权限操作区。
- 封装非平凡行为、权限、校验、可访问性或数据状态。
- Profile、`platformAdapter` 或多个目标实现需要替换该边界。
- 当前生成批次中的其他页面可以共享。
- 目标模块已有明确一致的组件组织方式。
- 独立文件能显著降低页面理解成本，且不会产生无意义转发层。
- 需要独立测试或维护。

### 应优先内联

- 只有简单容器和样式。
- 仅转发 props 给一个第三方组件。
- 抽取理由只是“以后可能复用”。
- 抽取后需要额外 type、hook、index 或配置文件才能成立。

## 五、Behavior 实现

UISL behavior 默认直接映射为目标框架中的最小事件处理逻辑。

```text
简单动作          → 当前组件 handler
当前文件重复动作  → 当前文件局部 helper
跨页面真实复用    → 已有或最小 shared helper
结构化 steps      → 只有 `.sl` 使用 steps 时才考虑 runner
```

不得为 `setState`、`navigate`、`toast`、`callApi`、`openModal` 等简单动作自动建立通用运行时。

破坏性操作必须保留确认、权限和错误处理。

## 六、依赖和安装

### 默认包管理器

使用 npm。

### 允许安装

仅当 Profile 已明确指定且当前任务实际需要时，使用官方 CLI 或 npm 命令：

- 初始化缺失的目标项目或框架。
- 安装指定组件库、样式库、图标库或图表库。
- 通过组件库官方 CLI 添加实际使用的组件。
- 安装 Profile 指定并由 `.sl` 行为需要的 Tauri 官方插件。

安装前必须检查现有 `package.json`、`package-lock.json`、版本约束和项目命令。

### 不允许安装

- Profile 未指定的第三方依赖。
- 已有平台能力或现有依赖可以完成的替代库。
- 仅为减少几行本地代码而引入的新包。

### 失败策略

安装失败、技术栈冲突、版本不兼容或初始化可能覆盖现有文件时，停止并报告。不得手写仿制组件、静默换库、删除目录、重置项目或执行破坏性命令。

## 七、平台规则

### 1. Next.js + TypeScript + shadcn + Tailwind

优先顺序：

```text
现有项目实现
→ HTML / React 原生语义
→ Next.js 原生能力
→ 已安装的 shadcn 组件
→ 当前文件局部实现
→ 最小新组件
```

要求：

- 没有交互、浏览器 API 或客户端状态时，不无条件增加客户端组件边界。
- 不为每个 shadcn 组件再创建无业务语义的 wrapper。
- Tailwind 能表达时不新增 CSS Module。
- 复用现有 token、class utility、API 层和类型。
- App Router 使用框架已有路由能力，不增加第二套路由系统。

### 2. Vue + Vite + TypeScript + Ant Design Vue

优先顺序：

```text
现有 Vue 实现
→ Vue / HTML 原生能力
→ Ant Design Vue
→ 当前 SFC 局部逻辑
→ 最小新组件或 composable
```

要求：

- 简单页面逻辑保留在 SFC 中，不自动拆 composable。
- 不为每个 Ant Design Vue 组件创建 wrapper。
- 只有跨页面真实共享状态才增加全局 store。
- 多页面导航确实存在时才安装或使用 Vue Router；已有 router 时复用。

### 3. Taro + React + TypeScript + NutUI + 微信小程序

优先顺序：

```text
现有跨端实现
→ Taro 基础组件和 API
→ 微信小程序原生能力
→ NutUI
→ 必要的平台 override
→ 最小自定义实现
```

要求：

- 不假设浏览器 DOM API 可用。
- 不为未声明的平台提前生成条件编译分支。
- 平台差异写入 Profile override，不污染 UISL Core。
- 优先复用已有跨端导航、列表、表单、请求和状态模式。
- NutUI 缺失时通过官方 npm/CLI 安装，不手写仿制组件。

### 4. Tauri + Vite + React + TypeScript + shadcn + Tailwind

优先顺序：

```text
前端本地逻辑
→ WebView / 浏览器能力
→ 已安装的 Tauri 官方插件
→ 已有 Rust command
→ 最小新 Rust command
→ 用户明确要求后才使用 sidecar 或自定义插件
```

要求：

- 普通 UI 状态、表单、数据转换和展示逻辑保留在 TypeScript 前端。
- 文件选择、文件系统、系统通知等能力优先使用 Profile 指定或现有 Tauri 官方插件。
- 不为每个 Rust command 自动建立 controller/service/repository 多层结构。
- 单窗口单页面不安装 router；`.sl` 存在多页面导航且项目没有 router 时，才安装 React Router。
- Rust command 的输入校验、capability 和安全边界不得省略。

### 5. Tauri + Vite + Vue + TypeScript + Ant Design Vue

遵循 Tauri 原生能力优先规则，同时沿用 Vue 平台的 SFC、组件和状态边界。多页面导航实际需要时才安装 Vue Router。

### 6. 用户指定 Next.js + Tauri

仅在用户明确指定时使用。目标必须可静态输出，不依赖 SSR、Server Actions 或内部 API Routes；原生桌面能力仍遵循 Tauri 插件优先规则。技术约束冲突时停止并报告。

## 八、不可精简项

以下内容必须按 `.sl` 和现有项目约定实现：

- `permission.*`
- `validation.*`
- `accessibility.*`
- API loading、empty、error 和失败处理
- 破坏性操作确认
- 数据丢失保护
- 安全边界和输入校验
- Tauri capability 和 Rust command 校验
- trace attribute、注释、debug key 或 manifest
- 用户明确要求的行为

## 九、Trace 与最小更新

首次生成时保留 Profile 指定的 trace 方式。后续更新必须优先根据 `.sl diff` 和 trace 定位目标代码。

- DOM 目标使用 `data-uisl` 或 Profile 指定属性。
- 非 DOM 目标使用注释或稳定 debug key。
- 可生成 trace manifest 将 UISL 路径映射到文件、符号和 DOM/debug 定位。
- 不重写未受影响页面，不覆盖人工修改。
- 共享根因在公共组件或函数中修复一次。

## 十、验证

### 简单静态 UI

不新增测试文件，运行目标模块已有的 lint、typecheck 和 build 命令。

### 非平凡逻辑

项目已有测试体系时，增加一个最小相关测试。项目没有测试体系时，不为单个任务引入测试框架，至少运行构建和类型检查，并使用现有可执行检查验证关键路径。

### 必须使用已有测试体系

权限、金额、安全、关键数据转换和复杂状态逻辑。

验证失败时修复根因；不得删除测试、关闭类型检查或降低规则绕过失败。

## 十一、完成标准

任务完成时应满足：

- UISL 已知语义全部落地。
- 没有重复实现当前模块已有能力。
- 没有 Profile 未授权的新依赖。
- 文件和抽象数量有明确当前需求依据。
- 不可精简项完整保留。
- trace 可用于后续最小更新。
- 当前模块已有验证通过，或阻塞原因已明确报告。