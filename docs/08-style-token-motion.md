# style、token 与 motion

`style` 描述跨平台稳定视觉语义。`token` 描述设计变量。`motion` 描述轻量动效和交互反馈。

## style 基础

```text
style.page.padding: token.spacing.lg
style.page.background: token.colors.pageBackground
style.page.minHeight: 100vh
style.page.maxWidth: 100%

style.metricGridDashboard.layout: Grid
style.metricGridDashboard.gap: token.spacing.md
style.metricGridDashboard.children["metricRevenue"].radius: token.radius.lg
style.metricGridDashboard.children["metricRevenue"].shadow: token.shadow.xs
```

## 尺寸

```text
style.topAppBarDashboard.height: 64
style.avatarUser.size: 40
style.tableProduct.width: 100%
style.tableProduct.maxHeight: calc(100vh - 240px)
style.tableProduct.overflow: Auto
```

尺寸字段中的纯数字按 px 处理。

## 圆角

```text
token.radius.xs: 2px
token.radius.sm: 8px
token.radius.md: 12px
token.radius.lg: 18px
token.radius.full: 999px

style.metricGridDashboard.children["metricRevenue"].radius: token.radius.lg
style.bottomNavDashboard.radius: token.radius.lg
```

## 阴影

```text
token.shadow.none: none
token.shadow.xs: 0 10px 24px rgba(24, 40, 72, 0.08)
token.shadow.sm: 0 18px 42px rgba(24, 40, 72, 0.12)

style.card.shadow: token.shadow.xs
style.modalProduct.shadow: token.shadow.sm
style.bottomNavDashboard.shadow: token.shadow.sm
```

## 字体

```text
token.font.family.base: Inter, Segoe UI, PingFang SC, Microsoft YaHei, Arial, sans-serif
token.font.size.xs: 12px
token.font.size.sm: 14px
token.font.size.md: 16px
token.font.size.lg: 20px
token.font.size.xl: 24px
token.font.weight.regular: 400
token.font.weight.medium: 600
token.font.weight.semibold: 700
token.font.weight.bold: 760
token.font.lineHeight.normal: 1.45

style.page.fontFamily: token.font.family.base
style.page.fontSize: token.font.size.sm
style.page.lineHeight: token.font.lineHeight.normal
style.page.titleFontSize: token.font.size.xl
style.page.titleFontWeight: token.font.weight.semibold
```

## 状态样式

```text
style.bottomNavDashboard.children["navOverview"].state.active.background: token.colors.primary
style.bottomNavDashboard.children["navOverview"].state.active.color: token.colors.onPrimary
style.alertListRealtime.children["alertStock"].state.hover.background: token.colors.surfaceBlue
style.button.state.disabled.opacity: 0.5
```

## DesignToken 文件

```text
meta.name: lightToken
meta.title: 浅色主题 Token
meta.type: DesignToken

token.colors.primary: #1a73e8
token.colors.surface: #ffffff
token.colors.pageBackground: #f4f8fd
token.colors.border: #cbd8ea
token.colors.textPrimary: #18202b
token.colors.textSecondary: #4c5b70
token.colors.success: #07883f
token.colors.danger: #ba1a1a
token.spacing.xs: 4px
token.spacing.sm: 12px
token.spacing.md: 16px
token.spacing.lg: 24px
token.spacing.xl: 32px
token.radius.sm: 8px
token.radius.md: 12px
token.radius.lg: 18px
token.radius.full: 999px
```

页面引用 token：

```text
meta.design.tokenRef: ../design/light-token.sl
```

## motion

```text
motion.card.press.scale: 0.98
motion.card.press.duration: 100ms
motion.button.hover.translateY: -1px
motion.button.hover.duration: 160ms
motion.toast.enter.duration: 160ms
motion.toast.visible.duration: 1400ms
motion.chart.fadeIn.delay: 300ms
motion.chart.fadeIn.duration: 1000ms

motion.metricGridDashboard.children["metricRevenue"].press.scale: 0.98
motion.bottomNavDashboard.children["navOverview"].press.scale: 0.95
```
