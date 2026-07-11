# content

`content` 描述静态文案、演示内容、默认展示值和可替换的数据占位。

## 页面文案

```text
content.page.title: 数据大屏
content.page.subtitle: 业务运行概览
content.page.description: 展示关键指标、业务增长趋势、实时预警和底部导航。
```

## 指标卡内容

```text
content.metricGridDashboard.children["metricRevenue"].label: 今日营收
content.metricGridDashboard.children["metricRevenue"].displayValue: ¥42,850
content.metricGridDashboard.children["metricRevenue"].trendLabel: +12%
content.metricGridDashboard.children["metricRevenue"].trendDirection: Up

content.metricGridDashboard.children["metricConversionRate"].label: 转化率
content.metricGridDashboard.children["metricConversionRate"].displayValue: 3.42%
content.metricGridDashboard.children["metricConversionRate"].trendLabel: -2%
content.metricGridDashboard.children["metricConversionRate"].trendDirection: Down
```

## 图表内容

```text
content.chartBusinessGrowth.title: 业务增长趋势
content.chartBusinessGrowth.subtitle: 最近7天
content.chartBusinessGrowth.actions["timeRange"].label: 最近7天
content.chartBusinessGrowth.children["areaChart"].xAxisLabels: 周一,周二,周三,周四,周五,周六,周日
```

## 列表内容

```text
content.alertListRealtime.title: 实时预警
content.alertListRealtime.actions["viewAll"].label: 查看全部
content.alertListRealtime.children["alertStock"].title: 库存预警: 核心组件
content.alertListRealtime.children["alertStock"].description: SKU-2930 当前库存低于安全水平 (15/100)。
content.alertListRealtime.children["alertStock"].time: 10:24
```

## 空、加载和错误占位

```text
content.tableProduct.emptyText: 暂无数据
content.tableProduct.errorText: 数据加载失败
content.tableProduct.loadingText: 加载中
```

## 国际化扩展

```text
content.page.title.key: dashboard.title
content.page.title.default: 数据大屏
content.page.title.locales["en-US"]: Dashboard
content.page.title.locales["ja-JP"]: ダッシュボード

i18n.defaultLocale: zh-CN
i18n.supportedLocales: zh-CN,en-US,ja-JP
```
