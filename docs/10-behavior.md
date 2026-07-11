# behavior

`behavior` 描述事件和动作流水线。

## 基础格式

```text
behavior.<component>.<event>: action1, action2, action3
```

示例：

```text
behavior.page.onLoad: callApi:tableProduct.GetProductList
behavior.toolbarProduct.actions["create"].onClick: openModal:modalProduct:create
behavior.alertListRealtime.actions["viewAll"].onClick: navigate:/alerts
```

## 常用动作

```text
setState:<statePath>=<value>
callApi:<componentName>.<SourceKey>
openModal:<modalName>:<mode>
closeModal:<modalName>
reloadTable:<tableName>
toast:<message>
toastSuccess
toastError
navigate:<path>
confirmDelete:<actionName>
emit:<eventName>
```

## 事件变量

```text
$event.page
$event.pageSize
$event.row
$event.value
$event.target
$event.key
```

## 页面加载

```text
behavior.page.onLoad: callApi:tableProduct.GetProductList
```

## Dashboard 交互

```text
behavior.topAppBarDashboard.actions["notifications"].onClick: toast:通知中心
behavior.chartBusinessGrowth.actions["timeRange"].onClick: toast:切换时间范围
behavior.alertListRealtime.actions["viewAll"].onClick: navigate:/alerts
behavior.bottomNavDashboard.children["navAnalytics"].onClick: setState:state.dashboard.activeNav=analytics, navigate:/analytics
```

## 表格编辑

```text
behavior.tableProduct.rowActions["edit"].onClick: setState:state.tableProduct.selectedRow=$event.row, openModal:modalProduct:edit
```

## 删除

```text
behavior.tableProduct.rowActions["delete"].onClick: setState:state.tableProduct.selectedRow=$event.row, confirmDelete:DeleteProduct
behavior.tableProduct.rowActions["delete"].onConfirm: callApi:tableProduct.DeleteProduct
behavior.tableProduct.sources["DeleteProduct"].onSuccess: callApi:tableProduct.GetProductList, toastSuccess
behavior.tableProduct.sources["DeleteProduct"].onError: toastError
```

## 表单提交

```text
behavior.formProduct.onSubmit.create: callApi:formProduct.CreateProduct
behavior.formProduct.sources["CreateProduct"].onSuccess: closeModal:modalProduct, setState:state.tableProduct.pagination.currentPage=1, callApi:tableProduct.GetProductList, toastSuccess
behavior.formProduct.sources["CreateProduct"].onError: toastError

behavior.formProduct.onSubmit.edit: callApi:formProduct.UpdateProduct
behavior.formProduct.sources["UpdateProduct"].onSuccess: closeModal:modalProduct, callApi:tableProduct.GetProductList, toastSuccess
behavior.formProduct.sources["UpdateProduct"].onError: toastError
```

## 结构化 steps

复杂行为可以使用 steps 描述。

```text
behavior.formProduct.onSubmit.steps["validate"].action: validate
behavior.formProduct.onSubmit.steps["submit"].action: callApi
behavior.formProduct.onSubmit.steps["submit"].source: formProduct.CreateProduct
behavior.formProduct.onSubmit.steps["success"].onSuccess: closeModal:modalProduct, toastSuccess
behavior.formProduct.onSubmit.steps["error"].onError: toastError
```
