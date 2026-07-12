profile.name: taroWechat
profile.archRef: ../pages/example.sl
profile.outputRef: ../../taro-wechat

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

# 仅填写目标项目已有或明确规划的映射。
platformAdapter.types["ExampleType"].component: src/components/ExampleType/index.tsx