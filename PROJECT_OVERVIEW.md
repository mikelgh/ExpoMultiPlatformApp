# 📊 项目总览 / Project Overview

[English](#english) | [简体中文](#简体中文)

---

## 简体中文

### 🎯 项目简介

**Expo MultiPlatform App Template** 是一个开箱即用的跨平台应用模板，真正实现"一次编写，处处运行"。基于 Expo 和 React Native 构建，支持 Web、Android 和 Windows (Electron) 三个平台。

### ✨ 核心特性

- ✅ **完整的跨平台支持** - Web / Android / Windows
- ✅ **智能启动系统** - 自动检测和管理服务
- ✅ **双语文档** - 中英文完整对照
- ✅ **TypeScript 支持** - 完整的类型安全
- ✅ **现代化 UI** - 精美的界面设计
- ✅ **GitHub 模板** - Issue/PR 模板完备
- ✅ **MIT 许可** - 自由使用和修改

### 📂 项目结构

```
ExpoMultiPlatformApp/
├── 📱 核心代码
│   ├── App.tsx                 # 主应用组件
│   ├── app.json               # Expo 配置
│   ├── electron.js            # Electron 主进程
│   ├── electron-start.js      # 智能启动脚本
│   └── index.ts               # 应用入口
│
├── 📚 文档系统
│   ├── README.md              # 中文主文档
│   ├── README_EN.md           # 英文主文档
│   ├── QUICK_START.md         # 快速启动（中文）
│   ├── PROJECT_SUMMARY.md     # 项目技术总结
│   ├── TEMPLATE_USAGE.md      # 模板使用指南
│   ├── CONTRIBUTING.md        # 贡献指南
│   ├── CHANGELOG.md           # 更新日志
│   ├── LICENSE                # MIT 许可证
│   └── docs/
│       ├── QUICK_START_EN.md  # 快速启动（英文）
│       ├── FAQ.md             # 常见问题（双语）
│       ├── SETUP_GUIDE.md     # 环境配置（双语）
│       └── USAGE_EXAMPLES.md  # 使用示例
│
├── 🎨 资源文件
│   └── assets/
│       ├── icon.png           # 应用图标
│       ├── splash-icon.png    # 启动画面
│       ├── adaptive-icon.png  # Android 自适应图标
│       └── favicon.png        # Web 图标
│
├── 🚀 启动脚本（Windows）
│   ├── start-web.bat          # Web 平台启动
│   ├── start-android.bat      # Android 平台启动
│   └── start-electron.bat     # Electron 智能启动
│
├── ⚙️ 配置文件
│   ├── package.json           # 项目配置和依赖
│   ├── tsconfig.json          # TypeScript 配置
│   ├── .gitignore             # Git 忽略规则
│   ├── .gitattributes         # Git 属性配置
│   └── .editorconfig          # 编辑器配置
│
└── 🐙 GitHub 配置
    └── .github/
        ├── ISSUE_TEMPLATE/
        │   ├── bug_report.md      # Bug 报告模板
        │   └── feature_request.md # 功能请求模板
        └── PULL_REQUEST_TEMPLATE.md # PR 模板
```

### 📊 项目统计

| 指标 | 数值 |
|------|------|
| 总文件数 | 40+ |
| 代码行数 | 10,000+ |
| 文档文件 | 15+ |
| 支持语言 | 中文 / English |
| 支持平台 | 3 个 |
| 开源许可 | MIT |

### 🛠 技术栈

**核心框架**:
- Expo 54.0.25
- React 19.1.0
- React Native 0.81.5
- TypeScript 5.9.2

**平台支持**:
- React Native Web 0.21.2 (Web)
- Electron 39.2.3 (Windows)
- Expo Android (Android)

**开发工具**:
- Metro Bundler (打包)
- Electron Builder (桌面应用打包)
- EAS Build (移动应用构建)

### 📖 文档清单

#### 用户文档
- [x] README.md - 中文主文档
- [x] README_EN.md - 英文主文档
- [x] QUICK_START.md - 快速启动指南（中文）
- [x] QUICK_START_EN.md - 快速启动指南（英文）
- [x] FAQ.md - 常见问题（双语）
- [x] SETUP_GUIDE.md - 环境配置指南（双语）

#### 开发文档
- [x] PROJECT_SUMMARY.md - 项目技术总结
- [x] USAGE_EXAMPLES.md - 使用示例
- [x] TEMPLATE_USAGE.md - 模板使用指南
- [x] CONTRIBUTING.md - 贡献指南
- [x] CHANGELOG.md - 更新日志

#### GitHub 模板
- [x] Bug Report 模板
- [x] Feature Request 模板
- [x] Pull Request 模板

### 🎯 使用场景

1. **快速原型开发** - 快速搭建跨平台应用原型
2. **学习跨平台开发** - 完整的示例代码和文档
3. **企业应用开发** - 稳定可靠的技术栈
4. **个人项目** - MIT 许可，自由使用

### 🚀 快速开始

```bash
# 1. 克隆项目
git clone https://github.com/yourusername/expo-multiplatform-app.git
cd expo-multiplatform-app

# 2. 安装依赖
npm install

# 3. 启动应用
npm run web      # Web 平台
npm run android  # Android 平台
npm run electron # Windows 桌面
```

### 📦 打包发布

```bash
# Windows 应用
npm run electron:build

# Android APK
npx eas build --platform android
```

### 🤝 参与贡献

欢迎提交 Issue 和 Pull Request！详见 [贡献指南](./CONTRIBUTING.md)。

### 📄 许可证

MIT License - 自由使用和修改

---

## English

### 🎯 Project Introduction

**Expo MultiPlatform App Template** is a production-ready cross-platform application template that truly achieves "write once, run anywhere". Built on Expo and React Native, it supports three platforms: Web, Android, and Windows (Electron).

### ✨ Core Features

- ✅ **Complete Cross-Platform Support** - Web / Android / Windows
- ✅ **Smart Launch System** - Auto-detect and manage services
- ✅ **Bilingual Documentation** - Full Chinese and English
- ✅ **TypeScript Support** - Complete type safety
- ✅ **Modern UI** - Beautiful interface design
- ✅ **GitHub Templates** - Complete Issue/PR templates
- ✅ **MIT License** - Free to use and modify

### 📂 Project Structure

```
ExpoMultiPlatformApp/
├── 📱 Core Code
│   ├── App.tsx                 # Main app component
│   ├── app.json               # Expo configuration
│   ├── electron.js            # Electron main process
│   ├── electron-start.js      # Smart launch script
│   └── index.ts               # App entry point
│
├── 📚 Documentation System
│   ├── README.md              # Chinese main docs
│   ├── README_EN.md           # English main docs
│   ├── QUICK_START.md         # Quick start (Chinese)
│   ├── PROJECT_SUMMARY.md     # Technical summary
│   ├── TEMPLATE_USAGE.md      # Template usage guide
│   ├── CONTRIBUTING.md        # Contributing guide
│   ├── CHANGELOG.md           # Changelog
│   ├── LICENSE                # MIT License
│   └── docs/
│       ├── QUICK_START_EN.md  # Quick start (English)
│       ├── FAQ.md             # FAQ (Bilingual)
│       ├── SETUP_GUIDE.md     # Setup guide (Bilingual)
│       └── USAGE_EXAMPLES.md  # Usage examples
│
├── 🎨 Assets
│   └── assets/
│       ├── icon.png           # App icon
│       ├── splash-icon.png    # Splash screen
│       ├── adaptive-icon.png  # Android adaptive icon
│       └── favicon.png        # Web icon
│
├── 🚀 Launch Scripts (Windows)
│   ├── start-web.bat          # Web launcher
│   ├── start-android.bat      # Android launcher
│   └── start-electron.bat     # Electron smart launcher
│
├── ⚙️ Configuration
│   ├── package.json           # Project config & deps
│   ├── tsconfig.json          # TypeScript config
│   ├── .gitignore             # Git ignore rules
│   ├── .gitattributes         # Git attributes
│   └── .editorconfig          # Editor config
│
└── 🐙 GitHub Config
    └── .github/
        ├── ISSUE_TEMPLATE/
        │   ├── bug_report.md      # Bug report template
        │   └── feature_request.md # Feature request template
        └── PULL_REQUEST_TEMPLATE.md # PR template
```

### 📊 Project Statistics

| Metric | Value |
|--------|-------|
| Total Files | 40+ |
| Lines of Code | 10,000+ |
| Documentation | 15+ |
| Languages | Chinese / English |
| Platforms | 3 |
| License | MIT |

### 🛠 Tech Stack

**Core Framework**:
- Expo 54.0.25
- React 19.1.0
- React Native 0.81.5
- TypeScript 5.9.2

**Platform Support**:
- React Native Web 0.21.2 (Web)
- Electron 39.2.3 (Windows)
- Expo Android (Android)

**Dev Tools**:
- Metro Bundler (Bundling)
- Electron Builder (Desktop packaging)
- EAS Build (Mobile builds)

### 📖 Documentation Checklist

#### User Documentation
- [x] README.md - Chinese main docs
- [x] README_EN.md - English main docs
- [x] QUICK_START.md - Quick start (Chinese)
- [x] QUICK_START_EN.md - Quick start (English)
- [x] FAQ.md - FAQ (Bilingual)
- [x] SETUP_GUIDE.md - Setup guide (Bilingual)

#### Developer Documentation
- [x] PROJECT_SUMMARY.md - Technical summary
- [x] USAGE_EXAMPLES.md - Usage examples
- [x] TEMPLATE_USAGE.md - Template usage guide
- [x] CONTRIBUTING.md - Contributing guide
- [x] CHANGELOG.md - Changelog

#### GitHub Templates
- [x] Bug Report Template
- [x] Feature Request Template
- [x] Pull Request Template

### 🎯 Use Cases

1. **Rapid Prototyping** - Quickly build cross-platform prototypes
2. **Learning** - Complete examples and documentation
3. **Enterprise Apps** - Stable and reliable tech stack
4. **Personal Projects** - MIT licensed, free to use

### 🚀 Quick Start

```bash
# 1. Clone project
git clone https://github.com/yourusername/expo-multiplatform-app.git
cd expo-multiplatform-app

# 2. Install dependencies
npm install

# 3. Launch app
npm run web      # Web platform
npm run android  # Android platform
npm run electron # Windows desktop
```

### 📦 Build for Production

```bash
# Windows app
npm run electron:build

# Android APK
npx eas build --platform android
```

### 🤝 Contributing

Contributions welcome! See [Contributing Guide](./CONTRIBUTING.md).

### 📄 License

MIT License - Free to use and modify

---

<div align="center">

**⭐ 如果这个项目对你有帮助，请给个 Star！**

**⭐ If this project helps you, please give it a Star!**

Made with ❤️ by Community

</div>
