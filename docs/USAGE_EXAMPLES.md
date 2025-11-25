# 📖 使用示例

这个文档展示了如何使用这个模板快速开发你的应用。

## 🎯 基础使用

### 1. 修改应用名称

**修改显示名称**:
```json
// app.json
{
  "expo": {
    "name": "MyAwesomeApp",  // 修改这里
    "slug": "myawesomeapp"
  }
}
```

**修改包名** (Android):
```json
// app.json
{
  "expo": {
    "android": {
      "package": "com.yourcompany.myapp"  // 修改这里
    }
  }
}
```

**修改产品名** (Windows):
```json
// package.json
{
  "build": {
    "productName": "My Awesome App",  // 修改这里
    "appId": "com.yourcompany.myapp"
  }
}
```

### 2. 添加新页面

```typescript
// src/screens/AboutScreen.tsx
import React from 'react';
import { View, Text, StyleSheet } from 'react-native';

export const AboutScreen: React.FC = () => {
  return (
    <View style={styles.container}>
      <Text style={styles.title}>关于我们</Text>
      <Text>这是一个示例页面</Text>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 20,
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
  },
});
```

### 3. 添加导航

安装 React Navigation:
```bash
npm install @react-navigation/native @react-navigation/stack
npx expo install react-native-screens react-native-safe-area-context
```

基础配置:
```typescript
// App.tsx
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';

const Stack = createStackNavigator();

export default function App() {
  return (
    <NavigationContainer>
      <Stack.Navigator>
        <Stack.Screen name="Home" component={HomeScreen} />
        <Stack.Screen name="About" component={AboutScreen} />
      </Stack.Navigator>
    </NavigationContainer>
  );
}
```

## 🎨 样式定制

### 主题颜色

创建主题配置:
```typescript
// src/theme/colors.ts
export const colors = {
  primary: '#007AFF',
  secondary: '#5856D6',
  success: '#34C759',
  danger: '#FF3B30',
  warning: '#FF9500',
  background: '#F5F5F5',
  card: '#FFFFFF',
  text: {
    primary: '#000000',
    secondary: '#666666',
    tertiary: '#999999',
  },
};
```

使用主题:
```typescript
import { colors } from './theme/colors';

const styles = StyleSheet.create({
  button: {
    backgroundColor: colors.primary,
  },
  text: {
    color: colors.text.primary,
  },
});
```

### 响应式设计

```typescript
import { Dimensions, Platform } from 'react-native';

const { width, height } = Dimensions.get('window');

const styles = StyleSheet.create({
  container: {
    width: Platform.select({
      web: Math.min(width, 600),  // Web 最大宽度 600
      default: width,
    }),
  },
});
```

## 🔌 集成常用功能

### 1. 网络请求

安装 axios:
```bash
npm install axios
```

创建 API 服务:
```typescript
// src/services/api.ts
import axios from 'axios';

const api = axios.create({
  baseURL: 'https://api.example.com',
  timeout: 10000,
});

export const fetchData = async () => {
  const response = await api.get('/data');
  return response.data;
};
```

使用:
```typescript
import { fetchData } from './services/api';

const MyComponent = () => {
  const [data, setData] = useState(null);

  useEffect(() => {
    fetchData().then(setData);
  }, []);

  return <View>{/* 渲染数据 */}</View>;
};
```

### 2. 数据持久化

安装 AsyncStorage:
```bash
npx expo install @react-native-async-storage/async-storage
```

使用:
```typescript
import AsyncStorage from '@react-native-async-storage/async-storage';

// 保存
await AsyncStorage.setItem('key', JSON.stringify(value));

// 读取
const value = await AsyncStorage.getItem('key');
const parsed = value ? JSON.parse(value) : null;

// 删除
await AsyncStorage.removeItem('key');
```

### 3. 状态管理 (Zustand)

安装:
```bash
npm install zustand
```

创建 Store:
```typescript
// src/store/useAppStore.ts
import create from 'zustand';

interface AppState {
  count: number;
  increment: () => void;
  decrement: () => void;
}

export const useAppStore = create<AppState>((set) => ({
  count: 0,
  increment: () => set((state) => ({ count: state.count + 1 })),
  decrement: () => set((state) => ({ count: state.count - 1 })),
}));
```

