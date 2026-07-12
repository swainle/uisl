# 更新日志

标准正文只描述当前规则，历史调整独立记录在本文件中。

## v0.6.0

### AI 工作流

- 新增草稿生成 `.sl`、`.sl` 生成目标代码和 `.sl diff` 更新代码的两阶段 AI 工作流。
- 明确模块边界：以 `profile.outputRef` 指向目录为目标代码模块，只读取同模块代码、根配置和实际引用的共享代码。
- 要求 AI 在实现前读取当前 Profile、全部相关 `.sl` 及其引用，以及目标模块全部代码和配置。
- 要求每个实现模块安装 `AGENTS.md`，确保强制规范能够被 AI 稳定加载。

### Ponytail 强制实现规范

- 新增 `docs/18-ponytail-code-generation.md`。
- 生成和更新目标代码时，强制执行“复用已有实现、平台原生能力优先、Profile 声明依赖优先、最小正确改动”。
- 禁止推测性抽象、无意义 wrapper、未请求的通用运行时和未来脚手架。
- 组件边界由全部相关页面、语义内聚、已有项目模式、独立行为和平台替换需求综合决定，不使用固定复用次数阈值。
- 权限、校验、可访问性、破坏性操作确认、API 错误处理、安全边界、数据丢失保护和 trace 不得因精简代码而省略。

### 默认平台 Profile

- Web React：Next.js + TypeScript + shadcn + Tailwind。
- Web Vue：Vue + Vite + TypeScript + Ant Design Vue。
- 小程序：Taro + React + TypeScript + NutUI + 微信小程序。
- 桌面端：Tauri + Vite + React + TypeScript + shadcn + Tailwind。
- 桌面端 Vue：Tauri + Vite + Vue + TypeScript + Ant Design Vue。
- 默认包管理器改为 npm。

### 安装与验证

- Profile 明确指定但缺失的项目、框架、组件库或组件，通过官方 CLI 或 npm 命令安装或初始化，不手写仿制实现。
- Profile 未指定的新依赖不得自动安装。
- 安装失败、技术栈冲突或初始化可能覆盖现有文件时停止并报告。
- 简单 UI 运行项目现有 lint、typecheck、build；非平凡逻辑使用已有测试体系增加最小测试，不为单次任务引入测试框架。

## v0.5.0

- 建立 UISL 标准文档、模板、组件示例和页面示例的初始版本。
