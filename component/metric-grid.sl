meta.name: metricGridExample
meta.title: 指标网格组件示例
meta.type: Component
meta.description: 承载多个 MetricCard，按屏幕宽度调整列数。

structure.metricGrid.type: MetricGrid
structure.metricGrid.children["metricRevenue"].type: MetricCard
structure.metricGrid.children["metricOrders"].type: MetricCard
structure.metricGrid.children["metricConversion"].type: MetricCard
structure.metricGrid.children["metricUsers"].type: MetricCard

content.metricGrid.children["metricRevenue"].label: 今日营收
content.metricGrid.children["metricRevenue"].displayValue: ¥42,850
content.metricGrid.children["metricRevenue"].trendLabel: +12.4%
content.metricGrid.children["metricOrders"].label: 今日订单
content.metricGrid.children["metricOrders"].displayValue: 1,248
content.metricGrid.children["metricOrders"].trendLabel: +8.1%
content.metricGrid.children["metricConversion"].label: 转化率
content.metricGrid.children["metricConversion"].displayValue: 3.42%
content.metricGrid.children["metricConversion"].trendLabel: -1.2%
content.metricGrid.children["metricUsers"].label: 活跃用户
content.metricGrid.children["metricUsers"].displayValue: 28,914
content.metricGrid.children["metricUsers"].trendLabel: +5.6%

style.metricGrid.layout: Grid
style.metricGrid.gap: token.spacing.md
style.metricGrid.width: 100%
style.metricGrid.children["metricRevenue"].radius: token.radius.lg
style.metricGrid.children["metricOrders"].radius: token.radius.lg
style.metricGrid.children["metricConversion"].radius: token.radius.lg
style.metricGrid.children["metricUsers"].radius: token.radius.lg

state.metricGrid.loading: false
state.metricGrid.selectedMetric: null

data.metricGrid.sources["GetDashboardMetrics"].method: GET
data.metricGrid.sources["GetDashboardMetrics"].path: /api/v1/dashboard/metrics
data.metricGrid.sources["GetDashboardMetrics"].response.revenueToday.to: state.metricGrid.revenueToday
data.metricGrid.sources["GetDashboardMetrics"].response.ordersToday.to: state.metricGrid.ordersToday
data.metricGrid.sources["GetDashboardMetrics"].response.conversionRate.to: state.metricGrid.conversionRate
data.metricGrid.sources["GetDashboardMetrics"].response.activeUsers.to: state.metricGrid.activeUsers

behavior.metricGrid.onLoad: callApi:metricGrid.GetDashboardMetrics
behavior.metricGrid.children["metricRevenue"].onClick: setState:state.metricGrid.selectedMetric=revenueToday, emit:metricSelect

accessibility.metricGrid.ariaLabel: 关键指标

responsive.mobile.metricGrid.columns: 2
responsive.mobile.metricGrid.gap: token.spacing.sm
responsive.tablet.metricGrid.columns: 4
responsive.desktop.metricGrid.columns: 4
