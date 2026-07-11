meta.name: sideNavExample
meta.title: 侧边导航组件示例
meta.type: Component
meta.description: 桌面端后台导航，支持分组、当前项和权限控制。

structure.sideNav.type: SideNav
structure.sideNav.children["navDashboard"].type: NavItem
structure.sideNav.children["navProduct"].type: NavItem
structure.sideNav.children["navOrder"].type: NavItem
structure.sideNav.children["navSettings"].type: NavItem

content.sideNav.children["navDashboard"].label: 数据大屏
content.sideNav.children["navProduct"].label: 产品管理
content.sideNav.children["navOrder"].label: 订单管理
content.sideNav.children["navSettings"].label: 系统设置

style.sideNav.width: 240
style.sideNav.minHeight: 100vh
style.sideNav.padding: token.spacing.md
style.sideNav.background: token.colors.surface
style.sideNav.borderRight: token.colors.border
style.sideNav.layout: Vertical
style.sideNav.gap: token.spacing.xs
style.sideNav.children["navDashboard"].icon: Dashboard
style.sideNav.children["navProduct"].icon: Package
style.sideNav.children["navOrder"].icon: ShoppingCart
style.sideNav.children["navSettings"].icon: Settings
style.sideNav.children["navProduct"].state.active.background: token.colors.primarySoft
style.sideNav.children["navProduct"].state.active.color: token.colors.primary

state.sideNav.activeNav: product
state.sideNav.collapsed: false

behavior.sideNav.children["navDashboard"].onClick: setState:state.sideNav.activeNav=dashboard, navigate:/dashboard
behavior.sideNav.children["navProduct"].onClick: setState:state.sideNav.activeNav=product, navigate:/products
behavior.sideNav.children["navOrder"].onClick: setState:state.sideNav.activeNav=order, navigate:/orders
behavior.sideNav.children["navSettings"].onClick: setState:state.sideNav.activeNav=settings, navigate:/settings

permission.sideNav.children["navDashboard"].required: dashboard.read
permission.sideNav.children["navProduct"].required: product.read
permission.sideNav.children["navOrder"].required: order.read
permission.sideNav.children["navSettings"].required: settings.read

accessibility.sideNav.role: navigation
accessibility.sideNav.ariaLabel: 侧边导航

responsive.mobile.sideNav.display: Hidden
responsive.desktop.sideNav.display: Block
