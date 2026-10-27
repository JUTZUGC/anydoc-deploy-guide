# AnyDoc npm 安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/firecrawl/anydoc#usage
# 更新日期：2026-10-27
# 类型：script
$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

if (-not (Get-Command git -ErrorAction SilentlyContinue)) { throw '需要先安装 Git' }
if (-not (Get-Command node -ErrorAction SilentlyContinue)) { throw '需要先安装 Node.js' }

New-Item -ItemType Directory -Force -Path .download | Out-Null
Set-Location -Path .download

npm.cmd install -g @firecrawl/anydoc
anydoc --help
Write-Host '安装完成：anydoc report.docx -o report.md'

Write-Host ''

Write-Host '部署完成：运行 anydoc --help 查看用法，例如 anydoc report.docx -o report.md'
Write-Host '若结果异常或需要改配置，请参考官方文档：https://github.com/firecrawl/anydoc#usage'
