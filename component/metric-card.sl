meta.name: metricCardExample
meta.title: 指标卡组件示例
meta.type: Component
meta.description: 展示单个关键指标、趋势、状态和迷你趋势图，可用于 Dashboard、运营看板和统计概览。

structure.metricCard.type: MetricCard
structure.metricCard.children["label"].type: Text
structure.metricCard.children["value"].type: Text
structure.metricCard.children["trend"].type: Text
structure.metricCard.children["sparkline"].type: Sparkline

content.metricCard.label: 今日营收
content.metricCard.displayValue: ¥42,850
content.metricCard.trendLabel: +12.4%
content.metricCard.trendDirection: Up
content.metricCard.description: 较昨日增长

style.metricCard.width: 100%
style.metricCard.minHeight: 128
style.metricCard.padding: token.spacing.md
style.metricCard.radius: token.radius.lg
style.metricCard.shadow: token.shadow.xs
style.metricCard.background: token.colors.surface
style.metricCard.layout: Vertical
style.metricCard.gap: token.spacing.sm
style.metricCard.children["label"].fontSize: token.font.size.sm
style.metricCard.children["label"].color: token.colors.textSecondary
style.metricCard.children["value"].fontSize: token.font.size.xl
style.metricCard.children["value"].fontWeight: token.font.weight.semibold
style.metricCard.children["trend"].color: token.colors.success
style.metricCard.children["sparkline"].render: Line
style.metricCard.children["sparkline"].height: 28
style.metricCard.children["sparkline"].lineColor: token.colors.primary

motion.metricCard.press.scale: 0.98
motion.metricCard.press.duration: 100ms

state.metricCard.value: 42850
state.metricCard.trendPercent: 12.4
state.metricCard.loading: false

data.metricCard.field: revenueToday
data.metricCard.children["sparkline"].y: 25,18,22,31,36,30,42

behavior.metricCard.onClick: emit:metricCardClick

accessibility.metricCard.role: button
accessibility.metricCard.ariaLabel: 今日营收 ¥42,850，较昨日增长 12.4%

responsive.mobile.metricCard.minHeight: 116
responsive.mobile.metricCard.padding: token.spacing.sm
responsive.desktop.metricCard.minHeight: 132
