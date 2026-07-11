# trace

`trace` 用于把目标产物中的元素反查回 UISL 路径，方便定位、审阅和最小范围修改。

## 基础配置

```text
trace.enabled: true
trace.attribute: data-uisl
trace.pathFormat: componentPath
trace.includeChildren: true
trace.includeActions: true
```

## 目标 HTML 示例

```html
<section data-uisl="metricGridDashboard">
  <article data-uisl='metricGridDashboard.children["metricRevenue"]'>...</article>
</section>
```

UISL 对应结构：

```text
structure.page.slots["main"].children["metricGridDashboard"].type: MetricGrid
structure.metricGridDashboard.children["metricRevenue"].type: MetricCard
```

## trace manifest

目标实现可以生成机器可读的 trace manifest。

```json
{
  "metricGridDashboard.children[\"metricRevenue\"]": {
    "source": "ui/web/arch/pages/dashboard.sl",
    "target": "ui/web/primary/components/dashboard/MetricCard.tsx",
    "dom": "[data-uisl='metricGridDashboard.children[\"metricRevenue\"]']"
  }
}
```

## Flutter 或非 DOM 目标

非 DOM 目标可以使用注释或 debug key。

```dart
// uisl: metricGridDashboard.children["metricRevenue"]
MetricCard(...)
```

```dart
MetricCard(key: const ValueKey('metricGridDashboard.metricRevenue'))
```

## 路径稳定性

trace 路径使用稳定 key：

```text
children["metricRevenue"]
actions["create"]
columns["status"]
fields["name"]
sources["GetProductList"]
```
