# 默认 Profile

Profile 描述目标实现的技术事实和适配差异，不承载 Ponytail 等 AI 行为规则。AI 工作流见 `17-ai-workflow.md`，强制代码实现规则见 `18-ponytail-code-generation.md`。

用户明确指定的平台、语言、框架、组件库、样式方案、路由、目标环境和输出目录优先于默认值。缺少指定项时，使用本文默认值。

## 通用字段

```text
profile.name: implementationName
profile.archRef: ../pages/example.sl
profile.outputRef: ../../implementationName

profile.target.platform: web
profile.target.framework: frameworkName
profile.target.buildTool: buildToolName
profile.target.language: typescript
profile.target.ui: uiLibraryName
profile.target.css: styleLanguage
profile.target.packageManager: npm
profile.target.componentPolicy: framework-native-first
profile.target.uiPolicy: declared-ui-when-native-missing
profile.target.stylePolicy: framework-recommended
profile.target.traceAttribute: data-uisl
```

字段说明：

- `platform`：`web`、`mini-program`、`desktop` 等运行平台。
- `framework`：主要前端框架或跨端框架。
- `buildTool`：Vite 等构建工具；框架内建构建链时可以省略。
- `language`：默认 `typescript`。
- `ui`：用户指定或默认组件库。
- `css`：样式方案。
- `packageManager`：默认 `npm`。
- `componentPolicy`：组件实现优先级。
- `uiPolicy`：何时使用组件库。
- `stylePolicy`：样式输出策略。
- `traceAttribute`：DOM 目标的 UISL 追踪属性。

Profile 可以增加目标平台需要的字段，例如：

```text
profile.target.viewFramework: react
profile.target.miniProgramPlatform: wechat
profile.target.runtime: tauri
profile.target.backend: rust
profile.target.nativeBridgePolicy: tauri-plugin-before-rust-command
```

## Web React 默认值

```text
profile.target.platform: web
profile.target.framework: nextjs
profile.target.language: typescript
profile.target.ui: shadcn
profile.target.css: tailwind
profile.target.router: app-router
profile.target.packageManager: npm
profile.target.componentPolicy: framework-native-first
profile.target.uiPolicy: shadcn-when-native-missing
profile.target.stylePolicy: tailwind-first
profile.target.iconSet: lucide
profile.target.traceAttribute: data-uisl
```

Next.js 使用框架自带 App Router，不安装第二套路由系统。

模板：`templates/profile-nextjs-shadcn.sl`。

## Web Vue 默认值

```text
profile.target.platform: web
profile.target.framework: vue
profile.target.buildTool: vite
profile.target.language: typescript
profile.target.ui: ant-design-vue
profile.target.css: less
profile.target.router: none
profile.target.packageManager: npm
profile.target.componentPolicy: framework-native-first
profile.target.uiPolicy: ant-design-vue-when-native-missing
profile.target.stylePolicy: less-and-css-vars-first
profile.target.iconSet: ant-design-icons
profile.target.traceAttribute: data-uisl
```

`router: none` 表示默认不安装路由。当前 `.sl` 确实包含多页面导航时，Profile 应改为 `vue-router`；已有路由时直接复用。

模板：`templates/profile-vue-ant-design-vue.sl`。

## Taro 小程序默认值

```text
profile.target.platform: mini-program
profile.target.framework: taro
profile.target.viewFramework: react
profile.target.language: typescript
profile.target.ui: nutui
profile.target.css: scss
profile.target.miniProgramPlatform: wechat
profile.target.packageManager: npm
profile.target.componentPolicy: taro-native-first
profile.target.uiPolicy: nutui-when-taro-native-missing
profile.target.stylePolicy: taro-recommended
profile.target.traceAttribute: data-uisl
```

用户生成 Profile 时可以指定其他 Taro view framework、组件库或小程序平台；未指定时使用 React、NutUI 和微信小程序。

模板：`templates/profile-taro-react-nutui-wechat.sl`。

## Tauri 桌面端默认值

```text
profile.target.platform: desktop
profile.target.runtime: tauri
profile.target.framework: react
profile.target.buildTool: vite
profile.target.language: typescript
profile.target.ui: shadcn
profile.target.css: tailwind
profile.target.router: none
profile.target.backend: rust
profile.target.packageManager: npm
profile.target.componentPolicy: web-native-first
profile.target.uiPolicy: shadcn-when-native-missing
profile.target.stylePolicy: tailwind-first
profile.target.nativeBridgePolicy: tauri-plugin-before-rust-command
profile.target.iconSet: lucide
profile.target.traceAttribute: data-uisl
```

默认不安装 router。当前 `.sl` 确实需要多页面导航时使用 React Router；已有 router 时复用。

普通 UI 状态、表单和数据转换留在 TypeScript 前端。系统窗口、文件系统、通知等桌面能力优先使用已有或 Profile 指定的 Tauri 官方插件，再考虑最小 Rust command。

模板：`templates/profile-tauri-vite-react-shadcn.sl`。

## Tauri Vue 变体

```text
profile.target.platform: desktop
profile.target.runtime: tauri
profile.target.framework: vue
profile.target.buildTool: vite
profile.target.language: typescript
profile.target.ui: ant-design-vue
profile.target.css: less
profile.target.router: none
profile.target.backend: rust
profile.target.packageManager: npm
profile.target.componentPolicy: web-native-first
profile.target.uiPolicy: ant-design-vue-when-native-missing
profile.target.stylePolicy: less-and-css-vars-first
profile.target.nativeBridgePolicy: tauri-plugin-before-rust-command
profile.target.iconSet: ant-design-icons
profile.target.traceAttribute: data-uisl
```

模板：`templates/profile-tauri-vite-vue-ant-design-vue.sl`。

## 用户指定 Next.js + Tauri

Next.js 不是 Tauri 默认值。用户明确指定时，Profile 应声明静态输出约束：

```text
profile.target.platform: desktop
profile.target.runtime: tauri
profile.target.framework: nextjs
profile.target.renderMode: static-export
profile.target.ssr: false
profile.target.serverActions: false
profile.target.apiRoutes: false
```

目标代码依赖 SSR、Server Actions 或内部 API Routes 时视为技术栈冲突，AI 必须停止并报告，不自动改写成其他架构。

## Profile 与安装授权

Profile 中明确出现的框架、组件库、样式库、图标库、图表库和 Tauri 插件，视为该目标实现的安装授权。AI 仍需先检查当前项目是否已安装、是否存在兼容版本和是否实际需要。

Profile 未指定的新第三方依赖不属于授权范围，不得自行安装。