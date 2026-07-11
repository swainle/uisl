# 命名规则

UISL 命名以可读、稳定、便于追踪为优先。

## 基础规则

```text
页面 name：camelCase
组件实例 key：camelCase
type：PascalCase
后端字段：保持接口字段名
权限码：dot.case
状态 key：camelCase
内容 key：camelCase
data.sources key：PascalCase
actions / rowActions key：小写动词或动词短语
columns / fields key：后端字段名
```

## 页面、布局、组件实例

```text
页面 name：page + Domain + Scene
布局 name：layout + Domain
组件实例 key：type + Domain 或 type + Scene
```

示例：

```text
meta.name: pageDashboardOverview
meta.name: pageProductList
meta.name: layoutAdmin

structure.page.slots["main"].children["toolbarProduct"].type: Toolbar
structure.page.slots["main"].children["tableProduct"].type: Table
structure.page.slots["main"].children["metricGridDashboard"].type: MetricGrid
```

## sources key

`data.*.sources["..."]` 的 key 使用 PascalCase。

```text
data.tableProduct.sources["GetProductList"].method: GET
data.formProduct.sources["CreateProduct"].method: POST
data.formProduct.sources["UpdateProduct"].method: PUT
data.tableProduct.sources["DeleteProduct"].method: DELETE
```

常用 source key：

```text
GetProductList
GetProductDetail
CreateProduct
UpdateProduct
DeleteProduct
BatchDeleteProduct
ImportProduct
ExportProduct
GetDashboardMetrics
GetBusinessGrowthSeries
GetAlertList
```

## actions key

交互动作使用小写动词或动词短语。

```text
structure.toolbarProduct.actions["create"].type: Button
structure.toolbarProduct.actions["export"].type: Button
structure.chartBusinessGrowth.actions["timeRange"].type: DropdownButton
structure.alertListRealtime.actions["viewAll"].type: Button
```

## rowActions key

表格行操作使用小写动词。

```text
structure.tableProduct.rowActions["view"].type: Action
structure.tableProduct.rowActions["edit"].type: Action
structure.tableProduct.rowActions["delete"].type: Action
```

## columns 与 fields key

表格列和表单字段使用后端字段名。

```text
structure.tableProduct.columns["name"].type: TableColumn
structure.tableProduct.columns["status"].type: TableColumn
structure.tableProduct.columns["created_at"].type: TableColumn

structure.formProduct.fields["name"].type: Input
structure.formProduct.fields["price"].type: NumberInput
structure.formProduct.fields["status"].type: Select
```