使用:
```typescript
const MyComponent = () => {
  const { count, increment } = useAppStore();
  
  return (
    <View>
      <Text>{count}</Text>
      <Button onPress={increment} title="增加" />
    </View>
  );
};
```

## 🌐 平台特定代码

### 使用 Platform.select

```typescript
import { Platform } from 'react-native';

const styles = StyleSheet.create({
  container: {
    ...Platform.select({
      ios: {
        shadowColor: '#000',
        shadowOffset: { width: 0, height: 2 },
        shadowOpacity: 0.1,
      },
      android: {
        elevation: 4,
      },
      web: {
        boxShadow: '0 2px 8px rgba(0,0,0,0.1)',
      },
    }),
  },
});
```

### 平台特定文件

创建不同平台的文件:
```
src/
  components/
    Button.tsx          # 通用实现
    Button.web.tsx      # Web 特定实现
    Button.android.tsx  # Android 特定实现
```

导入时会自动选择对应平台的文件:
```typescript
import Button from './components/Button';  // 自动选择正确的文件
```

## 📱 Electron 特定功能

### 主进程通信

修改 `electron.js`:
```javascript
const { ipcMain } = require('electron');

// 监听渲染进程消息
ipcMain.on('message-from-renderer', (event, arg) => {
  console.log(arg);
  // 回复渲染进程
  event.reply('message-from-main', 'Hello from main!');
});
```

在 React 组件中:
```typescript
// 需要禁用 contextIsolation 或使用 preload 脚本
const { ipcRenderer } = window.require('electron');

ipcRenderer.send('message-from-renderer', 'Hello!');
ipcRenderer.on('message-from-main', (event, arg) => {
  console.log(arg);
});
```

## 🚀 性能优化

### 1. 图片优化

```typescript
import { Image } from 'react-native';

// 使用 resizeMode
<Image
  source={require('./assets/image.png')}
  resizeMode="cover"
  style={{ width: 200, height: 200 }}
/>

// Web 上使用 Expo Image
import { Image } from 'expo-image';

<Image
  source="https://example.com/image.jpg"
  contentFit="cover"
  transition={1000}
/>
```

### 2. 列表优化

```typescript
import { FlatList } from 'react-native';

<FlatList
  data={items}
  renderItem={({ item }) => <ItemComponent item={item} />}
  keyExtractor={(item) => item.id}
  // 性能优化
  removeClippedSubviews={true}
  maxToRenderPerBatch={10}
  updateCellsBatchingPeriod={50}
  initialNumToRender={10}
  windowSize={10}
/>
```

### 3. 使用 memo 和 useCallback

```typescript
import React, { memo, useCallback } from 'react';

const ExpensiveComponent = memo(({ data, onPress }) => {
  // 组件只在 data 或 onPress 改变时重新渲染
  return <View>...</View>;
});

const ParentComponent = () => {
  const handlePress = useCallback(() => {
    console.log('Pressed');
  }, []);

  return <ExpensiveComponent data={data} onPress={handlePress} />;
};
```

## 📦 打包优化

### Android APK 瘦身

```json
// app.json
{
  "expo": {
    "android": {
      "enableProguardInReleaseBuilds": true,
      "enableShrinkResourcesInReleaseBuilds": true
    }
  }
}
```

### Electron 打包优化

```json
// package.json
{
  "build": {
    "compression": "maximum",
    "files": [
      "dist/**/*",
      "assets/**/*",
      "electron.js",
      "package.json"
    ],
    "extraResources": [
      "assets/**"
    ]
  }
}
```

## 🎓 更多示例

查看完整示例代码:
- [完整应用示例](./examples/full-app)
- [组件库](./examples/components)
- [导航示例](./examples/navigation)
- [状态管理](./examples/state-management)

---

**需要帮助?** 查看 [常见问题](../QUICK_START.md#常见问题) 或提交 [Issue](https://github.com/yourusername/expo-multiplatform-app/issues)
