# Quick check script for installation status
# Usage: .\check-install.ps1

Write-Host "Checking installation status..." -ForegroundColor Cyan
Write-Host ""

# Check node_modules
if (Test-Path "node_modules") {
    Write-Host "[OK] node_modules directory exists" -ForegroundColor Green
} else {
    Write-Host "[FAIL] node_modules directory not found" -ForegroundColor Red
    Write-Host "Please run: npm install" -ForegroundColor Yellow
    exit 1
}

# Check Electron
if (Test-Path "node_modules\electron") {
    Write-Host "[OK] Electron package found" -ForegroundColor Green
    
    # Try to get version
    try {
        $version = npx electron --version 2>&1
        if ($LASTEXITCODE -eq 0) {
            Write-Host "[OK] Electron version: $version" -ForegroundColor Green
        }
    } catch {
        Write-Host "[WARN] Could not verify Electron version" -ForegroundColor Yellow
    }
} else {
    Write-Host "[FAIL] Electron package not found" -ForegroundColor Red
    Write-Host "Please run: npm install" -ForegroundColor Yellow
}

# Check other key packages
$keyPackages = @("expo", "react", "react-native")
Write-Host ""
Write-Host "Checking key packages..." -ForegroundColor Cyan

foreach ($pkg in $keyPackages) {
    if (Test-Path "node_modules\$pkg") {
        Write-Host "  [OK] $pkg" -ForegroundColor Green
    } else {
        Write-Host "  [FAIL] $pkg" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "Done!" -ForegroundColor Cyan

