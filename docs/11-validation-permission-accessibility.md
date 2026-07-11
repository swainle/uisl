# validation、permission 与 accessibility

## permission

`permission` 描述访问权限和操作权限。

```text
permission.page.required: product.read
permission.toolbarProduct.actions["create"].required: product.create
permission.tableProduct.rowActions["edit"].required: product.update
permission.tableProduct.rowActions["delete"].required: product.delete
```

支持任一权限：

```text
permission.tableProduct.rowActions["delete"].required.any: product.delete,admin
```

支持全部权限：

```text
permission.tableProduct.rowActions["delete"].required.all: product.delete,product.audit
```

Dashboard 示例：

```text
permission.page.required: dashboard.read
permission.topAppBarDashboard.actions["notifications"].required: notification.read
permission.alertListRealtime.actions["viewAll"].required: alert.read
permission.bottomNavDashboard.children["navOverview"].required: dashboard.read
permission.bottomNavDashboard.children["navAnalytics"].required: analytics.read
permission.bottomNavDashboard.children["navReports"].required: report.read
permission.bottomNavDashboard.children["navSettings"].required: settings.read
```

## validation

`validation` 描述表单校验规则。

```text
validation.formProduct.fields["name"].required: true
validation.formProduct.fields["name"].minLength: 2
validation.formProduct.fields["name"].maxLength: 64
validation.formProduct.fields["name"].message.required: 请输入产品名称

validation.formProduct.fields["price"].type: Number
validation.formProduct.fields["price"].min: 0

validation.formProduct.fields["status"].required: true
validation.formProduct.fields["status"].enum: active,disabled
```

## accessibility

`accessibility` 描述可访问性语义，例如语言、ARIA、alt、role、键盘行为和焦点。

页面语言：

```text
accessibility.page.lang: zh-CN
```

区块语义：

```text
accessibility.metricGridDashboard.ariaLabel: 关键指标
accessibility.chartBusinessGrowth.ariaLabel: 业务增长趋势
accessibility.alertListRealtime.ariaLabel: 实时预警
accessibility.bottomNavDashboard.ariaLabel: 底部导航
```

图片和图标：

```text
accessibility.topAppBarDashboard.children["avatarUser"].alt: 专业商务头像
accessibility.topAppBarDashboard.actions["notifications"].ariaLabel: 通知
accessibility.chartBusinessGrowth.children["areaChart"].role: img
accessibility.chartBusinessGrowth.children["areaChart"].ariaLabel: 业务增长趋势折线面积图
accessibility.icon.ariaHidden: true
```

键盘与焦点：

```text
accessibility.bottomNavDashboard.children["navOverview"].focusable: true
accessibility.bottomNavDashboard.children["navOverview"].role: link
accessibility.button.focusRing: true
```
