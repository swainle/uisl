meta.name: areaChartCardExample
meta.title: 面积图卡片组件示例
meta.type: Component
meta.description: 展示业务趋势、时间范围选择和面积图数据。

structure.chartCard.type: AreaChartCard
structure.chartCard.children["header"].type: Header
structure.chartCard.children["areaChart"].type: AreaChart
structure.chartCard.actions["timeRange"].type: DropdownButton

content.chartCard.title: 业务增长趋势
content.chartCard.subtitle: 最近7天
content.chartCard.actions["timeRange"].label: 最近7天
content.chartCard.children["areaChart"].xAxisLabels: 周一,周二,周三,周四,周五,周六,周日

style.chartCard.card: true
style.chartCard.radius: token.radius.lg
style.chartCard.shadow: token.shadow.xs
style.chartCard.background: token.colors.surface
style.chartCard.padding: token.spacing.md
style.chartCard.layout: Vertical
style.chartCard.gap: token.spacing.md
style.chartCard.children["areaChart"].height: 226
style.chartCard.children["areaChart"].render: Area
style.chartCard.children["areaChart"].lineColor: token.colors.primary
style.chartCard.children["areaChart"].fillColor: token.colors.primaryAlpha12
style.chartCard.children["areaChart"].curve: Smooth
style.chartCard.children["areaChart"].showGrid: true

state.chartCard.timeRange: recent7Days
state.chartCard.loading: false
state.chartCard.series["businessGrowth"].points: 130,110,140,90,40,70,50

data.chartCard.sources["GetBusinessGrowthSeries"].method: GET
data.chartCard.sources["GetBusinessGrowthSeries"].path: /api/v1/dashboard/business-growth
data.chartCard.sources["GetBusinessGrowthSeries"].query["time_range"].from: state.chartCard.timeRange
data.chartCard.sources["GetBusinessGrowthSeries"].response.series.to: state.chartCard.series
data.chartCard.series["businessGrowth"].label: 业务增长
data.chartCard.series["businessGrowth"].x: 周一,周二,周三,周四,周五,周六,周日
data.chartCard.series["businessGrowth"].y: 130,110,140,90,40,70,50

behavior.chartCard.onLoad: callApi:chartCard.GetBusinessGrowthSeries
behavior.chartCard.actions["timeRange"].onChange: setState:state.chartCard.timeRange=$event.value, callApi:chartCard.GetBusinessGrowthSeries

accessibility.chartCard.ariaLabel: 业务增长趋势
accessibility.chartCard.children["areaChart"].role: img
accessibility.chartCard.children["areaChart"].ariaLabel: 最近7天业务增长趋势面积图

responsive.mobile.chartCard.children["areaChart"].height: 180
responsive.desktop.chartCard.children["areaChart"].height: 226
