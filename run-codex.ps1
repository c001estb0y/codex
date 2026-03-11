#!/usr/bin/env pwsh
# Codex 启动脚本
# 自动设置环境变量并运行 Codex

# 设置 Timi API Key
$env:TIMI_API_KEY = 'OIiBa1Er1Zqrriiyaj7QftmMq09x5dDZ2S8GA5KW'

# 添加 Cargo 到 PATH（如果还没有）
if (-not ($env:Path -like "*$env:USERPROFILE\.cargo\bin*")) {
    $env:Path += ";$env:USERPROFILE\.cargo\bin"
}

# 进入 Rust 工作区
Set-Location "$PSScriptRoot\codex-rs"

# 检查是否需要使用 VS 开发者环境
$needVsEnv = $false
try {
    # 尝试检查是否已经在 VS 环境中
    if (-not $env:VSINSTALLDIR) {
        $needVsEnv = $true
    }
} catch {
    $needVsEnv = $true
}

# 如果需要，设置 VS 环境
if ($needVsEnv) {
    Write-Host "正在设置 Visual Studio 2019 开发者环境..." -ForegroundColor Yellow
    & "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\Tools\VsDevCmd.bat" -arch=x64 -host_arch=x64
}

# 运行 Codex
Write-Host "正在启动 Codex..." -ForegroundColor Green
Write-Host "使用模型: gpt-5-codex (Timi API)" -ForegroundColor Cyan
Write-Host ""

# 如果有参数，传递给 Codex
if ($args.Count -gt 0) {
    cargo run --bin codex -- $args
} else {
    cargo run --bin codex
}
