# 🎯 如何使用这个模板

这个文档专门为想要**基于此模板创建新项目**的开发者准备。

## 🚀 快速开始

### 方法 1: 使用 GitHub Template (推荐)

1. 点击 GitHub 仓库页面右上角的 **"Use this template"** 按钮
2. 输入你的新项目名称
3. 克隆你的新仓库:
   ```bash
   git clone https://github.com/yourusername/your-new-project.git
   cd your-new-project
   npm install
   ```

### 方法 2: 手动克隆

```bash
# 克隆模板
git clone https://github.com/yourusername/expo-multiplatform-app.git my-new-app
cd my-new-app

# 删除原有 git 历史
rm -rf .git

# 初始化新的 git 仓库
git init
git add .
git commit -m "Initial commit from template"

# 安装依赖
npm install
```

## 📝 定制你的应用

### 1. 修改应用信息

#### package.json
```json
{
  "name": "your-app-name",
  "version": "1.0.0",
  "description": "Your app description",
  "author": "Your Name <your.email@example.com>",
  "repository": {
    "type": "git",
    "url": "https://github.com/yourusername/your-app.git"
  },
  "bugs": {
    "url": "https://github.com/yourusername/your-app/issues"
  },
  "homepage": "https://github.com/yourusername/your-app#readme"
}
```

#### app.json
```json
{
  "expo": {
    "name": "YourAppName",
    "slug": "your-app-name",
    "version": "1.0.0",
    "android": {
      "package": "com.yourcompany.yourapp"
    }
  }
}
```

#### electron.js (Electron 配置)
```javascript
const { app, BrowserWindow } = require('electron');

// 修改窗口标题和尺寸
mainWindow = new BrowserWindow({
  title: 'Your App Name',  // 修改窗口标题
  width: 1200,
  height: 800,
  // ...
});
```

### 2. 替换图标和启动画面

替换以下文件:
```
assets/
  ├── icon.png           # 应用图标 (1024x1024)
  ├── splash-icon.png    # 启动画面 (适配不同尺寸)
  ├── adaptive-icon.png  # Android 自适应图标 (1024x1024)
  └── favicon.png        # Web 网站图标 (48x48 或更大)
```

