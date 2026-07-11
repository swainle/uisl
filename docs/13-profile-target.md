# profile 与目标实现适配

`arch/*.sl` 描述公共 UI 架构。`arch/profile/*.sl` 描述某个实现目录的框架适配、组件映射、样式策略、资源策略和局部覆盖。

## 目录关系

```text
ui/web/
  primary/                  # 实现目录示例
  secondary/                # 实现目录示例
  arch/
    pages/dashboard.sl      # 公共 UI 架构
    profile/primary.sl      # primary 的适配与局部覆盖
    profile/secondary.sl    # secondary 的适配与局部覆盖
```

`primary`、`secondary` 只是名称示例。实现目录可以按项目需要命名。

## 公共描述

`arch/pages/dashboard.sl` 描述公共结构：

```text
meta.name: pageDashboardOverview
meta.title: 数据大屏
meta.type: Page

structure.page.type: MobileDashboardPage
structure.page.slots["header"].children["topAppBarDashboard"].type: TopAppBar
structure.page.slots["main"].children["metricGridDashboard"].type: MetricGrid
structure.page.slots["main"].children["contentGridDashboard"].type: ResponsiveGrid
structure.page.slots["footer"].children["bottomNavDashboard"].type: BottomNav
```

## profile 描述

`arch/profile/primary.sl` 示例：

```text
profile.name: primary
profile.archRef: ../pages/dashboard.sl
profile.outputRef: ../../primary

profile.target.platform: web
profile.target.framework: nextjs
profile.target.language: typescript
profile.target.ui: shadcn
profile.target.css: tailwind
profile.target.router: app-router
profile.target.componentMode: ClientComponent
profile.target.componentPolicy: framework-native-first
profile.target.uiPolicy: shadcn-when-native-missing
profile.target.stylePolicy: tailwind-first
profile.target.iconSet: lucide
profile.target.chartAdapter: recharts
profile.target.traceAttribute: data-uisl

platformAdapter.types["MetricCard"].component: components/dashboard/MetricCard.tsx
platformAdapter.types["AreaChart"].component: components/dashboard/BusinessGrowthChart.tsx
platformAdapter.types["BottomNav"].component: components/dashboard/BottomNavigation.tsx
```

`arch/profile/secondary.sl` 示例：

```text
profile.name: secondary
profile.archRef: ../pages/dashboard.sl
profile.outputRef: ../../secondary

profile.target.platform: web
profile.target.framework: vue
profile.target.language: typescript
profile.target.ui: ant-design-vue
profile.target.css: less
profile.target.componentPolicy: framework-native-first
profile.target.uiPolicy: ant-design-vue-when-native-missing
profile.target.stylePolicy: less-and-css-vars-first
profile.target.iconSet: ant-design-icons
profile.target.chartAdapter: echarts
profile.target.traceAttribute: data-uisl

platformAdapter.types["MetricCard"].component: src/components/dashboard/MetricCard.vue
platformAdapter.types["AreaChart"].component: src/components/dashboard/BusinessGrowthChart.vue
platformAdapter.types["BottomNav"].component: src/components/dashboard/BottomNavigation.vue
```

## 局部覆盖

profile 可以表达某个实现目录的局部差异。

```text
profile.override.structure.metricGridDashboard.children["metricRevenue"].type: CustomMetricCard
profile.override.style.metricGridDashboard.children["metricRevenue"].radius: token.radius.md
profile.override.responsive.desktop.bottomNavDashboard.display: Hidden
```

局部覆盖用于具体实现目录，公共 UI 架构仍由 `arch/*.sl` 承担。

## 多目标写法

同一份 profile 中也可以声明多个 target。

```text
profile.defaultTarget: webNextjs

profile.targets["webNextjs"].platform: web
profile.targets["webNextjs"].framework: nextjs
profile.targets["webNextjs"].language: typescript
profile.targets["webNextjs"].ui: shadcn
profile.targets["webNextjs"].css: tailwind

profile.targets["webVue"].platform: web
profile.targets["webVue"].framework: vue
profile.targets["webVue"].language: typescript
profile.targets["webVue"].ui: ant-design-vue
profile.targets["webVue"].css: less
```

## 资源策略

```text
profile.target.iconSet: lucide
profile.target.chartAdapter: recharts
profile.target.assetMode: Local
profile.target.externalAssets: Controlled
profile.target.traceAttribute: data-uisl
```

## token 输出

```text
profile.target.tokenOutput: css-variables
profile.target.tokenFile: app/globals.css
```

其他实现目录可以使用不同 token 输出：

```text
profile.target.tokenOutput: less-variables
profile.target.tokenFile: src/styles/tokens.less
```
