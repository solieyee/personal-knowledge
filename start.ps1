# 📖 读书合集 - 启动脚本 (PowerShell)
# 用法: .\start.ps1
# 或直接: .\start.ps1 -Mode browser/server

param(
    [ValidateSet('browser', 'server')]
    [string]$Mode = 'browser'
)

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$htmlPath = Join-Path $root "reading-collection\index.html"

Write-Host "╔══════════════════════════════════════╗" -ForegroundColor DarkYellow
Write-Host "║      📖 我的读书合集                  ║" -ForegroundColor DarkYellow
Write-Host "║      Reading Collection               ║" -ForegroundColor DarkYellow
Write-Host "╚══════════════════════════════════════╝" -ForegroundColor DarkYellow
Write-Host ""

if ($Mode -eq 'browser') {
    if (Test-Path $htmlPath) {
        Start-Process $htmlPath
        Write-Host "✅ 已在浏览器中打开读书合集！" -ForegroundColor Green
        Write-Host "   文件路径: $htmlPath" -ForegroundColor Gray
    } else {
        Write-Host "❌ 未找到文件: $htmlPath" -ForegroundColor Red
    }
} else {
    $serverDir = Join-Path $root "reading-collection"
    if (Test-Path $serverDir) {
        Set-Location $serverDir
        Write-Host "📡 启动本地服务器: http://localhost:8080" -ForegroundColor Cyan
        Start-Process "http://localhost:8080"
        python -m http.server 8080
    } else {
        Write-Host "❌ 未找到目录: $serverDir" -ForegroundColor Red
    }
}
