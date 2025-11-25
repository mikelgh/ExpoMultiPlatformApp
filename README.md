# MultiPlatformApp - 跨平台应用模板

基于 Expo 的跨平台应用,支持 Android、Web 和 Windows (Electron) 三个平台。

## 📱 支持的平台

- ✅ **Android** - 原生移动应用
- ✅ **Web** - 浏览器应用
- ✅ **Windows** - Electron 桌面应用

## 🚀 快速开始

### 安装依赖

```bash
npm install
```

### 运行开发环境

#### 1. Web 平台
```bash
npm run web
```
访问 http://localhost:8081

#### 2. Android 平台
```bash
npm run android
```
需要提前配置 Android Studio 和模拟器/真机

#### 3. Windows 桌面 (Electron)
```bash
npm run electron
```
这会同时启动 Expo Web 服务器和 Electron 窗口

### 单独启动 Electron (需要先手动启动 Web)
```bash
# 终端 1: 启动 Web 服务器
npm run web

# 终端 2: 启动 Electron
npm run electron:dev
```

## 📦 打包发布

### Windows 应用打包
```bash
# 先构建 Web 版本
npm run web

# 打包 Electron 应用
npm run electron:build
```

打包后的文件在 `dist` 目录下。

### Android APK 打包
```bash
# 使用 EAS Build
npx eas build --platform android
```

## 🛠 技术栈

- **Expo SDK 54** - React Native 开发框架
- **React 19** - UI 框架
- **TypeScript** - 类型安全
- **React Native Web** - Web 平台支持
- **Electron** - Windows 桌面应用
- **Metro Bundler** - 移动端打包工具

## 📁 项目结构

```
ExpoMultiPlatformApp/
├── App.tsx              # 主应用组件
├── app.json             # Expo 配置
├── electron.js          # Electron 主进程
├── package.json         # 依赖和脚本
├── tsconfig.json        # TypeScript 配置
└── assets/              # 资源文件
```

## 🎨 功能特性

1. **跨平台兼容** - 单一代码库支持多平台
2. **平台检测** - 自动识别当前运行平台
3. **交互演示** - 点击计数器示例
4. **现代 UI** - 简约卡片式设计
5. **响应式布局** - 适配不同屏幕尺寸

## 📝 开发注意事项

### Electron 开发
- 确保 Web 服务器运行在 `http://localhost:8081`
- 如需修改端口,同步更新 `electron.js` 中的 `startUrl`

### Android 开发
- 需要安装 Android Studio
- 配置 ANDROID_HOME 环境变量
- 启动模拟器或连接真机

### Web 开发
- 支持热更新
- 浏览器访问 http://localhost:8081
- 可在任何现代浏览器中运行

## 🔧 常见问题

### Q: Electron 窗口空白?
A: 检查 Expo Web 服务器是否正常运行在 8081 端口

### Q: Android 编译失败?
A: 检查 Java 和 Android SDK 版本是否符合要求

### Q: 如何修改应用名称?
A: 修改 `app.json` 中的 `name` 和 `package.json` 中的 `productName`

## 📄 许可证

MIT License

---

**Happy Coding! 🎉**
