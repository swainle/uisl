# 基础语法

UISL 使用单行路径语法。

```text
path.to.property: value
```

每一行只描述一个属性，便于审阅、复制、对比和局部修改。

## 基本示例

```text
meta.name: pageProductList
meta.title: 产品管理
meta.type: Page

structure.page.type: AdminCrudPage
structure.page.slots["main"].children["toolbarProduct"].type: Toolbar
structure.page.slots["main"].children["tableProduct"].type: Table

content.page.title: 产品管理
style.page.padding: token.spacing.lg
behavior.page.onLoad: callApi:tableProduct.GetProductList
```

## 路径

路径由层级段组成：

```text
layer.component.collection["key"].property
```

示例：

```text
structure.tableProduct.columns["status"].type: TableColumn
content.tableProduct.columns["status"].label: 状态
style.tableProduct.columns["status"].width: 120
```

## 集合 key

集合成员使用 `collection["key"]` 表达。

```text
children["metricRevenue"]
actions["create"]
columns["status"]
fields["name"]
sources["GetProductList"]
series["businessGrowth"]
```

## 值类型

```text
字符串：默认按原文处理
数字：尺寸字段中的纯数字按 px 处理
布尔：true / false
空值：null
简单数组：使用英文逗号分隔
引用：使用 token.* / state.* / data.* / content.* / 相对文件路径
```

示例：

```text
style.topAppBarDashboard.height: 64
state.tableProduct.pagination.currentPage: 1
style.page.width: 100%
style.card.maxHeight: calc(100vh - 240px)
validation.formProduct.fields["status"].enum: active,disabled
```

## 注释

注释使用 `#`。

```text
# 产品管理页
meta.name: pageProductList

# 产品列表接口
data.tableProduct.sources["GetProductList"].path: /api/v1/products
```

## 多行文本

多行文本可以使用块值。

```text
content.page.description: """
这里是多行说明。
可以包含冒号、逗号和井号。
"""
```

## 文件引用

文件引用使用相对路径。

```text
meta.source.draftRef: ../../draft/dashboard.html
meta.design.tokenRef: ../design/light-token.sl
profile.extends: ../pages/dashboard.sl
```
