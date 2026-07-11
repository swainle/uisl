meta.name: pageDashboardOverview
meta.title: 数据大屏
meta.type: Page
meta.description: 移动优先的数据概览页，展示关键指标、业务增长趋势、实时预警和底部导航。
meta.source.draftRef: ../draft/dashboard.html
meta.design.tokenRef: ../design/light-token.sl

trace.enabled: true
trace.attribute: data-uisl
trace.pathFormat: componentPath
trace.includeChildren: true
trace.includeActions: true

structure.page.type: MobileDashboardPage
structure.page.slots["header"].children["topAppBarDashboard"].type: TopAppBar
structure.page.slots["main"].children["metricGridDashboard"].type: MetricGrid
structure.page.slots["main"].children["contentGridDashboard"].type: ResponsiveGrid
structure.page.slots["footer"].children["bottomNavDashboard"].type: BottomNav

structure.topAppBarDashboard.children["avatarUser"].type: Avatar
structure.topAppBarDashboard.children["title"].type: Text
structure.topAppBarDashboard.actions["notifications"].type: IconButton

structure.metricGridDashboard.children["metricRevenue"].type: MetricCard
structure.metricGridDashboard.children["metricActiveUsers"].type: MetricCard
structure.metricGridDashboard.children["metricConversionRate"].type: MetricCard
structure.metricGridDashboard.children["metricOrders"].type: MetricCard

structure.contentGridDashboard.children["chartBusinessGrowth"].type: AreaChartCard
structure.contentGridDashboard.children["alertListRealtime"].type: AlertList

structure.chartBusinessGrowth.children["areaChart"].type: AreaChart
structure.chartBusinessGrowth.actions["timeRange"].type: DropdownButton

structure.alertListRealtime.children["alertStock"].type: AlertItem
structure.alertListRealtime.children["alertPayment"].type: AlertItem
structure.alertListRealtime.actions["viewAll"].type: Button

structure.bottomNavDashboard.children["navOverview"].type: NavItem
structure.bottomNavDashboard.children["navAnalytics"].type: NavItem
structure.bottomNavDashboard.children["navReports"].type: NavItem
structure.bottomNavDashboard.children["navSettings"].type: NavItem

content.page.title: 数据大屏
content.page.subtitle: 业务运行概览

content.topAppBarDashboard.children["title"].text: 数据大屏
content.topAppBarDashboard.children["avatarUser"].assetRef: assets/avatar-user.svg
content.topAppBarDashboard.children["avatarUser"].alt: 专业商务头像

content.metricGridDashboard.children["metricRevenue"].label: 今日营收
content.metricGridDashboard.children["metricRevenue"].displayValue: ¥42,850
content.metricGridDashboard.children["metricRevenue"].trendLabel: +12%
content.metricGridDashboard.children["metricRevenue"].trendDirection: Up
content.metricGridDashboard.children["metricActiveUsers"].label: 活跃用户
content.metricGridDashboard.children["metricActiveUsers"].displayValue: 8,240
content.metricGridDashboard.children["metricActiveUsers"].trendLabel: +8%
content.metricGridDashboard.children["metricActiveUsers"].trendDirection: Up
content.metricGridDashboard.children["metricConversionRate"].label: 转化率
content.metricGridDashboard.children["metricConversionRate"].displayValue: 3.42%
content.metricGridDashboard.children["metricConversionRate"].trendLabel: -2%
content.metricGridDashboard.children["metricConversionRate"].trendDirection: Down
content.metricGridDashboard.children["metricOrders"].label: 订单数
content.metricGridDashboard.children["metricOrders"].displayValue: 1,284
content.metricGridDashboard.children["metricOrders"].trendLabel: +5%
content.metricGridDashboard.children["metricOrders"].trendDirection: Up

content.chartBusinessGrowth.title: 业务增长趋势
content.chartBusinessGrowth.subtitle: 最近7天
content.chartBusinessGrowth.actions["timeRange"].label: 最近7天
content.chartBusinessGrowth.children["areaChart"].xAxisLabels: 周一,周二,周三,周四,周五,周六,周日

content.alertListRealtime.title: 实时预警
content.alertListRealtime.actions["viewAll"].label: 查看全部
content.alertListRealtime.children["alertStock"].title: 库存预警: 核心组件
content.alertListRealtime.children["alertStock"].description: SKU-2930 当前库存低于安全水平 (15/100)。
content.alertListRealtime.children["alertStock"].time: 10:24
content.alertListRealtime.children["alertPayment"].title: 支付异常: 华东区域
content.alertListRealtime.children["alertPayment"].description: 过去 15 分钟失败率高于阈值。
content.alertListRealtime.children["alertPayment"].time: 10:02

