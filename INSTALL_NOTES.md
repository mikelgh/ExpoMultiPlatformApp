# 📝 安装说明

## ⚠️ 关于警告信息

在安装过程中，您可能会看到类似这样的警告：

```
npm warn Unknown project config "electron_mirror"...
npm warn gitignore-fallback No .npmignore file found...
```

**这些只是警告信息，不是错误！** 您可以安全地忽略它们。

### 重要提示

1. **不要尝试执行警告信息**：这些是 npm 的输出信息，不是命令
   - ❌ 错误：`npm warn Unknown project config...`（这不是命令）
   - ✅ 正确：这些只是信息输出

2. **警告不影响安装**：即使有这些警告，依赖包仍然会正常安装

## ✅ 验证安装是否成功

运行检查脚本：

```powershell
.\check-install.ps1
```

或者手动检查：

```powershell
# 检查 node_modules 是否存在
Test-Path node_modules

# 检查 Electron 是否安装
Test-Path node_modules\electron

# 验证 Electron 版本
npx electron --version
```

## 🔍 常见问题

### Q: 看到 "Unknown project config" 警告怎么办？

A: 这是正常的。我们已经修复了 `.npmrc` 文件，这些警告应该不会再出现。如果仍然看到，可以忽略。

### Q: 看到 "gitignore-fallback" 警告怎么办？

A: 这也是正常的警告，表示 npm 使用 `.gitignore` 作为文件排除规则。不影响功能。

### Q: 如何确认安装成功？

A: 运行以下命令：

```powershell
# 检查关键包
npm list electron expo react react-native

# 或者运行检查脚本
.\check-install.ps1
```

### Q: 安装失败怎么办？

A: 如果安装失败，尝试：

1. 清理并重新安装：
```powershell
npm cache clean --force
Remove-Item -Recurse -Force node_modules, package-lock.json
npm install
```

2. 使用修复脚本：
```powershell
.\fix-install.ps1
```

3. 检查网络连接和防火墙设置

## 📊 安装状态检查清单

- [ ] `node_modules` 目录存在
- [ ] `electron` 包已安装
- [ ] `expo` 包已安装
- [ ] `react` 和 `react-native` 已安装
- [ ] 可以运行 `npx electron --version`

如果所有项都打勾，说明安装成功！🎉

