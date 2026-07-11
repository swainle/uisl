# 标准文档仓库

UISL 标准仓库用于维护文档、模板和示例。

仓库内容：

```text
README.md
CHANGELOG.md
docs/
examples/
templates/
```

## 推荐结构

```text
uisl-standard/
├─ README.md
├─ CHANGELOG.md
├─ docs/
│  ├─ 00-overview.md
│  ├─ 01-repository.md
│  ├─ 02-project-usage.md
│  ├─ 03-syntax.md
│  ├─ 04-naming.md
│  ├─ 05-layers.md
│  ├─ 06-structure.md
│  ├─ 07-content.md
│  ├─ 08-style-token-motion.md
│  ├─ 09-data-state.md
│  ├─ 10-behavior.md
│  ├─ 11-validation-permission-accessibility.md
│  ├─ 12-responsive.md
│  ├─ 13-profile-target.md
│  ├─ 14-trace.md
│  ├─ 15-type-registry.md
│  └─ 16-examples.md
├─ examples/
│  ├─ dashboard.sl
│  ├─ product-list.sl
│  └─ profile/
│     ├─ primary.sl
│     └─ secondary.sl
└─ templates/
   ├─ page.sl
   └─ profile.sl
```

## CHANGELOG

更新日志使用独立文件维护：

```text
CHANGELOG.md
```

标准正文只描述当前规则。历史记录、调整记录和说明性记录集中放在更新日志中。

## 文档拆分原则

```text
1. 每个文档只说明一个主题。
2. 概览文档负责串联概念。
3. 语法、命名、分层、目录、profile、示例分别成文。
4. 示例文件使用真实 `.sl` 文件呈现。
5. 模板文件用于复制到项目中快速开始。
```
