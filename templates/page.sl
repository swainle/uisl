meta.name: pageExample
meta.title: 页面标题
meta.type: Page
meta.description: 页面说明
meta.source.draftRef: ../draft/example.html
meta.design.tokenRef: ../design/light-token.sl

trace.enabled: true
trace.attribute: data-uisl

structure.page.type: Page
structure.page.slots["main"].children["sectionExample"].type: Section

content.page.title: 页面标题
content.sectionExample.title: 区块标题

style.page.padding: token.spacing.lg
style.sectionExample.radius: token.radius.md
style.sectionExample.shadow: token.shadow.xs

state.sectionExample.loading: false

behavior.page.onLoad: toast:页面加载

accessibility.page.lang: zh-CN
accessibility.sectionExample.ariaLabel: 区块标题

responsive.mobile.sectionExample.layout: Vertical
responsive.desktop.sectionExample.layout: Horizontal
