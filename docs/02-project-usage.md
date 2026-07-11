# 项目接入与目录结构

项目可以通过 Git submodule 引入 UISL 标准文档仓库。

示例：

```bash
git submodule add <uisl-standard-repo-url> docs/uisl
```

项目中的 `docs/uisl` 存放标准文档，业务项目代码和 `.sl` 描述文件由项目自身维护。

## 推荐项目结构

```text
project/
├─ docs/
│  └─ uisl/                       # 通过 submodule 引入的标准文档
├─ ui/
│  └─ web/
│     ├─ primary/                 # 实现目录示例，可以是任意框架
│     ├─ secondary/               # 另一个并行维护的实现目录
│     ├─ draft/                   # UI 草稿、概念稿、图片、HTML、说明等
│     └─ arch/                    # 公共 UISL 架构描述
│        ├─ pages/
│        │  ├─ dashboard.sl
│        │  └─ product-list.sl
│        ├─ components/
│        │  ├─ metric-card.sl
│        │  └─ alert-list.sl
│        ├─ design/
│        │  └─ light-token.sl
│        └─ profile/
│           ├─ primary.sl
│           └─ secondary.sl
└─ README.md
```

## 实现目录

`primary`、`secondary` 只是实现目录名称示例，不表达主次关系。项目可以按框架、业务线、应用形态或内部命名方式组织。

示例：

```text
ui/web/nextjs/
ui/web/vue/
ui/web/react-admin/
ui/web/admin-a/
ui/web/admin-b/
```

多个实现目录可以长期并行存在和维护。

## draft 目录

`draft/` 用于保存 UI 草稿材料，可以包含多种文件格式。

```text
ui/web/draft/
  dashboard.html
  dashboard.png
  product-list.md
  wireframe.svg
  idea.sl
```

`draft/` 的职责是表达 UI 意图。正式 UISL 架构描述放入 `arch/`。

## arch 目录

`arch/` 存放公共 UISL 架构描述，应尽量保持平台、框架和组件库无关。

常见内容：

```text
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
trace
typeRegistry
```

## profile 目录

`arch/profile/` 存放每个实现目录的适配描述。

常见内容：

```text
target
targets
platformAdapter
targetOverride
profile override
```

profile 可以写必要的局部覆盖。局部覆盖用于表达某个实现目录因框架、组件库、样式方案或工程约束产生的差异。

## 修改工作流

```text
1. 在 draft/ 中保存 UI 草稿、截图、HTML 原型或说明。
2. 根据草稿和 UISL 标准形成 arch/*.sl。
3. 根据 arch/*.sl 与 arch/profile/*.sl 维护具体实现目录。
4. 后续修改时，输入已生成的框架页面和手动调整后的 .sl diff。
5. 根据 .sl diff 与当前页面做最小范围更新。
```
