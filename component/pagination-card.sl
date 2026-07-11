meta.name: paginationCardExample
meta.title: 分页组件示例
meta.type: Component
meta.description: 列表页分页区域，和表格状态联动。

structure.paginationProduct.type: PaginationCard
structure.paginationProduct.actions["pageChange"].type: PaginationAction
structure.paginationProduct.actions["pageSizeChange"].type: PaginationAction

content.paginationProduct.totalLabel: 共 {total} 条
content.paginationProduct.pageSizeLabel: 每页条数

style.paginationProduct.layout: Horizontal
style.paginationProduct.align: Between
style.paginationProduct.height: 56
style.paginationProduct.padding: token.spacing.md
style.paginationProduct.background: token.colors.surface
style.paginationProduct.radius: token.radius.md
style.paginationProduct.shadow: token.shadow.none

state.paginationProduct.currentPage: 1
state.paginationProduct.pageSize: 20
state.paginationProduct.total: 0

data.paginationProduct.currentPage.from: state.tableProduct.pagination.currentPage
data.paginationProduct.pageSize.from: state.tableProduct.pagination.pageSize
data.paginationProduct.total.from: state.tableProduct.total

behavior.paginationProduct.actions["pageChange"].onChange: setState:state.tableProduct.pagination.currentPage=$event.page, callApi:tableProduct.GetProductList
behavior.paginationProduct.actions["pageSizeChange"].onChange: setState:state.tableProduct.pagination.pageSize=$event.pageSize, setState:state.tableProduct.pagination.currentPage=1, callApi:tableProduct.GetProductList

accessibility.paginationProduct.ariaLabel: 产品列表分页

responsive.mobile.paginationProduct.layout: Vertical
responsive.desktop.paginationProduct.layout: Horizontal
