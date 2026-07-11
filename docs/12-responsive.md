# responsive

`responsive` 描述不同屏幕和容器尺寸下的显示方式、宽度、高度、最大高度、间距、布局方向、溢出策略和组件密度。

## 断点

```text
responsive.breakpoints["mobile"].maxWidth: 767
responsive.breakpoints["tablet"].minWidth: 768
responsive.breakpoints["tablet"].maxWidth: 1023
responsive.breakpoints["desktop"].minWidth: 1024
responsive.breakpoints["wide"].minWidth: 1440
```

## 常用属性

```text
responsive.<screen>.<component>.display: Table
responsive.<screen>.<component>.layout: Horizontal
responsive.<screen>.<component>.width: 100%
responsive.<screen>.<component>.minWidth: 320
responsive.<screen>.<component>.maxWidth: 1200
responsive.<screen>.<component>.height: Auto
responsive.<screen>.<component>.minHeight: 320
responsive.<screen>.<component>.maxHeight: calc(100vh - 240px)
responsive.<screen>.<component>.padding: token.spacing.md
responsive.<screen>.<component>.gap: token.spacing.sm
responsive.<screen>.<component>.overflow: Auto
responsive.<screen>.<component>.density: Compact
responsive.<screen>.<component>.columns: 2
responsive.<screen>.<component>.columnRatio: 1.55fr 0.8fr
```

## Dashboard 示例

```text
responsive.mobile.page.width: 100vw
responsive.mobile.page.minHeight: 100vh
responsive.mobile.page.padding: token.spacing.md
responsive.mobile.metricGridDashboard.layout: Grid
responsive.mobile.metricGridDashboard.columns: 2
responsive.mobile.contentGridDashboard.layout: Vertical
responsive.mobile.contentGridDashboard.columns: 1
responsive.mobile.bottomNavDashboard.display: FixedBottom
responsive.mobile.bottomNavDashboard.height: 80

responsive.tablet.metricGridDashboard.columns: 4
responsive.tablet.contentGridDashboard.layout: Grid
responsive.tablet.contentGridDashboard.columns: 2

responsive.desktop.page.maxWidth: 1440
responsive.desktop.metricGridDashboard.columns: 4
responsive.desktop.contentGridDashboard.layout: Grid
responsive.desktop.contentGridDashboard.columns: 2
responsive.desktop.contentGridDashboard.columnRatio: 1.55fr 0.8fr
responsive.desktop.bottomNavDashboard.display: Hidden
```

## 容器响应式

组件可以按容器尺寸定义响应式规则。

```text
responsive.container.metricGridDashboard.minWidth: 480
responsive.container.metricGridDashboard.columns: 2
responsive.container.metricGridDashboard.gap: token.spacing.md
```

## 自适应意图

```text
1. 桌面端展示完整信息，例如 Table、Horizontal Toolbar、双栏 Dashboard。
2. 平板端支持换行和收缩，例如 Wrap FilterForm、两栏卡片。
3. 移动端使用纵向布局，例如 CardList、Vertical Form、FixedBottom Nav。
4. 大面积列表组件设置 maxHeight 与 overflow。
5. 弹窗在移动端可以接近全屏。
6. 宽高控制使用语义属性，具体实现由目标框架承担。
```
