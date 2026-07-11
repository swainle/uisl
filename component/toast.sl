meta.name: toastExample
meta.title: Toast 反馈组件示例
meta.type: Component
meta.description: 用于操作成功、失败、警告和普通提示的轻量反馈。

structure.toast.type: Toast
structure.toast.children["icon"].type: Icon
structure.toast.children["message"].type: Text
structure.toast.actions["close"].type: IconButton

content.toast.message.success: 操作成功
content.toast.message.error: 操作失败，请稍后重试
content.toast.message.warning: 请检查输入内容
content.toast.message.info: 已更新

style.toast.position: TopRight
style.toast.minWidth: 280
style.toast.maxWidth: 420
style.toast.padding: token.spacing.md
style.toast.radius: token.radius.md
style.toast.shadow: token.shadow.sm
style.toast.background: token.colors.surface
style.toast.layout: Horizontal
style.toast.align: Center
style.toast.gap: token.spacing.sm
style.toast.state.success.iconColor: token.colors.success
style.toast.state.error.iconColor: token.colors.danger
style.toast.state.warning.iconColor: token.colors.warning
style.toast.actions["close"].icon: X

motion.toast.enter.duration: 160ms
motion.toast.exit.duration: 120ms
motion.toast.visible.duration: 1400ms

state.toast.visible: false
state.toast.type: info
state.toast.message: ""

behavior.toast.actions["close"].onClick: setState:state.toast.visible=false

accessibility.toast.role: status
accessibility.toast.ariaLive: polite

responsive.mobile.toast.position: TopCenter
responsive.mobile.toast.maxWidth: calc(100vw - 32px)
responsive.desktop.toast.position: TopRight
