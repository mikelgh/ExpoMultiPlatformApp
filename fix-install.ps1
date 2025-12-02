# Fix npm install error PowerShell script
# Usage: .\fix-install.ps1

# Set console output encoding to UTF-8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Fix npm install error" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if in correct directory
if (-not (Test-Path "package.json")) {
    Write-Host "Error: package.json not found. Please run this script in project root directory" -ForegroundColor Red
    exit 1
}

# Step 1: Clean
Write-Host "[1/4] Cleaning cache and files..." -ForegroundColor Yellow
try {
    npm cache clean --force | Out-Null
    Write-Host "  [OK] Cache cleaned" -ForegroundColor Green
} catch {
    Write-Host "  [WARN] Warning during cache clean (can be ignored)" -ForegroundColor Yellow
}

# Remove node_modules and package-lock.json
if (Test-Path "node_modules") {
    Write-Host "  Removing node_modules..." -ForegroundColor Yellow
    Remove-Item -Recurse -Force node_modules -ErrorAction SilentlyContinue
    Write-Host "  [OK] node_modules removed" -ForegroundColor Green
}

if (Test-Path "package-lock.json") {
    Write-Host "  Removing package-lock.json..." -ForegroundColor Yellow
    Remove-Item -Force package-lock.json -ErrorAction SilentlyContinue
    Write-Host "  [OK] package-lock.json removed" -ForegroundColor Green
}

Write-Host ""

# Step 2: Configure Electron mirror (using environment variables only)
Write-Host "[2/4] Configuring Electron mirror..." -ForegroundColor Yellow
# Note: Electron mirror should be set via environment variables, not .npmrc
# Create a note file instead
$npmrcNote = @"
# Electron mirror configuration
# These settings are configured via environment variables in fix-install.ps1
# Do not add electron_mirror to .npmrc as it's not a valid npm config option
"@

if (-not (Test-Path ".npmrc")) {
    # Create a minimal .npmrc if it doesn't exist
    $npmrcNote | Out-File -FilePath .npmrc -Encoding utf8
    Write-Host "  [OK] .npmrc created (with note)" -ForegroundColor Green
} else {
    Write-Host "  [INFO] .npmrc already exists, skipping" -ForegroundColor Cyan
}
Write-Host ""

# Step 3: Set environment variables
Write-Host "[3/4] Setting environment variables..." -ForegroundColor Yellow
$env:ELECTRON_MIRROR = "https://npmmirror.com/mirrors/electron/"
$env:ELECTRON_BUILDER_BINARIES_MIRROR = "https://npmmirror.com/mirrors/electron-builder-binaries/"
Write-Host "  [OK] Environment variables set" -ForegroundColor Green
Write-Host ""

# Step 4: Install dependencies
Write-Host "[4/4] Installing dependencies (this may take a few minutes)..." -ForegroundColor Yellow
Write-Host ""

try {
    npm install
    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "========================================" -ForegroundColor Green
        Write-Host "[SUCCESS] Installation completed!" -ForegroundColor Green
        Write-Host "========================================" -ForegroundColor Green
        
        # Verify Electron
        Write-Host ""
        Write-Host "Verifying Electron installation..." -ForegroundColor Yellow
        $electronVersion = npx electron --version 2>&1
        if ($LASTEXITCODE -eq 0) {
            Write-Host "  [OK] Electron version: $electronVersion" -ForegroundColor Green
        } else {
            Write-Host "  [WARN] Electron verification failed, but other dependencies may be installed" -ForegroundColor Yellow
        }
    } else {
        throw "npm install failed with exit code $LASTEXITCODE"
    }
} catch {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Red
    Write-Host "[FAILED] Installation failed" -ForegroundColor Red
    Write-Host "========================================" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please try the following:" -ForegroundColor Yellow
    Write-Host "1. Check network connection" -ForegroundColor White
    Write-Host "2. Run PowerShell as Administrator" -ForegroundColor White
    Write-Host "3. See FIX_INSTALL.md for more solutions" -ForegroundColor White
    exit 1
}

Write-Host ""
Write-Host "Done!" -ForegroundColor Green