content.bottomNavDashboard.children["navOverview"].label: Overview
content.bottomNavDashboard.children["navAnalytics"].label: Analytics
content.bottomNavDashboard.children["navReports"].label: Reports
content.bottomNavDashboard.children["navSettings"].label: Settings

token.colors.primary: #1a73e8
token.colors.primaryAlpha12: rgba(26,115,232,0.12)
token.colors.onPrimary: #ffffff
token.colors.surface: #ffffff
token.colors.surfaceBlue: #eef5ff
token.colors.pageBackground: #f4f8fd
token.colors.border: #cbd8ea
token.colors.textPrimary: #18202b
token.colors.textSecondary: #4c5b70
token.colors.success: #07883f
token.colors.danger: #ba1a1a
token.spacing.xs: 4px
token.spacing.sm: 12px
token.spacing.md: 16px
token.spacing.lg: 24px
token.spacing.xl: 32px
token.radius.md: 12px
token.radius.lg: 18px
token.radius.full: 999px
token.shadow.xs: 0 10px 24px rgba(24, 40, 72, 0.08)
token.shadow.sm: 0 18px 42px rgba(24, 40, 72, 0.12)
token.font.size.sm: 14px
token.font.size.md: 16px
token.font.size.xl: 24px
token.font.weight.semibold: 700

style.page.padding: token.spacing.md
style.page.background: token.colors.pageBackground
style.page.minHeight: 100vh
style.page.fontSize: token.font.size.sm

style.topAppBarDashboard.position: StickyTop
style.topAppBarDashboard.height: 64
style.topAppBarDashboard.layout: Horizontal
style.topAppBarDashboard.align: Between

style.metricGridDashboard.layout: Grid
style.metricGridDashboard.gap: token.spacing.md
style.metricGridDashboard.children["metricRevenue"].radius: token.radius.lg
style.metricGridDashboard.children["metricRevenue"].shadow: token.shadow.xs
style.metricGridDashboard.children["metricActiveUsers"].radius: token.radius.lg
style.metricGridDashboard.children["metricActiveUsers"].shadow: token.shadow.xs
style.metricGridDashboard.children["metricConversionRate"].radius: token.radius.lg
style.metricGridDashboard.children["metricConversionRate"].shadow: token.shadow.xs
style.metricGridDashboard.children["metricOrders"].radius: token.radius.lg
style.metricGridDashboard.children["metricOrders"].shadow: token.shadow.xs

style.contentGridDashboard.layout: Grid
style.contentGridDashboard.gap: token.spacing.md
style.chartBusinessGrowth.card: true
style.chartBusinessGrowth.radius: token.radius.lg
style.chartBusinessGrowth.shadow: token.shadow.xs
style.chartBusinessGrowth.children["areaChart"].render: Area
style.chartBusinessGrowth.children["areaChart"].lineColor: token.colors.primary
style.chartBusinessGrowth.children["areaChart"].fillColor: token.colors.primaryAlpha12
style.chartBusinessGrowth.children["areaChart"].showGrid: true
style.chartBusinessGrowth.children["areaChart"].curve: Smooth
style.chartBusinessGrowth.children["areaChart"].height: 226

style.alertListRealtime.card: true
style.alertListRealtime.radius: token.radius.lg
style.alertListRealtime.shadow: token.shadow.xs
style.alertListRealtime.overflow: Hidden
style.alertListRealtime.children["alertStock"].icon: Warning
style.alertListRealtime.children["alertStock"].severity: Error
style.alertListRealtime.children["alertPayment"].icon: Warning
style.alertListRealtime.children["alertPayment"].severity: Warning

style.bottomNavDashboard.position: FixedBottom
style.bottomNavDashboard.height: 80
style.bottomNavDashboard.radius: token.radius.lg
style.bottomNavDashboard.shadow: token.shadow.sm
style.bottomNavDashboard.children["navOverview"].icon: Dashboard
style.bottomNavDashboard.children["navOverview"].active: true
style.bottomNavDashboard.children["navAnalytics"].icon: Analytics
style.bottomNavDashboard.children["navReports"].icon: Reports
style.bottomNavDashboard.children["navSettings"].icon: Settings

motion.metricGridDashboard.children["metricRevenue"].press.scale: 0.98
motion.bottomNavDashboard.children["navOverview"].press.scale: 0.95
motion.chartBusinessGrowth.children["areaChart"].fadeIn.duration: 600ms

