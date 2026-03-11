@echo off
REM Codex 快速启动脚本

echo 正在启动 Codex...
echo.

REM 设置 Timi API Key
set TIMI_API_KEY=OIiBa1Er1Zqrriiyaj7QftmMq09x5dDZ2S8GA5KW

REM 添加 Cargo 到 PATH
set PATH=%USERPROFILE%\.cargo\bin;%PATH%

REM 设置 Visual Studio 2019 开发者环境
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\Tools\VsDevCmd.bat" -arch=x64 -host_arch=x64

REM 进入 Rust 工作区
cd /d "%~dp0codex-rs"

REM 运行 Codex
echo 使用模型: gpt-5-codex (Timi API)
echo.
cargo run --bin codex %*
