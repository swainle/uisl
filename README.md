# UISL 标准文档集合

UISL（UI Structure Language）是一门用于描述 UI 结构、内容、显示语义、行为、数据、状态、权限、校验、可访问性、响应式和目标实现适配的描述语言。

UISL 描述文件统一使用 `.sl` 作为文件扩展名。

本文档集合用于说明 UISL 的语言规则、目录组织方式和项目接入方式。标准文档仓库只维护文档、模板和示例，不存放业务项目代码。

## 文档目录

```text
README.md
CHANGELOG.md
docs/
  00-overview.md
  01-repository.md
  02-project-usage.md
  03-syntax.md
  04-naming.md
  05-layers.md
  06-structure.md
  07-content.md
  08-style-token-motion.md
  09-data-state.md
  10-behavior.md
  11-validation-permission-accessibility.md
  12-responsive.md
  13-profile-target.md
  14-trace.md
  15-type-registry.md
  16-examples.md
examples/
  dashboard.sl
  product-list.sl
  profile/
    primary.sl
    secondary.sl
templates/
  page.sl
  profile.sl
```

## 阅读顺序

```text
1. docs/00-overview.md
2. docs/01-repository.md
3. docs/02-project-usage.md
4. docs/03-syntax.md
5. docs/04-naming.md
6. docs/05-layers.md
7. docs/06-structure.md
8. docs/13-profile-target.md
9. examples/*.sl
```

## 核心约定

```text
1. `.sl` 文件使用单行路径语法：path.to.property: value。
2. structure 定义组件实例 key 后，其他层通过该 key 直接引用组件。
3. data.*.sources["..."] 的 source key 使用 PascalCase。
4. arch/*.sl 描述公共 UI 架构，尽量与平台、框架、组件库无关。
5. arch/profile/*.sl 描述某个实现目录的框架适配、组件映射、样式策略和局部覆盖。
6. primary / secondary 只是实现目录名称示例，不表达主次关系。
7. draft/ 可以存放 HTML、图片、Markdown、SVG、.sl 等多种 UI 草稿材料。
8. 项目可以通过 Git submodule 引入 UISL 标准文档仓库。
```

## 组件示例

`component/*.sl` 存放可复用组件示例，用于真实项目编写 `arch/*.sl` 和 `profile/*.sl` 时参考。组件示例保持平台无关，框架适配放入项目自身的 `arch/profile/*.sl`。
