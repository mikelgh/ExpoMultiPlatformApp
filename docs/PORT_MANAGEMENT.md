# Port Management Guide | 端口管理指南

[English](#english) | [中文](#中文)

---

## English

### Port 8081 Conflict

All platforms (Web, Android, Electron) use **port 8081** for the development server. If you see a port conflict message, here are solutions:

#### Problem
```
› Port 8081 is being used by another process
? Use port 8082 instead? » (Y/n)
```

**⚠️ IMPORTANT: Always answer NO (n)**

Using a different port will break Electron and Android integration.

#### Solutions

**Option 1: Use kill-port.bat (Recommended)**

1. Answer **NO** to the port change prompt
2. Press `Ctrl+C` to stop the process
3. Run the cleanup script:
   ```bash
   kill-port.bat
   ```
4. Try starting again:
   ```bash
   npm run electron
   # or
   npm run web
   ```

**Option 2: Manual cleanup**

```bash
# Find process using port 8081
netstat -ano | findstr :8081

# Kill the process (replace <PID> with the actual process ID)
taskkill /F /PID <PID>
```

**Option 3: Reuse existing server (Best approach)**

Our startup scripts automatically detect if port 8081 is already in use:

- **Electron**: If Web server is running, it will connect to it directly
- **Android**: If dev server is running, it will reuse it automatically

**Example workflow:**
```bash
# Terminal 1: Start Web server ONCE
npm run web

# Terminal 2: Start Electron (will detect and reuse port 8081)
npm run electron

# Terminal 3: Start Android (will detect and reuse port 8081)
npm run android
```

#### Best Practices

1. **Single Server, Multiple Platforms**: Start web server once, then run other platforms
2. **Clean shutdown**: Always close previous servers before starting new ones
3. **Check port**: Use `kill-port.bat` to clean up stuck processes

---

## 中文

### 端口 8081 冲突

所有平台（Web、Android、Electron）都使用 **8081 端口**作为开发服务器。如果遇到端口冲突提示，以下是解决方案：

#### 问题表现
```
› Port 8081 is being used by another process
? Use port 8082 instead? » (Y/n)
```

**⚠️ 重要：请始终回答 NO (n)**

使用不同的端口会导致 Electron 和 Android 集成失败。

#### 解决方案

**方案 1：使用 kill-port.bat（推荐）**

1. 回答 **NO** 拒绝端口更改
2. 按 `Ctrl+C` 停止进程
3. 运行清理脚本：
   ```bash
   kill-port.bat
   ```
4. 重新启动：
   ```bash
   npm run electron
   # 或
   npm run web
   ```

**方案 2：手动清理**

```bash
# 查找占用 8081 端口的进程
netstat -ano | findstr :8081

# 结束进程（将 <PID> 替换为实际进程 ID）
taskkill /F /PID <PID>
```

**方案 3：复用现有服务器（最佳方式）**

我们的启动脚本会自动检测 8081 端口是否已被占用：

- **Electron**：如果 Web 服务器正在运行，会直接连接
- **Android**：如果开发服务器正在运行，会自动复用

**示例工作流程：**
```bash
# 终端 1：启动一次 Web 服务器
npm run web

# 终端 2：启动 Electron（会检测并复用 8081 端口）
npm run electron

# 终端 3：启动 Android（会检测并复用 8081 端口）
npm run android
```

# 2. 在另一个终端启动 Electron（会复用 8081 端口）
npm run electron

# 3. 在另一个终端启动 Android（会复用 8081 端口）
npm run android
```

#### 最佳实践

1. **单服务器，多平台**：启动一次 Web 服务器，然后运行其他平台
2. **正确关闭**：启动新服务器前，务必关闭之前的服务器
3. **检查端口**：使用 `kill-port.bat` 清理卡住的进程

---

## Technical Details | 技术细节

### Port Detection Logic

All startup scripts use this logic:

```batch
netstat -ano | findstr ":8081" | findstr "LISTENING" >nul 2>&1

if %errorlevel% == 0 (
    REM Port is in use - reuse or warn
) else (
    REM Port is free - start new server
)
```

### Supported Commands

| Command | Description |
|---------|-------------|
| `npm run web` | Start Web server on port 8081 |
| `npm run android` | Start Android (reuses server if available) |
| `npm run electron` | Start Electron (reuses server if available) |
| `kill-port.bat` | Kill process using port 8081 |

---

## Troubleshooting | 故障排查

### Issue: "Port still in use after killing process"

**Solution:**
1. Wait 5-10 seconds after killing the process
2. Check if any Node.js processes are still running:
   ```bash
   tasklist | findstr node
   ```
3. Kill all Node.js processes if needed:
   ```bash
   taskkill /F /IM node.exe
   ```

### Issue: "Expo asks for different port every time"

**Solution:**
- This is expected if port 8081 is occupied
- Use `kill-port.bat` to free the port first
- Or accept the alternative port (but some features may not work correctly)

---

## FAQ

**Q: Can I use a different port?**

A: Yes, but you need to:
1. Modify `package.json` scripts (change `--port 8081`)
2. Update port detection in all `.bat` files
3. Update `electron.js` to load the new port

**Q: Why does Electron need Web server?**

A: Electron loads the React app from the Web server (localhost:8081). This allows hot-reloading during development.

**Q: Can I run multiple instances?**

A: No, only one instance can use port 8081 at a time. Use the server-reusing approach instead.
