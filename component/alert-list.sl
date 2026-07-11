meta.name: alertListExample
meta.title: 预警列表组件示例
meta.type: Component
meta.description: 展示预警、通知或动态信息，支持查看全部和单项跳转。

structure.alertList.type: AlertList
structure.alertList.children["alertStock"].type: AlertItem
structure.alertList.children["alertPayment"].type: AlertItem
structure.alertList.children["alertLatency"].type: AlertItem
structure.alertList.actions["viewAll"].type: Button

content.alertList.title: 实时预警
content.alertList.actions["viewAll"].label: 查看全部
content.alertList.children["alertStock"].title: 库存预警: 核心组件
content.alertList.children["alertStock"].description: SKU-2930 当前库存低于安全水平 (15/100)。
content.alertList.children["alertStock"].time: 10:24
content.alertList.children["alertPayment"].title: 支付成功率波动
content.alertList.children["alertPayment"].description: 近 15 分钟成功率下降 2.1%。
content.alertList.children["alertPayment"].time: 10:12
content.alertList.children["alertLatency"].title: API 延迟升高
content.alertList.children["alertLatency"].description: 订单接口 P95 延迟超过阈值。
content.alertList.children["alertLatency"].time: 09:58

style.alertList.card: true
style.alertList.radius: token.radius.lg
style.alertList.shadow: token.shadow.xs
style.alertList.background: token.colors.surface
style.alertList.padding: token.spacing.md
style.alertList.layout: Vertical
style.alertList.gap: token.spacing.sm
style.alertList.overflow: Hidden
style.alertList.children["alertStock"].icon: Warning
style.alertList.children["alertStock"].severity: Error
style.alertList.children["alertPayment"].icon: CreditCard
style.alertList.children["alertPayment"].severity: Warning
style.alertList.children["alertLatency"].icon: Activity
style.alertList.children["alertLatency"].severity: Warning

state.alertList.loading: false
state.alertList.items: []

data.alertList.sources["GetAlertList"].method: GET
data.alertList.sources["GetAlertList"].path: /api/v1/alerts
data.alertList.sources["GetAlertList"].response.rows.to: state.alertList.items

behavior.alertList.onLoad: callApi:alertList.GetAlertList
behavior.alertList.actions["viewAll"].onClick: navigate:/alerts
behavior.alertList.children["alertStock"].onClick: navigate:/alerts/stock
behavior.alertList.children["alertPayment"].onClick: navigate:/alerts/payment
behavior.alertList.children["alertLatency"].onClick: navigate:/alerts/latency

permission.alertList.actions["viewAll"].required: alert.read

accessibility.alertList.ariaLabel: 实时预警
accessibility.alertList.children["alertStock"].role: link
accessibility.alertList.children["alertPayment"].role: link
accessibility.alertList.children["alertLatency"].role: link

responsive.mobile.alertList.maxHeight: none
responsive.desktop.alertList.maxHeight: 360
responsive.desktop.alertList.overflow: Auto
