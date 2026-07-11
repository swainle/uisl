meta.name: emptyStateExample
meta.title: 空状态组件示例
meta.type: Component
meta.description: 列表、搜索结果或页面模块无数据时展示的占位组件。

structure.emptyState.type: EmptyState
structure.emptyState.children["illustration"].type: Image
structure.emptyState.children["title"].type: Text
structure.emptyState.children["description"].type: Text
structure.emptyState.actions["create"].type: Button

content.emptyState.children["illustration"].assetRef: assets/empty-products.svg
content.emptyState.children["illustration"].alt: 暂无数据
content.emptyState.children["title"].text: 暂无产品
content.emptyState.children["description"].text: 当前筛选条件下没有产品数据，可以调整筛选条件或创建新产品。
content.emptyState.actions["create"].label: 新建产品

style.emptyState.layout: Vertical
style.emptyState.align: Center
style.emptyState.justify: Center
style.emptyState.gap: token.spacing.md
style.emptyState.padding: token.spacing.xl
style.emptyState.minHeight: 320
style.emptyState.children["illustration"].width: 160
style.emptyState.children["title"].fontSize: token.font.size.lg
style.emptyState.children["title"].fontWeight: token.font.weight.semibold
style.emptyState.children["description"].fontSize: token.font.size.sm
style.emptyState.children["description"].color: token.colors.textSecondary
style.emptyState.actions["create"].variant: Primary

behavior.emptyState.actions["create"].onClick: openModal:modalProduct:create

accessibility.emptyState.role: status
accessibility.emptyState.ariaLabel: 暂无产品数据
accessibility.emptyState.children["illustration"].alt: 暂无数据

responsive.mobile.emptyState.minHeight: 240
responsive.desktop.emptyState.minHeight: 320
