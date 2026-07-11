meta.name: topAppBarExample
meta.title: 顶部应用栏组件示例
meta.type: Component
meta.description: 页面顶部导航区域，包含标题、用户入口和操作按钮。

structure.topAppBar.type: TopAppBar
structure.topAppBar.children["avatarUser"].type: Avatar
structure.topAppBar.children["title"].type: Text
structure.topAppBar.children["subtitle"].type: Text
structure.topAppBar.actions["notifications"].type: IconButton
structure.topAppBar.actions["settings"].type: IconButton

content.topAppBar.children["title"].text: 数据大屏
content.topAppBar.children["subtitle"].text: 业务运行概览
content.topAppBar.children["avatarUser"].assetRef: assets/avatar-user.svg
content.topAppBar.children["avatarUser"].alt: 用户头像

style.topAppBar.position: StickyTop
style.topAppBar.height: 64
style.topAppBar.width: 100%
style.topAppBar.padding: token.spacing.md
style.topAppBar.background: token.colors.surface
style.topAppBar.layout: Horizontal
style.topAppBar.align: Between
style.topAppBar.gap: token.spacing.sm
style.topAppBar.shadow: token.shadow.none
style.topAppBar.children["avatarUser"].size: 40
style.topAppBar.children["title"].fontSize: token.font.size.lg
style.topAppBar.children["title"].fontWeight: token.font.weight.semibold
style.topAppBar.children["subtitle"].fontSize: token.font.size.xs
style.topAppBar.children["subtitle"].color: token.colors.textSecondary
style.topAppBar.actions["notifications"].icon: Notifications
style.topAppBar.actions["settings"].icon: Settings

behavior.topAppBar.actions["notifications"].onClick: navigate:/notifications
behavior.topAppBar.actions["settings"].onClick: navigate:/settings

accessibility.topAppBar.role: banner
accessibility.topAppBar.actions["notifications"].ariaLabel: 通知
accessibility.topAppBar.actions["settings"].ariaLabel: 设置
accessibility.topAppBar.children["avatarUser"].alt: 用户头像

responsive.mobile.topAppBar.height: 64
responsive.desktop.topAppBar.height: 72
