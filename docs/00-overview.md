# UISL 概览

UISL（UI Structure Language）用于描述 UI 的结构、内容、显示语义、行为、数据、状态、权限、校验、可访问性、响应式和目标实现适配。

UISL 适合作为 AI、设计草稿、产品说明和前端实现之间的中间描述层。

```text
UI 草稿 / 截图 / HTML 原型 / PRD / 手写说明
        ↓
      UISL `.sl`
        ↓
Web / Mobile / Desktop / Mini Program / 其他目标实现
```

## 文件扩展名

UISL 描述文件统一使用 `.sl` 扩展名。

示例：

```text
dashboard.sl
product-list.sl
light-token.sl
profile/primary.sl
```

## 语言职责

UISL 描述以下内容：

```text
1. 页面、布局、区域和组件实例。
2. 静态文案、演示数据、默认展示内容。
3. 跨平台稳定的视觉语义，例如布局、密度、字号、字重、圆角、阴影和 token。
4. 用户行为，例如点击、跳转、弹窗、toast、状态更新和 API 调用。
5. 数据源、字段绑定、请求参数、响应映射和图表 series。
6. 运行时状态。
7. 权限、校验、可访问性和响应式。
8. 多个实现目录的框架适配、组件映射和局部覆盖。
9. 目标产物与 UISL 路径之间的追踪关系。
```

## Core 与 Profile

UISL 分为两类描述：

```text
UISL Core
  structure / content / style / token / motion / data / state / behavior
  permission / validation / accessibility / responsive / trace / typeRegistry

Profile
  target / targets / platformAdapter / targetOverride / profile override
```

Core 负责表达平台无关的 UI 架构和业务语义。Profile 负责表达某个实现目录的框架、组件库、样式语言、图表库、资源策略和局部覆盖。

## 组件实例 key

structure 定义组件实例 key 后，其他层通过该 key 直接引用组件。

```text
structure.page.slots["main"].children["metricGridDashboard"].type: MetricGrid

style.metricGridDashboard.layout: Grid
style.metricGridDashboard.gap: token.spacing.md
behavior.metricGridDashboard.onClick: toast:打开指标区
accessibility.metricGridDashboard.ariaLabel: 关键指标
```

`metricGridDashboard` 是组件实例 key。其他层不需要重复完整的 structure 路径。
