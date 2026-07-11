profile.name: primary
profile.archRef: ../../arch/pages/dashboard.sl
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
profile.target.tokenOutput: css-variables
profile.target.tokenFile: app/globals.css
profile.target.pageFile: app/dashboard/page.tsx
profile.target.componentDir: components/dashboard

platformAdapter.types["TopAppBar"].component: components/dashboard/TopAppBar.tsx
platformAdapter.types["MetricCard"].component: components/dashboard/MetricCard.tsx
platformAdapter.types["AreaChart"].component: components/dashboard/BusinessGrowthChart.tsx
platformAdapter.types["AlertList"].component: components/dashboard/AlertList.tsx
platformAdapter.types["BottomNav"].component: components/dashboard/BottomNavigation.tsx

profile.override.responsive.desktop.bottomNavDashboard.display: Hidden
profile.override.targetOverride.chartBusinessGrowth.children["areaChart"].library: recharts
