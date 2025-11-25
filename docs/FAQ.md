# ❓ 常见问题 / Frequently Asked Questions

[English](#english) | [简体中文](#简体中文)

---

## 简体中文

### 📱 平台相关

#### Q: 为什么 Electron 窗口显示 "Web" 而不是 "Windows (Electron)"？
**A:** 已修复！新版本通过检测 `navigator.userAgent` 正确识别 Electron 环境。
- **解决方法**: 按 `F5` 或 `Ctrl+R` 刷新页面即可看到 "Windows (Electron)"

#### Q: 如何在不同平台上测试应用？
**A:** 
```bash
# Web - 最快速，推荐先测试
npm run web

# Android - 需要模拟器或真机
npm run android

# Electron - 桌面应用
npm run electron
```

---

### 🔧 安装和配置

#### Q: npm install 报错怎么办？
**A:** 尝试以下方法：
```bash
# 方法 1: 使用 legacy peer deps
npm install --legacy-peer-deps

# 方法 2: 清除缓存后重装
npm cache clean --force
rm -rf node_modules package-lock.json
npm install

# 方法 3: 使用 yarn
yarn install
```

#### Q: 端口 8081 被占用？
**A:** 
- **自动处理**: `start-electron.bat` 脚本会自动检测并复用现有服务
- **手动解决**: 关闭其他 Expo/React Native 项目
- **更改端口**: 修改 `electron.js` 中的端口号

#### Q: 如何配置 Android 开发环境？
**A:** 
1. 安装 [Android Studio](https://developer.android.com/studio)
2. 安装 Android SDK (API 33 或更高)
3. 设置环境变量:
   ```bash
   # Windows
   ANDROID_HOME=C:\Users\YourName\AppData\Local\Android\Sdk
   
   # macOS/Linux
   export ANDROID_HOME=$HOME/Library/Android/sdk
   ```
4. 添加到 PATH:
   - `%ANDROID_HOME%\platform-tools`
   - `%ANDROID_HOME%\emulator`

---

### 🐛 常见错误

#### Q: "Incompatible React versions" 错误
**A:** React 和 react-dom 版本不匹配
```json
// package.json - 确保版本一致
{
  "react": "19.1.0",
  "react-dom": "19.1.0"
}
```

#### Q: Electron 窗口空白
**A:** 
1. 确保 Web 服务正在运行 (http://localhost:8081)
2. 检查 `electron.js` 中的 `startUrl` 配置
3. 打开开发者工具 (F12) 查看错误

#### Q: Android 编译失败
**A:** 检查以下项：
- [ ] Android Studio 已安装
- [ ] ANDROID_HOME 环境变量已设置
- [ ] Java JDK 17 已安装
- [ ] 模拟器已启动或设备已连接
- [ ] 运行 `adb devices` 确认设备连接

---

### 📦 打包发布

#### Q: 如何打包 Windows 应用？
**A:** 
```bash
npm run electron:build
# 输出: dist/MultiPlatformApp Setup.exe
```

#### Q: 如何打包 Android APK？
**A:** 
```bash
# 使用 EAS Build (推荐)
npx eas build:configure
npx eas build --platform android --profile preview

# 或本地构建
npx expo build:android
```

#### Q: 打包后的应用体积很大？
**A:** 优化建议：
1. 启用 ProGuard (Android)
2. 使用 `compression: "maximum"` (Electron)
3. 移除未使用的依赖
4. 压缩图片资源

---

### 🎨 开发相关

#### Q: 如何添加新页面？
**A:** 
```typescript
// src/screens/NewScreen.tsx
import React from 'react';
import { View, Text } from 'react-native';

export const NewScreen = () => {
  return (
    <View>
      <Text>新页面</Text>
    </View>
  );
};
```

#### Q: 如何修改应用名称和图标？
**A:** 
1. **名称**: 修改 `app.json` 中的 `name`
2. **图标**: 替换 `assets/` 目录下的图标文件
3. **包名**: 修改 `app.json` 中的 `android.package`

#### Q: 如何调试应用？
**A:** 
- **Web**: Chrome DevTools (F12)
- **Android**: React Native Debugger / Chrome DevTools
- **Electron**: 内置 DevTools (F12)

---

## English

### 📱 Platform Related

#### Q: Why does Electron window show "Web" instead of "Windows (Electron)"?
**A:** Fixed! New version correctly detects Electron via `navigator.userAgent`.
- **Solution**: Press `F5` or `Ctrl+R` to refresh the page

#### Q: How to test on different platforms?
**A:** 
```bash
# Web - Fastest, recommended first
npm run web

# Android - Requires emulator or device
npm run android

# Electron - Desktop app
npm run electron
```

---

### 🔧 Installation & Configuration

#### Q: npm install errors?
**A:** Try these methods:
```bash
# Method 1: Use legacy peer deps
npm install --legacy-peer-deps

# Method 2: Clear cache and reinstall
npm cache clean --force
rm -rf node_modules package-lock.json
npm install

# Method 3: Use yarn
yarn install
```

#### Q: Port 8081 already in use?
**A:** 
- **Auto-handled**: `start-electron.bat` auto-detects and reuses existing service
- **Manual**: Close other Expo/React Native projects
- **Change port**: Modify port number in `electron.js`

#### Q: How to setup Android development?
**A:** 
1. Install [Android Studio](https://developer.android.com/studio)
2. Install Android SDK (API 33 or higher)
3. Set environment variables:
   ```bash
   # Windows
   ANDROID_HOME=C:\Users\YourName\AppData\Local\Android\Sdk
   
   # macOS/Linux
   export ANDROID_HOME=$HOME/Library/Android/sdk
   ```
4. Add to PATH:
   - `%ANDROID_HOME%\platform-tools`
   - `%ANDROID_HOME%\emulator`

---

### 🐛 Common Errors

#### Q: "Incompatible React versions" error
**A:** React and react-dom version mismatch
```json
// package.json - Ensure same versions
{
  "react": "19.1.0",
  "react-dom": "19.1.0"
}
```

#### Q: Electron window is blank
**A:** 
1. Ensure web service is running (http://localhost:8081)
2. Check `startUrl` configuration in `electron.js`
3. Open DevTools (F12) to check errors

#### Q: Android build fails
**A:** Checklist:
- [ ] Android Studio installed
- [ ] ANDROID_HOME environment variable set
- [ ] Java JDK 17 installed
- [ ] Emulator running or device connected
- [ ] Run `adb devices` to verify connection

---

### 📦 Building & Distribution

#### Q: How to build Windows app?
**A:** 
```bash
npm run electron:build
# Output: dist/MultiPlatformApp Setup.exe
```

#### Q: How to build Android APK?
**A:** 
```bash
# Using EAS Build (recommended)
npx eas build:configure
npx eas build --platform android --profile preview

# Or local build
npx expo build:android
```

#### Q: Built app size is too large?
**A:** Optimization tips:
1. Enable ProGuard (Android)
2. Use `compression: "maximum"` (Electron)
3. Remove unused dependencies
4. Compress image assets

---

### 🎨 Development

#### Q: How to add a new screen?
**A:** 
```typescript
// src/screens/NewScreen.tsx
import React from 'react';
import { View, Text } from 'react-native';

export const NewScreen = () => {
  return (
    <View>
      <Text>New Screen</Text>
    </View>
  );
};
```

#### Q: How to change app name and icon?
**A:** 
1. **Name**: Modify `name` in `app.json`
2. **Icon**: Replace icon files in `assets/`
3. **Package**: Modify `android.package` in `app.json`

#### Q: How to debug the app?
**A:** 
- **Web**: Chrome DevTools (F12)
- **Android**: React Native Debugger / Chrome DevTools
- **Electron**: Built-in DevTools (F12)

---

## 💡 更多帮助 / Need More Help?

- 📖 查看 [完整文档](../README.md) / Check [Full Documentation](../README_EN.md)
- 🐛 提交 [Issue](https://github.com/yourusername/expo-multiplatform-app/issues)
- 💬 加入 [讨论](https://github.com/yourusername/expo-multiplatform-app/discussions)
- 📧 联系我们 / Contact: your.email@example.com

---

**找不到答案？欢迎提问！/ Can't find an answer? Feel free to ask!** 🤗
