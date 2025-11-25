const { spawn } = require('child_process');
const http = require('http');
const path = require('path');

// 检查端口是否可用
function checkPort(port) {
  return new Promise((resolve) => {
    const req = http.get(`http://localhost:${port}`, (res) => {
      resolve(true); // 端口已被占用且服务可访问
    });
    
    req.on('error', () => {
      resolve(false); // 端口未被占用或服务不可访问
    });
    
    req.setTimeout(2000, () => {
      req.destroy();
      resolve(false);
    });
  });
}

// 等待服务启动
async function waitForServer(port, maxAttempts = 60) {
  console.log(`等待服务在端口 ${port} 启动...`);
  
  for (let i = 0; i < maxAttempts; i++) {
    const isAvailable = await checkPort(port);
    if (isAvailable) {
      console.log('✓ 服务已就绪！
');
      return true;
    }
    await new Promise(resolve => setTimeout(resolve, 1000));
    process.stdout.write('.');
  }
  
  console.log('
✗ 等待服务超时');
  return false;
}

async function startElectron() {
  const port = 8081;
  const electronPath = path.join(__dirname, 'electron.js');
  const isPortInUse = await checkPort(port);
  
  if (isPortInUse) {
    console.log(`✓ Web 服务已在端口 ${port} 运行`);
    console.log('✓ 直接启动 Electron...
');
    
    // 直接启动 Electron
    const electron = spawn('npx', 
      ['electron', electronPath], {
      stdio: 'inherit',
      shell: true
    });
    
    electron.on('close', (code) => {
      process.exit(code || 0);
    });
    
  } else {
    console.log(`✓ 启动 Web 服务和 Electron...
`);
    
    // 启动 Web 服务
    const webServer = spawn(process.platform === 'win32' ? 'npm.cmd' : 'npm', 
      ['run', 'web'], {
      stdio: 'pipe',
      shell: false
    });
    
    webServer.stdout.on('data', (data) => {
      process.stdout.write(data);
    });
    
    webServer.stderr.on('data', (data) => {
      process.stderr.write(data);
    });
    
    // 等待服务启动
    const serverReady = await waitForServer(port);
    
    if (!serverReady) {
      console.error('Web 服务启动失败');
      webServer.kill();
      process.exit(1);
      return;
    }
    
    // 启动 Electron
    console.log('启动 Electron 窗口...\n');
    const electron = spawn('npx', 
      ['electron', electronPath], {
      stdio: 'inherit',
      shell: true
    });
    
    electron.on('close', (code) => {
      console.log('
Electron 已关闭');
      webServer.kill();
      process.exit(code || 0);
    });
    
    // 处理 Ctrl+C
    process.on('SIGINT', () => {
      console.log('
正在关闭...');
      electron.kill();
      webServer.kill();
      process.exit(0);
    });
  }
}

startElectron().catch(err => {
  console.error('启动失败:', err);
  process.exit(1);
});
