meta.name: dataTableExample
meta.title: 数据表格组件示例
meta.type: Component
meta.description: 中后台列表页表格，支持分页、字段绑定、行操作、加载状态和权限控制。

structure.tableProduct.type: Table
structure.tableProduct.columns["name"].type: TableColumn
structure.tableProduct.columns["status"].type: TableColumn
structure.tableProduct.columns["price"].type: TableColumn
structure.tableProduct.columns["created_at"].type: TableColumn
structure.tableProduct.rowActions["view"].type: Action
structure.tableProduct.rowActions["edit"].type: Action
structure.tableProduct.rowActions["delete"].type: Action

content.tableProduct.columns["name"].label: 产品名称
content.tableProduct.columns["status"].label: 状态
content.tableProduct.columns["price"].label: 价格
content.tableProduct.columns["created_at"].label: 创建时间
content.tableProduct.rowActions["view"].label: 查看
content.tableProduct.rowActions["edit"].label: 编辑
content.tableProduct.rowActions["delete"].label: 删除
content.tableProduct.emptyText: 暂无产品数据
content.tableProduct.loadingText: 加载中
content.tableProduct.errorText: 数据加载失败

style.tableProduct.width: 100%
style.tableProduct.density: Normal
style.tableProduct.border: token.colors.border
style.tableProduct.shadow: token.shadow.none
style.tableProduct.overflow: Auto
style.tableProduct.columns["name"].width: 240
style.tableProduct.columns["status"].width: 120
style.tableProduct.columns["price"].width: 120
style.tableProduct.columns["created_at"].width: 180
style.tableProduct.rowActions["delete"].variant: Danger

state.tableProduct.rows: []
state.tableProduct.total: 0
state.tableProduct.loading: false
state.tableProduct.error: null
state.tableProduct.selectedRow: null
state.tableProduct.pagination.currentPage: 1
state.tableProduct.pagination.pageSize: 20

data.tableProduct.sources["GetProductList"].method: GET
data.tableProduct.sources["GetProductList"].path: /api/v1/products
data.tableProduct.sources["GetProductList"].query["keyword"].from: state.filterForm.keyword
data.tableProduct.sources["GetProductList"].query["status"].from: state.filterForm.status
data.tableProduct.sources["GetProductList"].query["page"].from: state.tableProduct.pagination.currentPage
data.tableProduct.sources["GetProductList"].query["page_size"].from: state.tableProduct.pagination.pageSize
data.tableProduct.sources["GetProductList"].response.rows.from: data.items
data.tableProduct.sources["GetProductList"].response.rows.to: state.tableProduct.rows
data.tableProduct.sources["GetProductList"].response.total.from: data.total
data.tableProduct.sources["GetProductList"].response.total.to: state.tableProduct.total

data.tableProduct.sources["DeleteProduct"].method: DELETE
data.tableProduct.sources["DeleteProduct"].path: /api/v1/products/{id}
data.tableProduct.sources["DeleteProduct"].pathParams["id"].from: state.tableProduct.selectedRow.id

data.tableProduct.columns["name"].field: name
data.tableProduct.columns["status"].field: status
data.tableProduct.columns["price"].field: price
data.tableProduct.columns["created_at"].field: created_at

data.tableProduct.rowKey: id
data.tableProduct.source: GetProductList

behavior.tableProduct.onLoad: callApi:tableProduct.GetProductList
behavior.tableProduct.rowActions["view"].onClick: setState:state.tableProduct.selectedRow=$event.row, navigate:/products/$event.row.id
behavior.tableProduct.rowActions["edit"].onClick: setState:state.tableProduct.selectedRow=$event.row, openModal:modalProduct:edit
behavior.tableProduct.rowActions["delete"].onClick: setState:state.tableProduct.selectedRow=$event.row, confirmDelete:DeleteProduct
behavior.tableProduct.rowActions["delete"].onConfirm: callApi:tableProduct.DeleteProduct
behavior.tableProduct.sources["DeleteProduct"].onSuccess: callApi:tableProduct.GetProductList, toastSuccess
behavior.tableProduct.sources["DeleteProduct"].onError: toastError

permission.tableProduct.rowActions["view"].required: product.read
permission.tableProduct.rowActions["edit"].required: product.update
permission.tableProduct.rowActions["delete"].required: product.delete

accessibility.tableProduct.ariaLabel: 产品列表

responsive.mobile.tableProduct.display: CardList
responsive.desktop.tableProduct.display: Table
responsive.desktop.tableProduct.maxHeight: calc(100vh - 280px)
responsive.desktop.tableProduct.overflow: Auto
