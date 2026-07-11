meta.name: modalFormExample
meta.title: 弹窗表单组件示例
meta.type: Component
meta.description: 用于创建和编辑数据的弹窗表单，包含字段、校验、提交和关闭行为。

structure.modalProduct.type: Modal
structure.modalProduct.children["formProduct"].type: Form
structure.formProduct.fields["name"].type: Input
structure.formProduct.fields["price"].type: NumberInput
structure.formProduct.fields["status"].type: Select
structure.formProduct.actions["submit"].type: Button
structure.formProduct.actions["cancel"].type: Button

content.modalProduct.title.create: 新建产品
content.modalProduct.title.edit: 编辑产品
content.formProduct.fields["name"].label: 产品名称
content.formProduct.fields["name"].placeholder: 请输入产品名称
content.formProduct.fields["price"].label: 价格
content.formProduct.fields["status"].label: 状态
content.formProduct.actions["submit"].label: 保存
content.formProduct.actions["cancel"].label: 取消

style.modalProduct.width: 560
style.modalProduct.radius: token.radius.lg
style.modalProduct.shadow: token.shadow.sm
style.modalProduct.padding: token.spacing.lg
style.formProduct.layout: Vertical
style.formProduct.gap: token.spacing.md
style.formProduct.actions.layout: Horizontal
style.formProduct.actions.align: Right
style.formProduct.actions["submit"].variant: Primary

state.modalProduct.visible: false
state.modalProduct.mode: create
state.formProduct.values: {}
state.formProduct.submitting: false

data.formProduct.sources["CreateProduct"].method: POST
data.formProduct.sources["CreateProduct"].path: /api/v1/products
data.formProduct.sources["CreateProduct"].body.from: state.formProduct.values

data.formProduct.sources["UpdateProduct"].method: PUT
data.formProduct.sources["UpdateProduct"].path: /api/v1/products/{id}
data.formProduct.sources["UpdateProduct"].pathParams["id"].from: state.tableProduct.selectedRow.id
data.formProduct.sources["UpdateProduct"].body.from: state.formProduct.values

data.formProduct.fields["name"].field: name
data.formProduct.fields["price"].field: price
data.formProduct.fields["status"].field: status

validation.formProduct.fields["name"].required: true
validation.formProduct.fields["name"].minLength: 2
validation.formProduct.fields["name"].maxLength: 64
validation.formProduct.fields["name"].message.required: 请输入产品名称
validation.formProduct.fields["price"].type: Number
validation.formProduct.fields["price"].min: 0
validation.formProduct.fields["status"].required: true
validation.formProduct.fields["status"].enum: active,disabled

behavior.formProduct.actions["cancel"].onClick: closeModal:modalProduct
behavior.formProduct.onSubmit.create: callApi:formProduct.CreateProduct
behavior.formProduct.onSubmit.edit: callApi:formProduct.UpdateProduct
behavior.formProduct.sources["CreateProduct"].onSuccess: closeModal:modalProduct, setState:state.tableProduct.pagination.currentPage=1, callApi:tableProduct.GetProductList, toastSuccess
behavior.formProduct.sources["CreateProduct"].onError: toastError
behavior.formProduct.sources["UpdateProduct"].onSuccess: closeModal:modalProduct, callApi:tableProduct.GetProductList, toastSuccess
behavior.formProduct.sources["UpdateProduct"].onError: toastError

permission.formProduct.sources["CreateProduct"].required: product.create
permission.formProduct.sources["UpdateProduct"].required: product.update

accessibility.modalProduct.role: dialog
accessibility.modalProduct.ariaLabel: 产品表单
accessibility.formProduct.fields["name"].ariaLabel: 产品名称

responsive.mobile.modalProduct.width: 100vw
responsive.mobile.modalProduct.height: 100vh
responsive.mobile.modalProduct.radius: token.radius.sm
responsive.desktop.modalProduct.width: 560
responsive.desktop.modalProduct.height: Auto
