# 🚀 快速启动指南

[English](./docs/QUICK_START_EN.md) | [简体中文](./QUICK_START.md)

---

## 方式一: 使用批处理脚本 (推荐)

### Web 平台
双击运行 `start-web.bat`
- 自动启动 Expo Web 服务器
- 浏览器访问 http://localhost:8081

### Windows 桌面 (Electron)
双击运行 `start-electron.bat`
- 智能检测：如果 Web 服务已运行则直接启动 Electron
- 否则自动启动 Web 服务器 + Electron 窗口
- 桌面应用形式运行

### Android 平台
双击运行 `start-android.bat`
- 需要提前启动 Android 模拟器或连接真机
- 自动编译并安装到设备

---

## 方式二: 使用命令行

### 1. 安装依赖 (首次运行)
```bash
npm install
```

### 2. 启动应用

#### Web 平台
```bash
npm run web
```

#### Android 平台
```bash
npm run android
```

#### Windows 桌面
```bash
npm run electron
# 智能启动：自动检测 8081 端口状态
# - 如果已有 Web 服务运行：直接启动 Electron
# - 如果未运行：同时启动 Web 服务和 Electron
```

或者仅启动 Electron (需要 Web 服务已运行):
```bash
npm run electron:dev
```

---

## 🎯 测试应用功能

启动应用后,您将看到:

1. **顶部品牌区** - 🚀 图标和 "MultiPlatformApp" 标题
2. **平台信息卡片** - 显示当前运行平台 (Web/Android/Windows)
3. **交互计数器** - 测试 "点击+" 和 "重置" 按钮
4. **平台支持展示** - Android 🤖 / Web 🌐 / Windows 🪟

---

## 📦 打包发布

### Windows 应用 (.exe)
```bash
npm run electron:build
```
生成文件: `dist/MultiPlatformApp Setup.exe`

### Android APK
需要配置 EAS Build:
```bash
npx eas build --platform android --profile preview
```

---

## ⚠️ 常见问题

### Q: npm install 报错?
A: 尝试使用 `npm install --legacy-peer-deps`

### Q: Electron 窗口空白?
A: 等待 Web 服务器完全启动后再打开 Electron

### Q: Android 运行失败?
A: 检查:
- Android Studio 是否安装
- 模拟器/真机是否连接
- ANDROID_HOME 环境变量

### Q: 端口 8081 被占用?
A: 
- **Electron 启动**: 新版脚本会自动检测并使用现有服务
- **手动解决**: 关闭其他 React Native/Expo 项目
- **或者**: 在另一个终端运行 `npm run electron:dev`

---

## 📞 开发建议

1. **首次运行先测试 Web 平台** - 最简单快速
2. **开发时使用热更新** - 保存文件自动刷新
3. **使用 Chrome DevTools** - Web 平台可直接调试
4. **Electron 开发模式** - 自动打开开发者工具

---

**祝您开发愉快! 🎉**
