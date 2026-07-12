profile.name: tauriReact
profile.archRef: ../pages/example.sl
profile.outputRef: ../../tauri-react

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

# 当前 `.sl` 确实包含多页面导航时，将 router 改为 react-router。
# 仅填写目标项目已有或明确规划的映射。
platformAdapter.types["ExampleType"].component: src/components/ExampleType.tsx