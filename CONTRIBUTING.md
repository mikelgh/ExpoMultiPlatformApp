# 🤝 贡献指南

感谢你考虑为 Expo MultiPlatform App Template 做出贡献！

## 📋 贡献方式

### 报告 Bug

1. 在 [Issues](https://github.com/yourusername/expo-multiplatform-app/issues) 页面搜索是否已有相似问题
2. 如果没有，创建新 Issue 并提供：
   - 清晰的标题
   - 详细的问题描述
   - 复现步骤
   - 预期行为 vs 实际行为
   - 环境信息（操作系统、Node 版本等）
   - 错误截图或日志

### 提出新功能

1. 先在 Issues 中讨论你的想法
2. 等待维护者反馈
3. 获得批准后再开始实现

### 提交 Pull Request

1. **Fork 仓库**
   ```bash
   git clone https://github.com/yourusername/expo-multiplatform-app.git
   cd expo-multiplatform-app
   ```

2. **创建特性分支**
   ```bash
   git checkout -b feature/your-feature-name
   # 或
   git checkout -b fix/your-bug-fix
   ```

3. **进行开发**
   - 遵循现有代码风格
   - 保持提交信息清晰
   - 添加必要的注释
   - 更新相关文档

4. **测试你的更改**
   ```bash
   # Web 平台
   npm run web
   
   # Android 平台
   npm run android
   
   # Electron 平台
   npm run electron
   ```

5. **提交更改**
   ```bash
   git add .
   git commit -m "feat: add some amazing feature"
   ```

6. **推送到你的 Fork**
   ```bash
   git push origin feature/your-feature-name
   ```

7. **创建 Pull Request**
   - 在 GitHub 上点击 "New Pull Request"
   - 填写 PR 模板
   - 等待 Code Review

## 📝 提交信息规范

使用 [Conventional Commits](https://www.conventionalcommits.org/) 格式：

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Type 类型

- `feat`: 新功能
- `fix`: Bug 修复
- `docs`: 文档更新
- `style`: 代码格式调整
- `refactor`: 重构
- `perf`: 性能优化
- `test`: 测试相关
- `chore`: 构建/工具相关

### 示例

```bash
feat(android): add splash screen animation
fix(electron): resolve window close issue on Windows
docs(readme): update installation instructions
style(app): format code with prettier
```

## 🎨 代码风格

### TypeScript

- 使用 TypeScript 严格模式
- 为所有函数添加类型注解
- 避免使用 `any`
- 使用有意义的变量名

```typescript
// ✅ Good
const getPlatformName = (): string => {
  // ...
}

// ❌ Bad
const getPlat = (): any => {
  // ...
}
```

### React 组件

- 使用函数组件和 Hooks
- 保持组件小而专注
- 使用 StyleSheet 而非内联样式
- 提取可复用逻辑为自定义 Hooks

```typescript
// ✅ Good
const MyComponent: React.FC = () => {
  const [count, setCount] = useState(0);
  
  return (
    <View style={styles.container}>
      <Text>{count}</Text>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
});
```

### 文件命名

- 组件文件使用 PascalCase: `MyComponent.tsx`
- 工具函数使用 camelCase: `utils.ts`
- 配置文件使用 kebab-case: `electron-config.js`

## 🧪 测试

目前项目主要依赖手动测试。如果添加自动化测试：

```bash
# 运行测试
npm test

# 测试覆盖率
npm run test:coverage
```

## 📚 文档

更新代码时，请同步更新相关文档：

- README.md - 主要说明
- QUICK_START.md - 快速开始指南
- PROJECT_SUMMARY.md - 项目总结
- 代码注释 - 复杂逻辑需要注释

## 🔍 Code Review 流程

1. 维护者会在 1-3 个工作日内审查 PR
2. 根据反馈修改代码
3. 所有讨论解决后，PR 会被合并
4. 你的贡献会在 CHANGELOG.md 中体现

## ⚡ 开发环境设置

```bash
# 安装依赖
npm install

# 启动 Web 开发服务器
npm run web

# 启动 Electron (需要 Web 服务运行)
npm run electron:dev
```

## 📧 联系方式

如有疑问，可以：

- 在 Issue 中提问
- 发送邮件至 [your.email@example.com]
- 加入讨论组 [链接]

## 🎉 贡献者

感谢所有贡献者！

<!-- 这里会自动生成贡献者列表 -->

---

**再次感谢你的贡献！** ❤️
