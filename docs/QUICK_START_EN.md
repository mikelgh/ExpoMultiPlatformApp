# 🚀 Quick Start Guide

[English](./QUICK_START_EN.md) | [简体中文](./QUICK_START.md)

---

## Method 1: Using Batch Scripts (Windows Recommended)

### Web Platform
Double-click `start-web.bat`
- Automatically starts Expo Web server
- Browser opens at http://localhost:8081

### Windows Desktop (Electron)
Double-click `start-electron.bat`
- Smart detection: Launches Electron directly if web service is running
- Otherwise: Starts web service + Electron window automatically
- Runs as desktop application

### Android Platform
Double-click `start-android.bat`
- Requires Android emulator or device connected beforehand
- Automatically compiles and installs to device

---

## Method 2: Using Command Line

### 1. Install Dependencies (First Time)
```bash
npm install
```

### 2. Launch Application

#### Web Platform
```bash
npm run web
```

#### Android Platform
```bash
npm run android
```

#### Windows Desktop
```bash
npm run electron
# Smart launch: Auto-detects port 8081 status
# - If web service is running: Launch Electron directly
# - If not running: Start web service and Electron together
```

Or launch Electron only (requires web service running):
```bash
npm run electron:dev
```

---

## 🎯 Test Application Features

After launching, you'll see:

1. **Brand Header** - 🚀 icon and "MultiPlatformApp" title
2. **Platform Info Card** - Shows current platform (Web/Android/Windows)
3. **Interactive Counter** - Test "Click +" and "Reset" buttons
4. **Platform Support Display** - Android 🤖 / Web 🌐 / Windows 🪟

---

## 📦 Build for Production

### Windows Application (.exe)
```bash
npm run electron:build
```
Output: `dist/MultiPlatformApp Setup.exe`

### Android APK
Configure EAS Build:
```bash
npx eas build --platform android --profile preview
```

---

## ⚠️ Troubleshooting

### Q: npm install errors?
A: Try `npm install --legacy-peer-deps`

### Q: Electron window is blank?
A: Wait for web server to fully start before opening Electron

### Q: Android build fails?
A: Check:
- Android Studio is installed
- Emulator/device is connected
- ANDROID_HOME environment variable is set

### Q: Port 8081 already in use?
A: 
- **Electron launch**: New script auto-detects and uses existing service
- **Manual solution**: Close other React Native/Expo projects
- **Alternative**: Run `npm run electron:dev` in another terminal

---

## 📞 Development Tips

1. **First run: Test web platform** - Fastest and simplest
2. **Use hot reload during development** - Auto-refresh on file save
3. **Use Chrome DevTools** - Direct debugging for web platform
4. **Electron dev mode** - Auto-opens developer tools

---

**Happy Coding! 🎉**
