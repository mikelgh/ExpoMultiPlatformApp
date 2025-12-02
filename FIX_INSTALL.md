# 🔧 修复 npm install 错误

## 问题分析

错误 `RequestError: read ECONNRESET` 表示在下载 Electron 时网络连接被重置。常见原因：
- 网络不稳定
- 防火墙/代理拦截
- 下载源访问慢（国内用户）

## 解决方案

### 方案 1: 配置 Electron 镜像源（推荐，国内用户）

在项目根目录创建或编辑 `.npmrc` 文件：

```ini
# Electron 镜像源（淘宝镜像）
electron_mirror=https://npmmirror.com/mirrors/electron/
electron_builder_binaries_mirror=https://npmmirror.com/mirrors/electron-builder-binaries/
```

然后重新安装：

```powershell
# 清理缓存
npm cache clean --force

# 删除 node_modules 和 package-lock.json
Remove-Item -Recurse -Force node_modules, package-lock.json -ErrorAction SilentlyContinue

# 重新安装
npm install
```

### 方案 2: 使用环境变量设置镜像

```powershell
# 设置 Electron 镜像
$env:ELECTRON_MIRROR="https://npmmirror.com/mirrors/electron/"
$env:ELECTRON_BUILDER_BINARIES_MIRROR="https://npmmirror.com/mirrors/electron-builder-binaries/"

# 重新安装
npm install
```

### 方案 3: 分步安装（如果方案 1 和 2 失败）

```powershell
# 1. 先安装其他依赖（跳过 electron）
npm install --ignore-scripts

# 2. 单独安装 electron（使用镜像）
$env:ELECTRON_MIRROR="https://npmmirror.com/mirrors/electron/"
npm install electron --save-dev

# 3. 安装 electron-builder
npm install electron-builder --save-dev
```

### 方案 4: 使用 yarn（如果 npm 持续失败）

```powershell
# 安装 yarn（如果还没有）
npm install -g yarn

# 配置镜像
yarn config set electron_mirror https://npmmirror.com/mirrors/electron/
yarn config set electron_builder_binaries_mirror https://npmmirror.com/mirrors/electron-builder-binaries/

# 安装依赖
yarn install
```

### 方案 5: 临时跳过 Electron（如果不需要桌面应用）

如果暂时不需要 Electron 功能，可以：

1. 从 `package.json` 中移除 electron 相关依赖
2. 或者使用 `--ignore-scripts` 安装，稍后再安装 electron

## 权限问题修复

如果遇到 `EPERM` 权限错误：

```powershell
# 1. 以管理员身份运行 PowerShell
# 2. 关闭可能占用文件的程序（VS Code、其他编辑器等）
# 3. 删除 node_modules
Remove-Item -Recurse -Force node_modules -ErrorAction SilentlyContinue

# 4. 重新安装
npm install
```

## 完整清理和重装脚本

创建 `fix-install.ps1` 文件：

```powershell
# 清理
Write-Host "清理缓存和文件..." -ForegroundColor Yellow
npm cache clean --force
Remove-Item -Recurse -Force node_modules, package-lock.json -ErrorAction SilentlyContinue

# 配置镜像
Write-Host "配置 Electron 镜像源..." -ForegroundColor Yellow
$npmrcContent = @"
electron_mirror=https://npmmirror.com/mirrors/electron/
electron_builder_binaries_mirror=https://npmmirror.com/mirrors/electron-builder-binaries/
"@
$npmrcContent | Out-File -FilePath .npmrc -Encoding utf8

# 安装
Write-Host "开始安装依赖..." -ForegroundColor Green
npm install

Write-Host "安装完成！" -ForegroundColor Green
```

运行：
```powershell
.\fix-install.ps1
```

## 验证安装

安装成功后，验证 Electron：

```powershell
npx electron --version
```

应该显示 Electron 版本号。

## 如果问题仍然存在

1. **检查网络连接**：确保能访问 npm 和镜像源
2. **检查防火墙**：临时关闭防火墙测试
3. **使用 VPN**：如果镜像源也无法访问
4. **查看详细日志**：`npm install --verbose` 查看具体错误

