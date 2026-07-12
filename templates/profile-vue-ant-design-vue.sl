profile.name: vue
profile.archRef: ../pages/example.sl
profile.outputRef: ../../vue

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

# 当前 `.sl` 确实包含多页面导航时，将 router 改为 vue-router。
# 仅填写目标项目已有或明确规划的映射。
platformAdapter.types["ExampleType"].component: src/components/ExampleType.vue