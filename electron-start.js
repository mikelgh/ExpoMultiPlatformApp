const { spawn } = require('child_process');
const http = require('http');
const path = require('path');

// Check if port is available
function checkPort(port) {
  return new Promise((resolve) => {
    const req = http.get(`http://localhost:${port}`, (res) => {
      resolve(true); // Port is in use and service is accessible
    });
    
    req.on('error', () => {
      resolve(false); // Port is not in use or service is inaccessible
    });
    
    req.setTimeout(2000, () => {
      req.destroy();
      resolve(false);
    });
  });
}

// Wait for server to start
async function waitForServer(port, maxAttempts = 60) {
  console.log(`Waiting for server on port ${port}...`);
  
  for (let i = 0; i < maxAttempts; i++) {
    const isAvailable = await checkPort(port);
    if (isAvailable) {
      console.log('✓ Server is ready!\n');
      return true;
    }
    await new Promise(resolve => setTimeout(resolve, 1000));
    process.stdout.write('.');
  }
  
  console.log('\n✗ Server startup timeout');
  return false;
}

async function startElectron() {
  const port = 8081;
  const electronPath = path.join(__dirname, 'electron.js');
  const isPortInUse = await checkPort(port);
  
  if (isPortInUse) {
    console.log(`✓ Web server is running on port ${port}`);
    console.log('✓ Starting Electron directly...\n');
    
    // Start Electron directly
    const electron = spawn('npx', 
      ['electron', electronPath], {
      stdio: 'inherit',
      shell: true
    });
    
    electron.on('close', (code) => {
      process.exit(code || 0);
    });
    
  } else {
    console.log(`✓ Starting Web server and Electron...\n`);
    
    // Start Web server
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
    
    // Wait for server to start
    const serverReady = await waitForServer(port);
    
    if (!serverReady) {
      console.error('Web server startup failed');
      webServer.kill();
      process.exit(1);
      return;
    }
    
    // Start Electron
    console.log('Starting Electron window...\n');
    const electron = spawn('npx', 
      ['electron', electronPath], {
      stdio: 'inherit',
      shell: true
    });
    
    electron.on('close', (code) => {
      console.log('\nElectron closed');
      webServer.kill();
      process.exit(code || 0);
    });
    
    // Handle Ctrl+C
    process.on('SIGINT', () => {
      console.log('\nShutting down...');
      electron.kill();
      webServer.kill();
      process.exit(0);
    });
  }
}

startElectron().catch(err => {
  console.error('Startup failed:', err);
  process.exit(1);
});
