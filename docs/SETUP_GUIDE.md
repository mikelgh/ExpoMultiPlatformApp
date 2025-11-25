# ⚙️ 环境配置指南 / Environment Setup Guide

[English](#english-version) | [简体中文](#中文版本)

---

## 中文版本

### 📋 系统要求

| 要求 | 最低版本 | 推荐版本 |
|------|---------|---------|
| Node.js | 18.0.0 | 20.0.0+ |
| npm | 9.0.0 | 10.0.0+ |
| 操作系统 | Windows 10 | Windows 11 |

### 🔧 基础环境配置

#### 1. 安装 Node.js

**Windows:**
```bash
# 访问 https://nodejs.org/
# 下载并安装 LTS 版本

# 验证安装
node --version
npm --version
```

**验证成功输出:**
```
v20.10.0
10.2.3
```

#### 2. 克隆项目

```bash
git clone https://github.com/yourusername/expo-multiplatform-app.git
cd expo-multiplatform-app
```

#### 3. 安装依赖

```bash
npm install

# 如果遇到问题，使用
npm install --legacy-peer-deps
```

### 📱 Android 开发环境

#### 步骤 1: 安装 Java JDK

```bash
# 下载 JDK 17
# https://www.oracle.com/java/technologies/downloads/#java17

# 验证安装
java -version
```

#### 步骤 2: 安装 Android Studio

1. 下载 [Android Studio](https://developer.android.com/studio)
2. 安装时选择包含:
   - Android SDK
   - Android SDK Platform
   - Android Virtual Device

#### 步骤 3: 配置环境变量

**Windows:**
```bash
# 系统属性 > 高级 > 环境变量

# 新建系统变量
ANDROID_HOME=C:\Users\你的用户名\AppData\Local\Android\Sdk

# 添加到 Path
%ANDROID_HOME%\platform-tools
%ANDROID_HOME%\emulator
%ANDROID_HOME%\tools
%ANDROID_HOME%\tools\bin
```

**验证配置:**
```bash
adb --version
```

#### 步骤 4: 创建虚拟设备

1. 打开 Android Studio
2. Tools > Device Manager
3. Create Device
4. 选择设备型号（推荐 Pixel 5）
5. 选择系统镜像（推荐 API 33）
6. 完成创建

#### 步骤 5: 测试运行

```bash
# 启动模拟器
npm run android

# 或手动启动
emulator -avd Pixel_5_API_33
```

### 🪟 Windows 桌面开发（Electron）

Electron 开发不需要额外配置，只需：

```bash
npm run electron
```

**自动化处理:**
- ✅ 智能检测 Web 服务状态
- ✅ 自动启动或复用现有服务
- ✅ 无需手动配置

### 🌐 Web 开发

最简单的平台，无需额外配置：

```bash
npm run web
# 自动在浏览器打开 http://localhost:8081
```

**支持的浏览器:**
- ✅ Chrome 90+
- ✅ Firefox 88+
- ✅ Safari 14+
- ✅ Edge 90+

### 🔍 验证环境配置

运行环境检查脚本：

```bash
# 检查 Node.js 和 npm
node --version && npm --version

# 检查 Android 工具（如果安装了）
adb --version
java -version
echo %ANDROID_HOME%

# 检查依赖
npm list --depth=0
```

### ⚠️ 常见问题

#### 问题 1: npm install 失败
```bash
# 清除缓存
npm cache clean --force
rm -rf node_modules package-lock.json
npm install --legacy-peer-deps
```

#### 问题 2: Android 设备未识别
```bash
# 检查设备连接
adb devices

# 如果为空，尝试重启 adb
adb kill-server
adb start-server
```

#### 问题 3: 端口被占用
```bash
# Windows: 查找占用端口的进程
netstat -ano | findstr :8081

# 结束进程
taskkill /PID <进程ID> /F
```

---

## English Version

### 📋 System Requirements

| Requirement | Minimum | Recommended |
|------------|---------|-------------|
| Node.js | 18.0.0 | 20.0.0+ |
| npm | 9.0.0 | 10.0.0+ |
| OS | Windows 10 | Windows 11 |

### 🔧 Basic Environment Setup

#### 1. Install Node.js

**Windows:**
```bash
# Visit https://nodejs.org/
# Download and install LTS version

# Verify installation
node --version
npm --version
```

**Expected output:**
```
v20.10.0
10.2.3
```

#### 2. Clone Project

```bash
git clone https://github.com/yourusername/expo-multiplatform-app.git
cd expo-multiplatform-app
```

#### 3. Install Dependencies

```bash
npm install

# If errors occur, use
npm install --legacy-peer-deps
```

### 📱 Android Development Environment

#### Step 1: Install Java JDK

```bash
# Download JDK 17
# https://www.oracle.com/java/technologies/downloads/#java17

# Verify installation
java -version
```

#### Step 2: Install Android Studio

1. Download [Android Studio](https://developer.android.com/studio)
2. During installation, include:
   - Android SDK
   - Android SDK Platform
   - Android Virtual Device

#### Step 3: Configure Environment Variables

**Windows:**
```bash
# System Properties > Advanced > Environment Variables

# Create system variable
ANDROID_HOME=C:\Users\YourUsername\AppData\Local\Android\Sdk

# Add to Path
%ANDROID_HOME%\platform-tools
%ANDROID_HOME%\emulator
%ANDROID_HOME%\tools
%ANDROID_HOME%\tools\bin
```

**Verify configuration:**
```bash
adb --version
```

#### Step 4: Create Virtual Device

1. Open Android Studio
2. Tools > Device Manager
3. Create Device
4. Select device model (Recommended: Pixel 5)
5. Select system image (Recommended: API 33)
6. Complete setup

#### Step 5: Test Run

```bash
# Launch emulator
npm run android

# Or manually start
emulator -avd Pixel_5_API_33
```

### 🪟 Windows Desktop Development (Electron)

No additional configuration needed for Electron:

```bash
npm run electron
```

**Automated handling:**
- ✅ Smart web service detection
- ✅ Auto-start or reuse existing service
- ✅ No manual configuration required

### 🌐 Web Development

Simplest platform, no extra setup:

```bash
npm run web
# Automatically opens http://localhost:8081 in browser
```

**Supported browsers:**
- ✅ Chrome 90+
- ✅ Firefox 88+
- ✅ Safari 14+
- ✅ Edge 90+

### 🔍 Verify Environment

Run environment check:

```bash
# Check Node.js and npm
node --version && npm --version

# Check Android tools (if installed)
adb --version
java -version
echo %ANDROID_HOME%

# Check dependencies
npm list --depth=0
```

### ⚠️ Common Issues

#### Issue 1: npm install fails
```bash
# Clear cache
npm cache clean --force
rm -rf node_modules package-lock.json
npm install --legacy-peer-deps
```

#### Issue 2: Android device not recognized
```bash
# Check device connection
adb devices

# If empty, try restarting adb
adb kill-server
adb start-server
```

#### Issue 3: Port already in use
```bash
# Windows: Find process using port
netstat -ano | findstr :8081

# Kill process
taskkill /PID <ProcessID> /F
```

---

## 📞 需要帮助？/ Need Help?

- 📖 [完整文档](../README.md) / [Full Documentation](../README_EN.md)
- ❓ [常见问题](./FAQ.md) / [FAQ](./FAQ.md)
- 🐛 [提交 Issue](https://github.com/yourusername/expo-multiplatform-app/issues)

---

**配置完成后，开始你的开发之旅！/ Ready to start developing!** 🚀
