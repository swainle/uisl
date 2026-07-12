# UISL AI 执行规则

本仓库维护 UISL 标准、模板和示例。处理 UISL 任务时，必须先判断任务属于以下哪一阶段，并读取对应规范。

## 阶段一：草稿生成 `.sl`

必须读取：

- `docs/17-ai-workflow.md`
- UISL 当前标准文档
- 当前模块下全部 `.sl`
- 当前 `.sl` 引用的 layout、component、design、token、profile 和其他文件
- 当前模块中与目标 UI 相关的现有代码

要求：完整表达草稿和需求中已经明确的 UI 语义，不增加推测性状态、行为、抽象、类型或平台实现细节。平台、语言、框架、组件库和目标环境写入 Profile；Core 保持平台无关。

## 阶段二：`.sl` 生成或更新目标代码

必须读取：

- `docs/17-ai-workflow.md`
- `docs/18-ponytail-code-generation.md`
- 当前 Profile
- 当前模块相关的全部 `.sl` 及其引用
- `profile.outputRef` 指向模块的全部代码和配置
- 仓库根 workspace 配置、npm lockfile，以及目标模块实际引用的共享代码

`docs/18-ponytail-code-generation.md` 是强制规范。必须先理解全部相关 UISL 和现有代码，再执行最小正确实现或最小范围更新。

## 模块边界

默认只读取和修改当前模块：

- Profile 已存在时，以 `profile.outputRef` 指向的目录为目标模块。
- Profile 尚未建立时，以用户指定的实现目录为目标模块。
- 可以读取目标模块实际 import 的共享代码和仓库根配置。
- 不扫描、不修改与当前模块无引用关系的其他业务模块。

## 默认技术栈

用户未指定时采用：

- Web React：Next.js + TypeScript + shadcn + Tailwind。
- Web Vue：Vue + Vite + TypeScript + Ant Design Vue。
- 小程序：Taro + React + TypeScript + NutUI + 微信小程序。
- 桌面端：Tauri + Vite + React + TypeScript + shadcn + Tailwind。
- 桌面端 Vue：Tauri + Vite + Vue + TypeScript + Ant Design Vue。
- 包管理器：npm。

用户明确指定的平台、语言、框架、组件库、样式方案和目标环境优先于默认值。

## 安装与冲突

- Profile 明确指定但当前缺失的项目、框架、组件库或组件，使用官方 CLI 或 npm 命令安装、初始化或添加。
- 不手写仿制框架、组件库或第三方组件源码。
- Profile 未指定的新第三方依赖不得自行安装。
- 安装失败、技术栈冲突或初始化可能覆盖现有文件时，立即停止并报告，不执行破坏性替代方案。

## 不可精简项

不得因追求更少代码而省略：权限、校验、可访问性、破坏性操作确认、API 错误处理、安全边界、数据丢失保护和 trace。