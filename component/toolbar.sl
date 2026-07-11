meta.name: toolbarExample
meta.title: 工具栏组件示例
meta.type: Component
meta.description: 页面级操作区域，承载创建、导入、导出、刷新等动作。

structure.toolbar.type: Toolbar
structure.toolbar.actions["create"].type: Button
structure.toolbar.actions["import"].type: Button
structure.toolbar.actions["export"].type: Button
structure.toolbar.actions["refresh"].type: IconButton

content.toolbar.actions["create"].label: 新建
content.toolbar.actions["import"].label: 导入
content.toolbar.actions["export"].label: 导出
content.toolbar.actions["refresh"].label: 刷新

style.toolbar.layout: Horizontal
style.toolbar.align: Right
style.toolbar.gap: token.spacing.sm
style.toolbar.height: 48
style.toolbar.width: 100%
style.toolbar.actions["create"].variant: Primary
style.toolbar.actions["create"].icon: Plus
style.toolbar.actions["import"].variant: Secondary
style.toolbar.actions["import"].icon: Upload
style.toolbar.actions["export"].variant: Secondary
style.toolbar.actions["export"].icon: Download
style.toolbar.actions["refresh"].icon: RefreshCw

behavior.toolbar.actions["create"].onClick: openModal:modalProduct:create
behavior.toolbar.actions["import"].onClick: openModal:modalImport:create
behavior.toolbar.actions["export"].onClick: callApi:tableProduct.ExportProduct
behavior.toolbar.actions["refresh"].onClick: callApi:tableProduct.GetProductList

permission.toolbar.actions["create"].required: product.create
permission.toolbar.actions["import"].required: product.import
permission.toolbar.actions["export"].required: product.export

accessibility.toolbar.role: toolbar
accessibility.toolbar.ariaLabel: 页面操作
accessibility.toolbar.actions["refresh"].ariaLabel: 刷新列表

responsive.mobile.toolbar.layout: Wrap
responsive.mobile.toolbar.align: Left
responsive.desktop.toolbar.layout: Horizontal
responsive.desktop.toolbar.align: Right
