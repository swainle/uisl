# structure

`structure` 描述页面、布局、区域和组件实例。

structure 负责定义组件实例 key。其他层通过该 key 直接引用组件。

## 页面示例

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

## 布局示例

```text
meta.name: layoutAdmin
meta.title: 后台管理布局
meta.type: Layout

structure.layout.type: AdminLayout
structure.layout.regions["sidebar"].type: Sidebar
structure.layout.regions["header"].type: Header
structure.layout.regions["main"].type: Content
```

## children

通用组件树使用 `children`。

```text
structure.metricGridDashboard.children["metricRevenue"].type: MetricCard
structure.metricGridDashboard.children["metricActiveUsers"].type: MetricCard
structure.metricGridDashboard.children["metricConversionRate"].type: MetricCard
structure.metricGridDashboard.children["metricOrders"].type: MetricCard
```

## 专用集合

有明确业务语义时使用专用集合。

```text
structure.tableProduct.columns["name"].type: TableColumn
structure.tableProduct.columns["status"].type: TableColumn
structure.tableProduct.columns["created_at"].type: TableColumn

structure.formProduct.fields["name"].type: Input
structure.formProduct.fields["price"].type: NumberInput
structure.formProduct.fields["status"].type: Select

structure.toolbarProduct.actions["create"].type: Button
structure.tableProduct.rowActions["edit"].type: Action
structure.tableProduct.rowActions["delete"].type: Action
```

## 顺序

顺序使用 `order`。

```text
structure.page.slots["main"].children["toolbarProduct"].order: 10
structure.page.slots["main"].children["filterProduct"].order: 20
structure.page.slots["main"].children["tableProduct"].order: 30
structure.page.slots["main"].children["paginationProduct"].order: 40
```

## 引用示例

structure 定义组件后，其他层直接使用组件 key：

```text
structure.page.slots["main"].children["metricGridDashboard"].type: MetricGrid

style.metricGridDashboard.layout: Grid
responsive.mobile.metricGridDashboard.columns: 2
accessibility.metricGridDashboard.ariaLabel: 关键指标
```
