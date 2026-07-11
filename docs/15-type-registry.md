# typeRegistry

`typeRegistry` 用于声明内置 type 或自定义 type 的用途、基础结构、支持子组件和生成提示。

## 自定义 type

```text
typeRegistry.types["MetricCard"].category: Display
typeRegistry.types["MetricCard"].description: 展示单个关键指标、趋势和迷你图。
typeRegistry.types["MetricCard"].slots["main"].required: true
typeRegistry.types["MetricCard"].supports.children: Sparkline,Text,Icon
typeRegistry.types["MetricCard"].default.radius: token.radius.lg
typeRegistry.types["MetricCard"].default.shadow: token.shadow.xs
```

## type 扩展

```text
typeRegistry.types["AreaChartCard"].extends: ChartCard
typeRegistry.types["AreaChartCard"].supports.children: AreaChart
```

## props schema

```text
typeRegistry.types["MetricCard"].props["label"].required: true
typeRegistry.types["MetricCard"].props["displayValue"].type: string
typeRegistry.types["MetricCard"].props["trendDirection"].enum: Up,Down,Flat
```

## 推荐 type 集合

```text
Page
Layout
MobileDashboardPage
DashboardPage
TopAppBar
BottomNav
NavItem
MetricGrid
MetricCard
ResponsiveGrid
ChartCard
AreaChartCard
AreaChart
LineChart
Sparkline
AlertList
AlertItem
IconButton
DropdownButton
Avatar
Text
Toolbar
FilterForm
Table
TableColumn
PaginationCard
Modal
Form
Input
Select
Button
Action
```

## Type 使用示例

### MetricGrid

```text
structure.page.slots["main"].children["metricGridDashboard"].type: MetricGrid
structure.metricGridDashboard.children["metricRevenue"].type: MetricCard
structure.metricGridDashboard.children["metricActiveUsers"].type: MetricCard

style.metricGridDashboard.layout: Grid
style.metricGridDashboard.gap: token.spacing.md
responsive.mobile.metricGridDashboard.columns: 2
responsive.desktop.metricGridDashboard.columns: 4
```

### AreaChartCard

```text
structure.contentGridDashboard.children["chartBusinessGrowth"].type: AreaChartCard
structure.chartBusinessGrowth.children["areaChart"].type: AreaChart
structure.chartBusinessGrowth.actions["timeRange"].type: DropdownButton

content.chartBusinessGrowth.title: 业务增长趋势
content.chartBusinessGrowth.subtitle: 最近7天
content.chartBusinessGrowth.actions["timeRange"].label: 最近7天
style.chartBusinessGrowth.card: true
style.chartBusinessGrowth.radius: token.radius.lg
style.chartBusinessGrowth.shadow: token.shadow.xs
```

### BottomNav

```text
structure.page.slots["footer"].children["bottomNavDashboard"].type: BottomNav
structure.bottomNavDashboard.children["navOverview"].type: NavItem
structure.bottomNavDashboard.children["navAnalytics"].type: NavItem

style.bottomNavDashboard.position: FixedBottom
style.bottomNavDashboard.height: 80
style.bottomNavDashboard.radius: token.radius.lg
style.bottomNavDashboard.shadow: token.shadow.sm
responsive.desktop.bottomNavDashboard.display: Hidden
```
