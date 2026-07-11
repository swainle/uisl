meta.name: filterFormExample
meta.title: 筛选表单组件示例
meta.type: Component
meta.description: 列表页查询条件区域，支持关键字、状态、时间范围和重置。

structure.filterForm.type: FilterForm
structure.filterForm.fields["keyword"].type: Input
structure.filterForm.fields["status"].type: Select
structure.filterForm.fields["createdRange"].type: DateRangePicker
structure.filterForm.actions["search"].type: Button
structure.filterForm.actions["reset"].type: Button

content.filterForm.fields["keyword"].placeholder: 请输入产品名称或编号
content.filterForm.fields["status"].label: 状态
content.filterForm.fields["createdRange"].label: 创建时间
content.filterForm.actions["search"].label: 查询
content.filterForm.actions["reset"].label: 重置

style.filterForm.layout: Horizontal
style.filterForm.gap: token.spacing.sm
style.filterForm.padding: token.spacing.md
style.filterForm.radius: token.radius.md
style.filterForm.background: token.colors.surface
style.filterForm.fields["keyword"].width: 240
style.filterForm.fields["status"].width: 160
style.filterForm.fields["createdRange"].width: 280
style.filterForm.actions["search"].variant: Primary

state.filterForm.keyword: ""
state.filterForm.status: null
state.filterForm.createdRange: null

data.filterForm.fields["keyword"].field: keyword
data.filterForm.fields["status"].field: status
data.filterForm.fields["createdRange"].field: created_range

behavior.filterForm.actions["search"].onClick: setState:state.tableProduct.pagination.currentPage=1, callApi:tableProduct.GetProductList
behavior.filterForm.actions["reset"].onClick: setState:state.filterForm.keyword="", setState:state.filterForm.status=null, setState:state.filterForm.createdRange=null, callApi:tableProduct.GetProductList
behavior.filterForm.fields["keyword"].onEnter: callApi:tableProduct.GetProductList

accessibility.filterForm.role: search
accessibility.filterForm.ariaLabel: 产品筛选条件

responsive.mobile.filterForm.layout: Vertical
responsive.mobile.filterForm.fields["keyword"].width: 100%
responsive.mobile.filterForm.fields["status"].width: 100%
responsive.mobile.filterForm.fields["createdRange"].width: 100%
responsive.desktop.filterForm.layout: Horizontal
