meta.name: bottomNavExample
meta.title: 底部导航组件示例
meta.type: Component
meta.description: 移动端固定底部导航，支持当前项、跳转和权限控制。

structure.bottomNav.type: BottomNav
structure.bottomNav.children["navOverview"].type: NavItem
structure.bottomNav.children["navAnalytics"].type: NavItem
structure.bottomNav.children["navReports"].type: NavItem
structure.bottomNav.children["navSettings"].type: NavItem

content.bottomNav.children["navOverview"].label: Overview
content.bottomNav.children["navAnalytics"].label: Analytics
content.bottomNav.children["navReports"].label: Reports
content.bottomNav.children["navSettings"].label: Settings

style.bottomNav.position: FixedBottom
style.bottomNav.height: 80
style.bottomNav.padding: token.spacing.sm
style.bottomNav.radius: token.radius.lg
style.bottomNav.shadow: token.shadow.sm
style.bottomNav.background: token.colors.surface
style.bottomNav.layout: Horizontal
style.bottomNav.align: Around
style.bottomNav.children["navOverview"].icon: Dashboard
style.bottomNav.children["navAnalytics"].icon: Analytics
style.bottomNav.children["navReports"].icon: FileText
style.bottomNav.children["navSettings"].icon: Settings
style.bottomNav.children["navOverview"].state.active.background: token.colors.primary
style.bottomNav.children["navOverview"].state.active.color: token.colors.onPrimary

state.bottomNav.activeNav: overview

behavior.bottomNav.children["navOverview"].onClick: setState:state.bottomNav.activeNav=overview, navigate:/dashboard
behavior.bottomNav.children["navAnalytics"].onClick: setState:state.bottomNav.activeNav=analytics, navigate:/analytics
behavior.bottomNav.children["navReports"].onClick: setState:state.bottomNav.activeNav=reports, navigate:/reports
behavior.bottomNav.children["navSettings"].onClick: setState:state.bottomNav.activeNav=settings, navigate:/settings

permission.bottomNav.children["navOverview"].required: dashboard.read
permission.bottomNav.children["navAnalytics"].required: analytics.read
permission.bottomNav.children["navReports"].required: report.read
permission.bottomNav.children["navSettings"].required: settings.read

accessibility.bottomNav.role: navigation
accessibility.bottomNav.ariaLabel: 底部导航
accessibility.bottomNav.children["navOverview"].role: link
accessibility.bottomNav.children["navAnalytics"].role: link
accessibility.bottomNav.children["navReports"].role: link
accessibility.bottomNav.children["navSettings"].role: link

responsive.mobile.bottomNav.display: FixedBottom
responsive.desktop.bottomNav.display: Hidden
