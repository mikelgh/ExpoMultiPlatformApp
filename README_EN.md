# 🚀 Expo MultiPlatform App Template

<div align="center">

![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)
![Expo](https://img.shields.io/badge/Expo-54.0-000020.svg?logo=expo)
![React](https://img.shields.io/badge/React-19.1-61DAFB.svg?logo=react)
![TypeScript](https://img.shields.io/badge/TypeScript-5.9-3178C6.svg?logo=typescript)
![License](https://img.shields.io/badge/license-MIT-green.svg)

**A truly cross-platform app template - One codebase, three platforms**

[English](./README_EN.md) | [简体中文](./README.md)

[Quick Start](#-quick-start) • [Features](#-features) • [Documentation](#-documentation) • [Contributing](#-contributing)

</div>

---

## 📱 Supported Platforms

<table>
  <tr>
    <th>Platform</th>
    <th>Status</th>
    <th>Description</th>
    <th>Launch Command</th>
  </tr>
  <tr>
    <td>🌐 <b>Web</b></td>
    <td>✅ Supported</td>
    <td>Modern browsers, responsive design</td>
    <td><code>npm run web</code></td>
  </tr>
  <tr>
    <td>🤖 <b>Android</b></td>
    <td>✅ Supported</td>
    <td>Native app, emulator and device support</td>
    <td><code>npm run android</code></td>
  </tr>
  <tr>
    <td>🪟 <b>Windows</b></td>
    <td>✅ Supported</td>
    <td>Electron desktop application</td>
    <td><code>npm run electron</code></td>
  </tr>
</table>

---

## ✨ Features

- 🎯 **Single Codebase** - Write once, run everywhere
- 🔥 **Hot Reload** - Save and see changes instantly
- 🎨 **Modern UI** - Beautiful card-based design
- 🌓 **Platform Detection** - Smart environment recognition
- 📦 **Ready to Use** - Complete configuration, no extra setup
- 🛠 **TypeScript** - Full type support
- 🚀 **Optimized** - Platform-specific launch scripts
- 📚 **Complete Docs** - Comprehensive documentation

---

## 🚀 Quick Start

### Prerequisites

- **Node.js** >= 20.0.0
- **npm** or **yarn**
- **(Optional) Android Studio** - For Android development
- **(Optional) Git** - For version control

### Installation

#### 📦 Clone Repository

**For users in China (Gitee - Faster)**:
```bash
git clone https://gitee.com/mikelgh/expo-multi-platform-app.git
cd expo-multi-platform-app
```

**For international users (GitHub)**:
```bash
git clone https://github.com/mikelgh/ExpoMultiPlatformApp.git
cd ExpoMultiPlatformApp
```

#### 📥 Install Dependencies

```bash
npm install
```

### Running

#### Method 1: Batch Scripts (Windows Recommended)

```bash
# Web Platform
Double-click start-web.bat

# Android Platform (requires emulator or device)
Double-click start-android.bat

# Windows Desktop Application
Double-click start-electron.bat
```

#### Method 2: Command Line (Cross-Platform)

```bash
# Web Platform - Run in browser
npm run web
# Visit http://localhost:8081

# Android Platform - Run on Android device
npm run android

# Windows Desktop - Electron app
npm run electron
# Smart launch: Auto-detects and reuses existing web service
```

---

## 📦 Build for Production

### Windows Application (.exe)

```bash
npm run electron:build
```

Output files in `dist/` directory:
- `MultiPlatformApp Setup.exe` - Installer
- `MultiPlatformApp.exe` - Portable version

### Android APK

```bash
# First time setup for EAS Build
npx eas build:configure

# Build APK
npx eas build --platform android --profile preview

# Or use local build
npx expo build:android
```

---

## 🛠 Tech Stack

| Technology | Version | Purpose |
|------------|---------|---------|
| Expo | 54.0.25 | Cross-platform framework |
| React | 19.1.0 | UI library |
| React Native | 0.81.5 | Mobile core |
| React Native Web | 0.21.2 | Web platform support |
| Electron | 39.2.3 | Desktop application |
| TypeScript | 5.9.2 | Type system |
| Metro | 0.81+ | Bundler |

---

## 📁 Project Structure

```
ExpoMultiPlatformApp/
├── 📱 App.tsx                 # Main app component (UI implementation)
├── ⚙️ app.json                # Expo configuration
├── 🖥️ electron.js             # Electron main process
├── 🔧 electron-start.js       # Smart launch script
├── 📦 package.json            # Dependencies and scripts
├── 📝 tsconfig.json           # TypeScript configuration
├── 🎨 assets/                 # Resources (icons, images)
├── 📖 docs/                   # Documentation
│   ├── QUICK_START.md        # Quick start guide (CN)
│   ├── QUICK_START_EN.md     # Quick start guide (EN)
│   ├── PROJECT_SUMMARY.md    # Project summary (CN)
│   └── USAGE_EXAMPLES.md     # Usage examples (CN)
├── 🚀 Launch Scripts (Windows)
│   ├── start-web.bat         # Web launcher
│   ├── start-android.bat     # Android launcher
│   └── start-electron.bat    # Electron launcher
├── 📄 README.md              # Chinese README
└── 📄 README_EN.md           # This file (English README)
```

---

## 🎨 UI Preview

The app includes:

1. **Brand Display** - Logo and app name
2. **Platform Info Card** - Shows current platform and version
3. **Interactive Counter** - Demonstrates state management
4. **Platform Support Display** - Three platform icons

<details>
<summary>View Core Code</summary>

```typescript
// Platform detection example
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

## 📚 Documentation

- [📘 Quick Start Guide (EN)](./docs/QUICK_START_EN.md) - Detailed setup steps
- [📘 Quick Start Guide (中文)](./docs/QUICK_START.md) - 详细启动步骤
- [📗 Project Summary (中文)](./PROJECT_SUMMARY.md) - Technical details
- [📙 Usage Examples (中文)](./docs/USAGE_EXAMPLES.md) - Code examples
- [📕 Template Usage Guide](./TEMPLATE_USAGE.md) - How to use this template
- [📔 Contributing Guide](./CONTRIBUTING.md) - Contribution guidelines
- [📓 Changelog](./CHANGELOG.md) - Version history

---

## 🔧 FAQ

<details>
<summary><b>Q: Why does Electron window show "Web" instead of "Windows"?</b></summary>

A: Fixed! The new version correctly detects Electron environment via `navigator.userAgent`. Refresh the page (F5) to see "Windows (Electron)".
</details>

<details>
<summary><b>Q: Port 8081 already in use?</b></summary>

A: The `start-electron.bat` script intelligently detects port status:
- If service is running: Launch Electron directly
- If port is free: Start web service + Electron automatically
</details>

<details>
<summary><b>Q: Android build fails?</b></summary>

A: Please check:
1. Android Studio is installed
2. ANDROID_HOME environment variable is set
3. Java JDK 17 is installed
4. Emulator is running or device is connected
</details>

<details>
<summary><b>Q: npm install errors?</b></summary>

A: Try:
```bash
npm install --legacy-peer-deps
```
</details>

---

## 🤝 Contributing

Contributions are welcome! Please see [Contributing Guide](./CONTRIBUTING.md).

1. Fork the repository
2. Create feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open Pull Request

---

## 📄 License

This project is licensed under the MIT License. See [LICENSE](./LICENSE) file for details.

---

## 🌟 Star History

If this project helps you, please give it a ⭐️!

---

## 🔗 Related Resources

- [Expo Official Docs](https://docs.expo.dev/)
- [React Native Docs](https://reactnative.dev/)
- [Electron Docs](https://www.electronjs.org/)
- [TypeScript Docs](https://www.typescriptlang.org/)

---

<div align="center">

**Build your next cross-platform app with this template!** 🎉

Made with ❤️ by Michael

</div>
