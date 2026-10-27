#!/usr/bin/env bash
set -euo pipefail
# AnyDoc npm 安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/firecrawl/anydoc#usage
# 更新日期：2026-10-27
# 类型：script
cd "$(dirname "${BASH_SOURCE[0]}")"

command -v git >/dev/null 2>&1 || { echo "需要先安装 Git"; exit 1; }
command -v node >/dev/null 2>&1 || { echo "需要先安装 Node.js"; exit 1; }

mkdir -p .download
cd .download

npm install -g @firecrawl/anydoc
anydoc --help | head -n 20
echo '安装完成：anydoc report.docx -o report.md'

echo ""

echo "部署完成：运行 anydoc --help 查看用法，例如 anydoc report.docx -o report.md"
echo "若结果异常或需要改配置，请参考官方文档：https://github.com/firecrawl/anydoc#usage"
