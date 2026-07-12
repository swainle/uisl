profile.name: nextjs
profile.archRef: ../pages/example.sl
profile.outputRef: ../../nextjs

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

# 仅填写目标项目已有或明确规划的映射。
platformAdapter.types["ExampleType"].component: components/ExampleType.tsx