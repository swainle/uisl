profile.name: secondary
profile.archRef: ../../arch/pages/dashboard.sl
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
profile.target.tokenOutput: less-variables
profile.target.tokenFile: src/styles/tokens.less
profile.target.pageFile: src/views/dashboard/index.vue
profile.target.componentDir: src/components/dashboard

platformAdapter.types["TopAppBar"].component: src/components/dashboard/TopAppBar.vue
platformAdapter.types["MetricCard"].component: src/components/dashboard/MetricCard.vue
platformAdapter.types["AreaChart"].component: src/components/dashboard/BusinessGrowthChart.vue
platformAdapter.types["AlertList"].component: src/components/dashboard/AlertList.vue
platformAdapter.types["BottomNav"].component: src/components/dashboard/BottomNavigation.vue

profile.override.structure.chartBusinessGrowth.children["areaChart"].type: EChartsAreaChart
profile.override.targetOverride.chartBusinessGrowth.children["areaChart"].library: echarts
