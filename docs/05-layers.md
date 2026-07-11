# 分层

UISL 使用分层描述 UI。每一层负责一类语义。

## 标准层

```text
meta
source
target
targets
platformAdapter
targetOverride
trace
typeRegistry
structure
content
style
token
motion
data
state
behavior
permission
validation
accessibility
responsive
```

## 层职责

```text
meta           文件自身信息
source         草稿、设计稿、PRD、截图等来源引用
target         单个目标实现策略
targets        多个目标实现策略
platformAdapter 平台组件映射
targetOverride 目标实现局部覆盖
trace          目标产物反查 UISL 路径
typeRegistry   组件 type 声明和扩展
structure      页面、布局和组件树
content        静态文案、演示内容、默认展示值
style          跨平台稳定视觉语义
token          设计 token
motion         轻量动效与交互反馈
data           API、字段绑定、响应映射、图表数据源
state          运行时状态
behavior       事件和动作流水线
permission     权限
validation     校验规则
accessibility  可访问性语义
responsive     响应式规则
```

## 常用边界

```text
文案、标题、演示数值：content
真实接口和字段映射：data
运行时可变值：state
布局、颜色、字体、圆角、阴影：style + token
press、hover、toast 动效：motion
点击、跳转、API、弹窗：behavior
aria、alt、role、lang：accessibility
目标框架、组件库、样式语言：profile / target / targets
平台组件映射：platformAdapter
局部实现差异：targetOverride / profile override
目标产物定位：trace
```

## 组件实例引用

structure 中的组件实例 key 是其他层的引用入口。

```text
structure.page.slots["main"].children["chartBusinessGrowth"].type: AreaChartCard

content.chartBusinessGrowth.title: 业务增长趋势
style.chartBusinessGrowth.radius: token.radius.lg
data.chartBusinessGrowth.series["businessGrowth"].y: 130,110,140,90,40,70,50
behavior.chartBusinessGrowth.actions["timeRange"].onClick: toast:切换时间范围
accessibility.chartBusinessGrowth.ariaLabel: 业务增长趋势
```