**图标生成工具**:
- [App Icon Generator](https://www.appicon.co/)
- [Expo Asset Generator](https://github.com/expo/expo-cli/tree/main/packages/expo-cli/src/commands/utils/createIconsAsync.ts)

### 3. 修改启动脚本名称

如果你修改了应用名称,可以重命名批处理脚本:
```
start-web.bat       → your-app-web.bat
start-android.bat   → your-app-android.bat
start-electron.bat  → your-app-electron.bat
```

并在脚本中修改显示的应用名称。

### 4. 清理模板内容

删除或修改这些模板文件:
```bash
# 删除模板说明
rm TEMPLATE_USAGE.md

# 根据需要修改文档
# README.md
# QUICK_START.md
# PROJECT_SUMMARY.md
```

## 🎨 开始开发

### 组织项目结构

推荐的目录结构:
```
your-app/
├── src/
│   ├── components/      # 可复用组件
│   │   ├── Button.tsx
│   │   └── Card.tsx
│   ├── screens/         # 页面组件
│   │   ├── HomeScreen.tsx
│   │   └── AboutScreen.tsx
│   ├── navigation/      # 导航配置
│   │   └── AppNavigator.tsx
│   ├── services/        # API 服务
│   │   └── api.ts
│   ├── store/          # 状态管理
│   │   └── useStore.ts
│   ├── utils/          # 工具函数
│   │   └── helpers.ts
│   ├── theme/          # 主题配置
│   │   ├── colors.ts
│   │   └── fonts.ts
│   └── types/          # TypeScript 类型
│       └── index.ts
├── assets/             # 静态资源
├── App.tsx            # 应用入口
└── package.json
```

### 修改 App.tsx

用你的应用逻辑替换模板代码:

```typescript
// App.tsx
import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { AppNavigator } from './src/navigation/AppNavigator';

export default function App() {
  return (
    <NavigationContainer>
      <AppNavigator />
    </NavigationContainer>
  );
}
```

## 📦 添加依赖

### 常用依赖推荐

```bash
# 导航
npm install @react-navigation/native @react-navigation/stack
npx expo install react-native-screens react-native-safe-area-context

# 状态管理
npm install zustand

# 网络请求
npm install axios

# 数据持久化
npx expo install @react-native-async-storage/async-storage

# 图标
npx expo install @expo/vector-icons

# 表单验证
npm install react-hook-form zod @hookform/resolvers

# UI 组件库 (可选)
npm install react-native-paper
# 或
npm install @rneui/themed @rneui/base
```

## 🔧 环境变量

创建环境变量文件:

```bash
# .env
API_URL=https://api.example.com
APP_NAME=YourApp
```

安装环境变量支持:
```bash
npm install react-native-dotenv
```

配置 babel.config.js:
```javascript
module.exports = function(api) {
  api.cache(true);
  return {
    presets: ['babel-preset-expo'],
    plugins: [
      ['module:react-native-dotenv', {
        moduleName: '@env',
        path: '.env',
      }]
    ]
  };
};
```

使用:
```typescript
import { API_URL } from '@env';
console.log(API_URL);
```

## 🎯 开发工作流

### 日常开发流程

1. **启动开发服务器**
   ```bash
   # Web 开发 (最快)
   npm run web
   
   # Android 开发
   npm run android
   
   # Electron 开发
   npm run electron
   ```

2. **编写代码**
   - 保存文件自动热更新
   - 在浏览器中快速测试
   - 必要时在真机上验证

3. **调试**
   - **Web**: Chrome DevTools
   - **Android**: React Native Debugger
   - **Electron**: 内置 DevTools (F12)

4. **测试**
   - 手动测试所有平台
   - 添加单元测试 (可选)

5. **提交代码**
   ```bash
   git add .
   git commit -m "feat: add new feature"
   git push
   ```

### 发布流程

1. **更新版本号**
   ```bash
   # 修改 package.json 和 app.json 中的 version
   ```

2. **打包各平台**
   ```bash
   # Android
   npx eas build --platform android
   
   # Windows
   npm run electron:build
   ```

3. **测试打包后的应用**

4. **发布**
   - Android: 上传到 Google Play
   - Windows: 发布到网站或 Microsoft Store
   - Web: 部署到服务器

## 📚 学习资源

### 官方文档
- [Expo Documentation](https://docs.expo.dev/)
- [React Native Documentation](https://reactnative.dev/)
- [React Navigation](https://reactnavigation.org/)
- [Electron Documentation](https://www.electronjs.org/docs)

### 推荐教程
- [React Native Express](https://www.reactnative.express/)
- [Expo YouTube Channel](https://www.youtube.com/@expo)
- [React Native School](https://www.reactnativeschool.com/)

### 社区支持
- [Expo Forums](https://forums.expo.dev/)
- [React Native Community](https://www.reactnative.dev/community/overview)
- [Stack Overflow](https://stackoverflow.com/questions/tagged/expo)

## 💡 最佳实践

1. **代码组织**
   - 按功能而非类型组织文件
   - 保持组件小而专注
   - 使用 TypeScript 获得更好的类型安全

2. **性能**
   - 使用 `React.memo` 避免不必要的重渲染
   - 图片使用适当的尺寸
   - 使用 FlatList 渲染长列表

3. **安全**
   - 不要在代码中硬编码敏感信息
   - 使用环境变量
   - 定期更新依赖

4. **版本控制**
   - 频繁提交小的更改
   - 写清晰的提交信息
   - 使用分支开发新功能

## 🆘 获取帮助

遇到问题时:

1. 检查 [QUICK_START.md](./QUICK_START.md) 中的常见问题
2. 搜索 [Issues](https://github.com/yourusername/expo-multiplatform-app/issues)
3. 创建新 Issue 并提供详细信息
4. 加入社区讨论

## 🎉 下一步

现在你已经准备好开始开发了！

1. ✅ 定制应用信息
2. ✅ 替换图标和资源
3. ✅ 组织项目结构
4. ✅ 开始编写功能
5. ✅ 定期测试各平台
6. ✅ 打包发布

**祝你开发顺利！** 🚀

---

如果这个模板对你有帮助，请给个 ⭐️ 并分享给其他开发者！
