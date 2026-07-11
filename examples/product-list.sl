meta.name: pageProductList
meta.title: 产品管理
meta.type: Page
meta.description: 产品管理列表页，包含查询、表格、分页、创建、编辑和删除。
meta.design.tokenRef: ../design/light-token.sl

trace.enabled: true
trace.attribute: data-uisl

structure.page.type: AdminCrudPage
structure.page.layoutRef: ../layouts/admin-layout.sl
structure.page.slots["main"].children["toolbarProduct"].type: Toolbar
structure.page.slots["main"].children["filterProduct"].type: FilterForm
structure.page.slots["main"].children["tableProduct"].type: Table
structure.page.slots["main"].children["paginationProduct"].type: PaginationCard
structure.page.slots["main"].children["modalProduct"].type: Modal
structure.page.slots["main"].children["formProduct"].type: Form

structure.toolbarProduct.actions["create"].type: Button
structure.toolbarProduct.actions["export"].type: Button

structure.filterProduct.fields["keyword"].type: Input
structure.filterProduct.fields["status"].type: Select
structure.filterProduct.actions["search"].type: Button
structure.filterProduct.actions["reset"].type: Button

structure.tableProduct.columns["name"].type: TableColumn
structure.tableProduct.columns["status"].type: TableColumn
structure.tableProduct.columns["price"].type: TableColumn
structure.tableProduct.columns["created_at"].type: TableColumn
structure.tableProduct.rowActions["edit"].type: Action
structure.tableProduct.rowActions["delete"].type: Action

structure.formProduct.fields["name"].type: Input
structure.formProduct.fields["price"].type: NumberInput
structure.formProduct.fields["status"].type: Select
structure.formProduct.actions["submit"].type: Button
structure.formProduct.actions["cancel"].type: Button

content.page.title: 产品管理
content.toolbarProduct.actions["create"].label: 新建产品
content.toolbarProduct.actions["export"].label: 导出
content.filterProduct.fields["keyword"].placeholder: 输入产品名称
content.filterProduct.fields["status"].placeholder: 选择状态
content.filterProduct.actions["search"].label: 查询
content.filterProduct.actions["reset"].label: 重置
content.tableProduct.emptyText: 暂无数据
content.tableProduct.loadingText: 加载中
content.tableProduct.errorText: 数据加载失败
content.tableProduct.columns["name"].label: 产品名称
content.tableProduct.columns["status"].label: 状态
content.tableProduct.columns["price"].label: 价格
content.tableProduct.columns["created_at"].label: 创建时间
content.tableProduct.rowActions["edit"].label: 编辑
content.tableProduct.rowActions["delete"].label: 删除
content.modalProduct.title.create: 新建产品
content.modalProduct.title.edit: 编辑产品
content.formProduct.fields["name"].label: 产品名称
content.formProduct.fields["price"].label: 价格
content.formProduct.fields["status"].label: 状态
content.formProduct.actions["submit"].label: 保存
content.formProduct.actions["cancel"].label: 取消

style.page.padding: token.spacing.lg
style.page.background: token.colors.pageBackground
style.toolbarProduct.layout: Horizontal
style.toolbarProduct.align: Right
style.toolbarProduct.height: 48
style.toolbarProduct.gap: token.spacing.sm
style.toolbarProduct.actions["create"].variant: Primary
style.toolbarProduct.actions["create"].icon: Plus
style.filterProduct.layout: Horizontal
style.filterProduct.gap: token.spacing.md
style.filterProduct.wrap: true
style.tableProduct.width: 100%
style.tableProduct.maxHeight: calc(100vh - 240px)
style.tableProduct.overflow: Auto
style.modalProduct.width: 640
style.formProduct.layout: Vertical
style.formProduct.gap: token.spacing.md

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

data.tableProduct.columns["name"].field: name
data.tableProduct.columns["status"].field: status
data.tableProduct.columns["price"].field: price
data.tableProduct.columns["created_at"].field: created_at

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

behavior.page.onLoad: callApi:tableProduct.GetProductList
behavior.toolbarProduct.actions["create"].onClick: openModal:modalProduct:create
behavior.filterProduct.actions["search"].onClick: setState:state.tableProduct.pagination.currentPage=1, callApi:tableProduct.GetProductList
behavior.filterProduct.actions["reset"].onClick: setState:state.filterProduct.keyword="", setState:state.filterProduct.status=null, callApi:tableProduct.GetProductList
behavior.tableProduct.rowActions["edit"].onClick: setState:state.tableProduct.selectedRow=$event.row, openModal:modalProduct:edit
behavior.tableProduct.rowActions["delete"].onClick: setState:state.tableProduct.selectedRow=$event.row, confirmDelete:DeleteProduct
behavior.tableProduct.rowActions["delete"].onConfirm: callApi:tableProduct.DeleteProduct
behavior.tableProduct.sources["DeleteProduct"].onSuccess: callApi:tableProduct.GetProductList, toastSuccess
behavior.tableProduct.sources["DeleteProduct"].onError: toastError
behavior.formProduct.onSubmit.create: callApi:formProduct.CreateProduct
behavior.formProduct.onSubmit.edit: callApi:formProduct.UpdateProduct
behavior.formProduct.sources["CreateProduct"].onSuccess: closeModal:modalProduct, setState:state.tableProduct.pagination.currentPage=1, callApi:tableProduct.GetProductList, toastSuccess
behavior.formProduct.sources["UpdateProduct"].onSuccess: closeModal:modalProduct, callApi:tableProduct.GetProductList, toastSuccess
behavior.formProduct.actions["cancel"].onClick: closeModal:modalProduct

permission.page.required: product.read
permission.toolbarProduct.actions["create"].required: product.create
permission.tableProduct.rowActions["edit"].required: product.update
permission.tableProduct.rowActions["delete"].required: product.delete

validation.formProduct.fields["name"].required: true
validation.formProduct.fields["name"].minLength: 2
validation.formProduct.fields["name"].maxLength: 64
validation.formProduct.fields["name"].message.required: 请输入产品名称
validation.formProduct.fields["price"].type: Number
validation.formProduct.fields["price"].min: 0
validation.formProduct.fields["status"].required: true
validation.formProduct.fields["status"].enum: active,disabled

accessibility.page.lang: zh-CN
accessibility.toolbarProduct.actions["create"].ariaLabel: 新建产品
accessibility.tableProduct.ariaLabel: 产品列表
accessibility.modalProduct.role: dialog

responsive.mobile.filterProduct.layout: Vertical
responsive.mobile.tableProduct.display: CardList
responsive.mobile.modalProduct.width: 100vw
responsive.desktop.filterProduct.layout: Horizontal
responsive.desktop.tableProduct.display: Table
