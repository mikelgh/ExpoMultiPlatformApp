# 🚀 Expo 多平台应用模板

<div align="center">

![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)
![Expo](https://img.shields.io/badge/Expo-54.0-000020.svg?logo=expo)
![React](https://img.shields.io/badge/React-19.1-61DAFB.svg?logo=react)
![TypeScript](https://img.shields.io/badge/TypeScript-5.9-3178C6.svg?logo=typescript)
![License](https://img.shields.io/badge/license-MIT-green.svg)

**一个真正的跨平台应用模板 - 一套代码，三端运行**

[English](./README_EN.md) | [简体中文](./README.md)

[快速开始](#-快速开始) • [功能特性](#-功能特性) • [文档](#-文档) • [贡献](#-贡献)

</div>

---

## 📱 支持的平台

<table>
  <tr>
    <th>平台</th>
    <th>状态</th>
    <th>说明</th>
    <th>启动方式</th>
  </tr>
  <tr>
    <td>🌐 <b>Web</b></td>
    <td>✅ 支持</td>
    <td>现代浏览器，响应式设计</td>
    <td><code>npm run web</code></td>
  </tr>
  <tr>
    <td>🤖 <b>Android</b></td>
    <td>✅ 支持</td>
    <td>原生应用，支持模拟器和真机</td>
    <td><code>npm run android</code></td>
  </tr>
  <tr>
    <td>🪟 <b>Windows</b></td>
    <td>✅ 支持</td>
    <td>Electron 桌面应用</td>
    <td><code>npm run electron</code></td>
  </tr>
</table>

---

## ✨ 功能特性

- 🎯 **单一代码库** - 一次编写，处处运行
- 🔥 **热更新** - 开发时保存即刷新
- 🎨 **现代 UI** - 精美的卡片式设计
- 🌓 **平台感知** - 智能识别运行环境
- 📦 **开箱即用** - 完整配置，无需额外设置
- 🛠 **TypeScript** - 完整的类型支持
- 🚀 **性能优化** - 针对各平台优化的启动脚本
- 📚 **完整文档** - 详尽的使用说明

---

## 🚀 快速开始

### 前置要求

- **Node.js** >= 20.0.0
- **npm** 或 **yarn**
- **(可选) Android Studio** - 用于 Android 开发
- **(可选) Git** - 用于版本控制

### 安装

#### 📦 克隆仓库

**国内用户推荐 (Gitee - 更快)**:
```bash
git clone https://gitee.com/mikelgh/expo-multi-platform-app.git
cd expo-multi-platform-app
```

**国际用户 (GitHub)**:
```bash
git clone https://github.com/mikelgh/ExpoMultiPlatformApp.git
cd ExpoMultiPlatformApp
```

#### 📥 安装依赖

```bash
npm install
```

### 运行

#### 方式一：使用批处理脚本（Windows 推荐）

```bash
# Web 平台
双击 start-web.bat

# Android 平台（需要模拟器或真机）
双击 start-android.bat

# Windows 桌面应用
双击 start-electron.bat
```

#### 方式二：使用命令行（跨平台）

```bash
# Web 平台 - 在浏览器中运行
npm run web
# 访问 http://localhost:8081

# Android 平台 - 在 Android 设备上运行
npm run android

# Windows 桌面 - Electron 应用
npm run electron
# 智能启动：自动检测并复用现有 Web 服务
```

---

## 📦 打包发布

### Windows 应用（.exe）

```bash
npm run electron:build
```

生成文件位于 `dist/` 目录：
- `MultiPlatformApp Setup.exe` - 安装程序
- `MultiPlatformApp.exe` - 绿色版

### Android APK

```bash
# 首次需要配置 EAS Build
npx eas build:configure

# 构建 APK
npx eas build --platform android --profile preview

# 或使用本地构建
npx expo build:android
```

---

## 🛠 技术栈

| 技术 | 版本 | 用途 |
|------|------|------|
| Expo | 54.0.25 | 跨平台框架 |
| React | 19.1.0 | UI 库 |
| React Native | 0.81.5 | 移动端核心 |
| React Native Web | 0.21.2 | Web 平台支持 |
| Electron | 39.2.3 | 桌面应用 |
| TypeScript | 5.9.2 | 类型系统 |
| Metro | 0.81+ | 打包工具 |

---

## 📁 项目结构

```
ExpoMultiPlatformApp/
├── 📱 App.tsx                 # 主应用组件（UI 实现）
├── ⚙️ app.json                # Expo 配置
├── 🖥️ electron.js             # Electron 主进程
├── 🔧 electron-start.js       # 智能启动脚本
├── 📦 package.json            # 依赖和脚本配置
├── 📝 tsconfig.json           # TypeScript 配置
├── 🎨 assets/                 # 资源文件（图标、图片）
├── 📖 docs/                   # 文档目录
│   ├── QUICK_START.md        # 快速启动指南
│   └── PROJECT_SUMMARY.md    # 项目总结
├── 🚀 启动脚本（Windows）
│   ├── start-web.bat         # Web 启动
│   ├── start-android.bat     # Android 启动
│   └── start-electron.bat    # Electron 启动
└── 📄 README.md              # 本文件
```

---

## 🎨 界面预览

应用包含以下模块：

1. **品牌展示区** - Logo 和应用名称
2. **平台信息卡片** - 显示当前运行平台和版本
3. **交互计数器** - 演示状态管理和事件处理
4. **平台支持展示** - 三平台图标展示

<details>
<summary>查看核心代码</summary>

```typescript
// 平台检测示例
const getPlatformName = () => {
  if (Platform.OS === 'web') {
    const userAgent = typeof navigator !== 'undefined' ? navigator.userAgent : '';
    if (userAgent.includes('Electron')) {
      return 'Windows (Electron)';
    }
    return 'Web';
  }
  return Platform.OS.charAt(0).toUpperCase() + Platform.OS.slice(1);
};
```

</details>

---

## 📚 文档

- [📘 快速启动指南 (中文)](./QUICK_START.md) - 详细的启动步骤
- [📘 Quick Start Guide (EN)](./docs/QUICK_START_EN.md) - Detailed setup steps
- [📗 项目总结](./PROJECT_SUMMARY.md) - 技术细节和架构说明
- [📙 使用示例](./docs/USAGE_EXAMPLES.md) - 代码示例和最佳实践
- [📕 模板使用指南](./TEMPLATE_USAGE.md) - 如何基于此模板开发
- [📔 贡献指南](./CONTRIBUTING.md) - 如何参与贡献
- [📓 更新日志](./CHANGELOG.md) - 版本历史

---

## 🔧 常见问题

<details>
<summary><b>Q: 为什么 Electron 窗口显示 "Web" 而不是 "Windows"？</b></summary>

A: 已修复！新版本通过检测 `navigator.userAgent` 正确识别 Electron 环境。刷新页面（F5）即可看到 "Windows (Electron)"。
</details>

<details>
<summary><b>Q: 端口 8081 被占用怎么办？</b></summary>

A: `start-electron.bat` 脚本会智能检测端口状态：
- 如果已有服务运行，直接启动 Electron
- 如果端口空闲，自动启动 Web 服务 + Electron
</details>

<details>
<summary><b>Q: Android 编译失败？</b></summary>

A: 请检查：
1. Android Studio 已安装
2. ANDROID_HOME 环境变量已配置
3. Java JDK 17 已安装
4. 模拟器已启动或真机已连接
</details>

<details>
<summary><b>Q: npm install 报错？</b></summary>

A: 尝试使用：
```bash
npm install --legacy-peer-deps
```
</details>

---

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

1. Fork 本仓库
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启 Pull Request

详见 [贡献指南](./CONTRIBUTING.md)

---

## 📄 许可证

本项目采用 MIT 许可证。详见 [LICENSE](./LICENSE) 文件。

---

## 🌟 Star History

如果这个项目对你有帮助，请给个 ⭐️ 支持一下！

---

## 🔗 相关资源

- [Expo 官方文档](https://docs.expo.dev/)
- [React Native 文档](https://reactnative.dev/)
- [Electron 文档](https://www.electronjs.org/)
- [TypeScript 文档](https://www.typescriptlang.org/)

---

<div align="center">

**使用这个模板创建你的下一个跨平台应用吧！** 🎉

Made with ❤️ by Michael

</div>

