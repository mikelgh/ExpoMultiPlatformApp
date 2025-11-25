# 📝 更新日志

本文档记录了项目的所有重要变更。

格式基于 [Keep a Changelog](https://keepachangelog.com/zh-CN/1.0.0/)，
版本号遵循 [语义化版本](https://semver.org/lang/zh-CN/)。

## [1.0.0] - 2025-11-25

### ✨ 新增

- 🎉 初始版本发布
- 🌐 Web 平台支持（React Native Web）
- 🤖 Android 平台支持（原生应用）
- 🪟 Windows 平台支持（Electron 桌面应用）
- 🎨 现代化 UI 界面设计
  - 品牌展示区
  - 平台信息卡片
  - 交互计数器
  - 平台支持展示
- 🔍 智能平台检测
  - 使用 `navigator.userAgent` 识别 Electron 环境
  - 正确区分 Web 和 Electron 平台
- 🚀 便捷启动脚本（Windows）
  - `start-web.bat` - Web 平台启动
  - `start-android.bat` - Android 平台启动
  - `start-electron.bat` - Electron 智能启动
- 🧠 智能 Electron 启动逻辑
  - 自动检测 8081 端口状态
  - 复用现有 Web 服务
  - 避免端口冲突
- 📚 完整文档
  - README.md - 项目主文档
  - QUICK_START.md - 快速启动指南
  - PROJECT_SUMMARY.md - 项目技术总结
  - CONTRIBUTING.md - 贡献指南
  - CHANGELOG.md - 更新日志（本文件）

### 🐛 修复

- 修复 React 版本不匹配问题
  - `react` 和 `react-dom` 统一为 19.1.0
  - 解决 "Incompatible React versions" 错误
- 修复 Web 页面空白问题
  - 更正 `package.json` 中的 `main` 字段为 `index.ts`
- 修复 Electron 端口冲突
  - 实现智能端口检测和复用
- 修复 Windows .js 文件关联问题
  - 使用 `node_modules\.bin\electron.cmd` 直接调用
  - 避免触发"选择应用打开文件"对话框
- 修复 Electron 平台识别错误
  - 改用 `navigator.userAgent` 检测
  - 正确显示 "Windows (Electron)" 标识

### 🔧 优化

- 优化启动脚本性能
- 改进错误提示信息
- 完善 TypeScript 类型定义
- 优化跨平台样式兼容性

### 📦 依赖

**核心依赖**:
- expo: ~54.0.25
- react: 19.1.0
- react-dom: 19.1.0
- react-native: 0.81.5
- react-native-web: ^0.21.2
- expo-status-bar: ~3.0.8

**开发依赖**:
- electron: ^39.2.3
- electron-builder: ^26.0.12
- typescript: ~5.9.2
- concurrently: ^9.2.1
- wait-on: ^9.0.3

### 📊 统计

- 新增文件: 13 个
- 代码行数: 7,889+ 行
- 文档: 4 个主要文档文件
- 平台支持: 3 个（Web、Android、Windows）

---

## [未来计划]

### 计划中的功能

- [ ] iOS 平台支持
- [ ] 主题切换（深色模式）
- [ ] 国际化支持（i18n）
- [ ] 导航系统（React Navigation）
- [ ] 状态管理（Redux/Zustand）
- [ ] 数据持久化（AsyncStorage）
- [ ] 网络请求封装
- [ ] 单元测试和集成测试
- [ ] CI/CD 自动化部署
- [ ] PWA 支持
- [ ] macOS 支持（Electron）

### 改进计划

- [ ] 性能优化
- [ ] 更多 UI 组件
- [ ] 示例应用场景
- [ ] 视频教程
- [ ] 在线演示

---

## 版本说明

- **主版本号（Major）**：不兼容的 API 修改
- **次版本号（Minor）**：向下兼容的功能性新增
- **修订号（Patch）**：向下兼容的问题修正

---

**最后更新**: 2025-11-25
