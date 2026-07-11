meta.name: detailCardExample
meta.title: 详情卡片组件示例
meta.type: Component
meta.description: 展示实体详情的卡片，适用于详情页、抽屉详情和概览信息区。

structure.detailCard.type: DetailCard
structure.detailCard.fields["name"].type: DescriptionItem
structure.detailCard.fields["status"].type: DescriptionItem
structure.detailCard.fields["owner"].type: DescriptionItem
structure.detailCard.fields["created_at"].type: DescriptionItem
structure.detailCard.actions["edit"].type: Button

content.detailCard.title: 产品详情
content.detailCard.fields["name"].label: 产品名称
content.detailCard.fields["status"].label: 状态
content.detailCard.fields["owner"].label: 负责人
content.detailCard.fields["created_at"].label: 创建时间
content.detailCard.actions["edit"].label: 编辑

style.detailCard.card: true
style.detailCard.radius: token.radius.lg
style.detailCard.shadow: token.shadow.xs
style.detailCard.background: token.colors.surface
style.detailCard.padding: token.spacing.md
style.detailCard.layout: Vertical
style.detailCard.gap: token.spacing.md
style.detailCard.fields.layout: Grid
style.detailCard.fields.columns: 2
style.detailCard.actions.layout: Horizontal
style.detailCard.actions.align: Right
style.detailCard.actions["edit"].variant: Primary

state.detailCard.record: null
state.detailCard.loading: false

data.detailCard.sources["GetProductDetail"].method: GET
data.detailCard.sources["GetProductDetail"].path: /api/v1/products/{id}
data.detailCard.sources["GetProductDetail"].pathParams["id"].from: state.route.params.id
data.detailCard.sources["GetProductDetail"].response.record.to: state.detailCard.record
data.detailCard.fields["name"].field: name
data.detailCard.fields["status"].field: status
data.detailCard.fields["owner"].field: owner_name
data.detailCard.fields["created_at"].field: created_at

behavior.detailCard.onLoad: callApi:detailCard.GetProductDetail
behavior.detailCard.actions["edit"].onClick: openModal:modalProduct:edit

permission.detailCard.actions["edit"].required: product.update

accessibility.detailCard.ariaLabel: 产品详情

responsive.mobile.detailCard.fields.columns: 1
responsive.desktop.detailCard.fields.columns: 2
