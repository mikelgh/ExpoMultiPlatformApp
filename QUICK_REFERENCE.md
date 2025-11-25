# Quick Reference | 快速参考

## 🚀 Starting the App | 启动应用

### Single Platform | 单平台运行

```bash
npm run web        # Web only (port 8081)
npm run android    # Android only
npm run electron   # Windows desktop only
```

### Multiple Platforms | 多平台同时运行

```bash
# Terminal 1 | 终端 1
npm run web

# Terminal 2 | 终端 2
npm run electron

# Terminal 3 | 终端 3  
npm run android
```

---

## ⚠️ Port 8081 Conflict | 端口冲突

**When you see | 当你看到:**
```
› Port 8081 is being used by another process
? Use port 8082 instead? » (Y/n)
```

**What to do | 处理方法:**

1. **Answer NO** | **回答 NO**
2. Press `Ctrl+C` to stop | 按 `Ctrl+C` 停止
3. Run cleanup | 运行清理脚本:
   ```bash
   kill-port.bat
   ```
4. Restart | 重新启动:
   ```bash
   npm run web
   # or | 或
   npm run electron
   ```

---

## 🔧 Troubleshooting | 故障排查

### Script Error | 脚本错误
```
此时不应有 ...
```
**Fix | 修复:** Removed all `...` from echo statements | 已从echo语句中移除所有 `...`

**详细说明 | Details:** [批处理脚本错误排查](./docs/TROUBLESHOOTING_BATCH_ERRORS.md)

### Port Detection | 端口检测
```bash
# Check what's using port 8081 | 检查谁在使用 8081
netstat -ano | findstr :8081

# Kill specific process | 结束特定进程
taskkill /F /PID <PID>

# Or use our script | 或使用脚本
kill-port.bat
```

---

## 📁 Project Structure | 项目结构

```
ExpoMultiPlatformApp/
├── App.tsx                 # Main app component | 主应用组件
├── electron.js            # Electron main process | Electron 主进程
├── start-web.bat          # Web launcher | Web 启动器
├── start-android.bat      # Android launcher | Android 启动器
├── start-electron.bat     # Electron launcher | Electron 启动器
├── kill-port.bat          # Port cleanup | 端口清理
└── docs/
    ├── PORT_MANAGEMENT.md # Port guide | 端口指南
    └── FAQ.md            # FAQ | 常见问题
```

---

## 🎯 Best Practices | 最佳实践

### ✅ DO | 推荐做法

- Start Web server once, then other platforms | 启动一次 Web 服务器，然后启动其他平台
- Use `kill-port.bat` when port conflicts occur | 端口冲突时使用清理脚本
- Always use port 8081 for consistency | 始终使用 8081 端口保持一致性

### ❌ DON'T | 不推荐做法

- Don't use different ports (8082, 8083, etc.) | 不要使用不同的端口
- Don't start multiple Web servers | 不要启动多个 Web 服务器
- Don't ignore port conflict warnings | 不要忽略端口冲突警告

---

## 📚 More Help | 更多帮助

- [Full README | 完整说明](./README.md)
- [Port Management | 端口管理](./docs/PORT_MANAGEMENT.md)
- [FAQ | 常见问题](./docs/FAQ.md)
- [Quick Start | 快速开始](./QUICK_START.md)
