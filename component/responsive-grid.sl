meta.name: responsiveGridExample
meta.title: 响应式内容网格组件示例
meta.type: Component
meta.description: 用于承载图表、列表、卡片等模块，并根据屏幕宽度切换布局。

structure.contentGrid.type: ResponsiveGrid
structure.contentGrid.children["chartBusinessGrowth"].type: AreaChartCard
structure.contentGrid.children["alertListRealtime"].type: AlertList
structure.contentGrid.children["taskListTodo"].type: ListCard

style.contentGrid.layout: Grid
style.contentGrid.width: 100%
style.contentGrid.gap: token.spacing.md
style.contentGrid.children["chartBusinessGrowth"].order: 10
style.contentGrid.children["alertListRealtime"].order: 20
style.contentGrid.children["taskListTodo"].order: 30

state.contentGrid.collapsed: false

accessibility.contentGrid.ariaLabel: 页面内容区块

responsive.mobile.contentGrid.layout: Vertical
responsive.mobile.contentGrid.columns: 1
responsive.tablet.contentGrid.layout: Grid
responsive.tablet.contentGrid.columns: 2
responsive.desktop.contentGrid.layout: Grid
responsive.desktop.contentGrid.columns: 2
responsive.desktop.contentGrid.columnRatio: 1.55fr 0.8fr
responsive.wide.contentGrid.maxWidth: 1440