data.metricGridDashboard.sources["GetDashboardMetrics"].method: GET
data.metricGridDashboard.sources["GetDashboardMetrics"].path: /api/v1/dashboard/metrics
data.metricGridDashboard.sources["GetDashboardMetrics"].response.revenueToday.to: state.metricGridDashboard.revenueToday
data.metricGridDashboard.sources["GetDashboardMetrics"].response.activeUsers.to: state.metricGridDashboard.activeUsers

data.chartBusinessGrowth.sources["GetBusinessGrowthSeries"].method: GET
data.chartBusinessGrowth.sources["GetBusinessGrowthSeries"].path: /api/v1/dashboard/business-growth
data.chartBusinessGrowth.sources["GetBusinessGrowthSeries"].response.series.to: state.chartBusinessGrowth.series

data.chartBusinessGrowth.series["businessGrowth"].label: 业务增长
data.chartBusinessGrowth.series["businessGrowth"].x: 周一,周二,周三,周四,周五,周六,周日
data.chartBusinessGrowth.series["businessGrowth"].y: 130,110,140,90,40,70,50

state.dashboard.activeNav: overview
state.dashboard.timeRange: recent7Days
state.metricGridDashboard.revenueToday.value: 42850
state.metricGridDashboard.revenueToday.displayValue: ¥42,850
state.metricGridDashboard.activeUsers.value: 8240
state.metricGridDashboard.activeUsers.displayValue: 8,240

behavior.page.onLoad: callApi:metricGridDashboard.GetDashboardMetrics, callApi:chartBusinessGrowth.GetBusinessGrowthSeries
behavior.topAppBarDashboard.actions["notifications"].onClick: toast:通知中心
behavior.chartBusinessGrowth.actions["timeRange"].onClick: toast:切换时间范围
behavior.alertListRealtime.actions["viewAll"].onClick: navigate:/alerts
behavior.bottomNavDashboard.children["navOverview"].onClick: setState:state.dashboard.activeNav=overview, navigate:/dashboard
behavior.bottomNavDashboard.children["navAnalytics"].onClick: setState:state.dashboard.activeNav=analytics, navigate:/analytics
behavior.bottomNavDashboard.children["navReports"].onClick: setState:state.dashboard.activeNav=reports, navigate:/reports
behavior.bottomNavDashboard.children["navSettings"].onClick: setState:state.dashboard.activeNav=settings, navigate:/settings

permission.page.required: dashboard.read
permission.topAppBarDashboard.actions["notifications"].required: notification.read
permission.alertListRealtime.actions["viewAll"].required: alert.read

accessibility.page.lang: zh-CN
accessibility.metricGridDashboard.ariaLabel: 关键指标
accessibility.chartBusinessGrowth.ariaLabel: 业务增长趋势
accessibility.chartBusinessGrowth.children["areaChart"].role: img
accessibility.chartBusinessGrowth.children["areaChart"].ariaLabel: 业务增长趋势折线面积图
accessibility.alertListRealtime.ariaLabel: 实时预警
accessibility.bottomNavDashboard.ariaLabel: 底部导航
accessibility.topAppBarDashboard.actions["notifications"].ariaLabel: 通知
accessibility.topAppBarDashboard.children["avatarUser"].alt: 专业商务头像

responsive.breakpoints["mobile"].maxWidth: 767
responsive.breakpoints["tablet"].minWidth: 768
responsive.breakpoints["tablet"].maxWidth: 1023
responsive.breakpoints["desktop"].minWidth: 1024

responsive.mobile.page.width: 100vw
responsive.mobile.page.minHeight: 100vh
responsive.mobile.page.padding: token.spacing.md
responsive.mobile.metricGridDashboard.layout: Grid
responsive.mobile.metricGridDashboard.columns: 2
responsive.mobile.contentGridDashboard.layout: Vertical
responsive.mobile.contentGridDashboard.columns: 1
responsive.mobile.bottomNavDashboard.display: FixedBottom
responsive.mobile.bottomNavDashboard.height: 80

responsive.tablet.metricGridDashboard.columns: 4
responsive.tablet.contentGridDashboard.layout: Grid
responsive.tablet.contentGridDashboard.columns: 2

responsive.desktop.page.maxWidth: 1440
responsive.desktop.metricGridDashboard.columns: 4
responsive.desktop.contentGridDashboard.layout: Grid
responsive.desktop.contentGridDashboard.columns: 2
responsive.desktop.contentGridDashboard.columnRatio: 1.55fr 0.8fr
responsive.desktop.bottomNavDashboard.display: Hidden
