# data 与 state

`data` 描述数据源、字段绑定、请求参数、响应映射和图表 series。`state` 描述运行时状态。

## sources key

`data.*.sources["..."]` 的 key 使用 PascalCase。

```text
data.tableProduct.sources["GetProductList"].method: GET
data.tableProduct.sources["GetProductList"].path: /api/v1/products
```

## 查询列表

```text
data.tableProduct.sources["GetProductList"].method: GET
data.tableProduct.sources["GetProductList"].path: /api/v1/products

data.tableProduct.source: GetProductList
data.tableProduct.rowKey: id

data.tableProduct.sources["GetProductList"].query["keyword"].from: state.filterProduct.keyword
data.tableProduct.sources["GetProductList"].query["status"].from: state.filterProduct.status
data.tableProduct.sources["GetProductList"].query["page"].from: state.tableProduct.pagination.currentPage
data.tableProduct.sources["GetProductList"].query["page_size"].from: state.tableProduct.pagination.pageSize

data.tableProduct.sources["GetProductList"].response.rows.from: data.items
data.tableProduct.sources["GetProductList"].response.rows.to: state.tableProduct.rows
data.tableProduct.sources["GetProductList"].response.total.from: data.total
data.tableProduct.sources["GetProductList"].response.total.to: state.tableProduct.total
```

## 字段绑定

```text
data.tableProduct.columns["name"].field: name
data.tableProduct.columns["status"].field: status
data.tableProduct.columns["created_at"].field: created_at
```

## 创建、更新、删除

```text
data.formProduct.sources["CreateProduct"].method: POST
data.formProduct.sources["CreateProduct"].path: /api/v1/products
data.formProduct.sources["CreateProduct"].body.from: state.formProduct.values

data.formProduct.sources["UpdateProduct"].method: PUT
data.formProduct.sources["UpdateProduct"].path: /api/v1/products/{id}
data.formProduct.sources["UpdateProduct"].pathParams["id"].from: state.tableProduct.selectedRow.id
data.formProduct.sources["UpdateProduct"].body.from: state.formProduct.values

data.tableProduct.sources["DeleteProduct"].method: DELETE
data.tableProduct.sources["DeleteProduct"].path: /api/v1/products/{id}
data.tableProduct.sources["DeleteProduct"].pathParams["id"].from: state.tableProduct.selectedRow.id
```

## Dashboard 数据

```text
data.metricGridDashboard.sources["GetDashboardMetrics"].method: GET
data.metricGridDashboard.sources["GetDashboardMetrics"].path: /api/v1/dashboard/metrics
data.metricGridDashboard.sources["GetDashboardMetrics"].response.revenueToday.to: state.metricGridDashboard.revenueToday
data.metricGridDashboard.sources["GetDashboardMetrics"].response.activeUsers.to: state.metricGridDashboard.activeUsers

data.metricGridDashboard.children["metricRevenue"].field: revenueToday
data.metricGridDashboard.children["metricActiveUsers"].field: activeUsers
```

## 图表数据

```text
structure.chartBusinessGrowth.children["areaChart"].type: AreaChart

content.chartBusinessGrowth.children["areaChart"].xAxisLabels: 周一,周二,周三,周四,周五,周六,周日

data.chartBusinessGrowth.series["businessGrowth"].label: 业务增长
data.chartBusinessGrowth.series["businessGrowth"].x: 周一,周二,周三,周四,周五,周六,周日
data.chartBusinessGrowth.series["businessGrowth"].y: 130,110,140,90,40,70,50
```

## state 示例

```text
state.tableProduct.rows: []
state.tableProduct.total: 0
state.tableProduct.selectedRow: null
state.tableProduct.pagination.currentPage: 1
state.tableProduct.pagination.pageSize: 20

state.filterProduct.keyword: ""
state.filterProduct.status: null

state.modalProduct.visible: false
state.modalProduct.mode: create
state.formProduct.values: {}

state.dashboard.activeNav: overview
state.dashboard.timeRange: recent7Days
state.metricGridDashboard.revenueToday.value: 42850
state.metricGridDashboard.revenueToday.displayValue: ¥42,850
state.metricGridDashboard.revenueToday.trendPercent: 12
```

## loading 与 error

```text
data.tableProduct.sources["GetProductList"].loading.to: state.tableProduct.loading
data.tableProduct.sources["GetProductList"].error.to: state.tableProduct.error

state.tableProduct.loading: false
state.tableProduct.error: null
```
