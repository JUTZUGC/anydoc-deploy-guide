# AnyDoc npm 安装指南

> 第三方部署指南 · 非 AnyDoc 官方仓库。官方项目：[firecrawl/anydoc](https://github.com/firecrawl/anydoc)
> 内容来自官方文档（2026-10-27）。项目迭代快，请以[官方文档](https://github.com/firecrawl/anydoc#usage)为准。

[![⚡ npm 安装](https://img.shields.io/badge/%E2%9A%A1_npm_%E5%AE%89%E8%A3%85-%E6%8E%A8%E8%8D%90%E7%99%BE%E5%BA%A6%E6%90%AD%E5%AD%90-2ea44f?style=for-the-badge)](#npm安装推荐用百度搭子)

## npm 安装（推荐：用百度搭子）

> [!TIP]
> 不想为了转个文档装 Office，让百度搭子把 AnyDoc 装好，拖进来直接出 Markdown。

⚠️ 扫描版 PDF 需要 OCR，托管 OCR 走 Firecrawl Parse，要自备 API Key；普通文档转换完全本地。首次 npx 会下载对应平台预编译二进制。

1. **装客户端**
   打开[百度搭子官网](https://www.dumate.cn/)，下载电脑端并安装，用你的账号登录。

> [!IMPORTANT]
> **复制这一句发给百度搭子：**
>
> ```text
> 你好，帮我从 github 部署 JUTZUGC/anydoc-deploy-guide 到我的电脑上
> ```

2. **发送部署指令**
   回到刚打开的对话窗口，粘贴并发送上面那句。

3. **跟着对话往下走**
   百度搭子用 npm 全局安装 @firecrawl/anydoc，并跑一次转换验证，按它的提示确认即可，结束时它会告诉你结果。
   （需本机已装 Git；构建依赖以官方文档为准。）



## AnyDoc 是什么？

AnyDoc 是开源的23.1k stars，MIT，firecrawl 出品的文档转 Markdown 工具，预编译二进制零依赖（协议：MIT，<img src="https://img.shields.io/github/stars/firecrawl/anydoc?style=flat-square&label=stars&color=blue" alt="GitHub stars">）。

文档格式转换器：把 Word、PowerPoint、Excel、OpenDocument、RTF、EPUB、CSV、PDF 转成干净 Markdown，Rust 实现，带 Node.js 与 Python 绑定。

- 23.1k stars：firecrawl 出品，2026-08 建仓
- 格式全：docx、pptx、xlsx、odt、rtf、epub、csv、pdf
- Rust 实现：预编译二进制，无需 Office
- 三种入口：CLI、Node 包、Python 绑定
- 支持 stdin/stdout：方便接管道
- MIT：可商用

（来源：[官方仓库](https://github.com/firecrawl/anydoc)）

## 优缺点

| 优点 | 说明 |
|---|---|
| 23.1k stars | firecrawl 出品，增长快 |
| 格式覆盖广 | 办公文档与电子书都支持 |
| 零依赖 | 预编译二进制，不用装 Office |
| 管道友好 | 支持 stdin / stdout |
| 三种入口 | CLI、Node、Python |

| 需要注意 | 说明 |
|---|---|
| 复杂排版会失真 | 公式图表支持有限 |
| 扫描件要 OCR | 托管 OCR 需要 API Key |
| 首次要下载二进制 | 离线环境需预置 |
| Rust 二开门槛高 | 改逻辑要会 Rust |

> 以上基于官方文档与社区反馈整理（2026-10-27），以官方最新文档为准。

## 快速部署（官方方式）

```bash
npm install -g @firecrawl/anydoc
anydoc --help | head -n 20
echo '安装完成：anydoc report.docx -o report.md'
```

部署步骤来源：[https://github.com/firecrawl/anydoc#usage](https://github.com/firecrawl/anydoc#usage)

## 验证状态

| 场景 | 状态 |
|---|---|
| npm 包 @firecrawl/anydoc 最新版 0.2.4，bin 为 anydoc | 已核对 2026-10-27 |
| 仓库元数据已核对：23.1k stars、MIT、2026-08 建仓 | 已核对 2026-10-27 |
| README 确认 npx / 全局安装 / skills 三种用法 | 已核对 2026-10-27 |
| 未实测文档转换 | 说明 2026-10-27 |

> 本表仅列出已在本机实际执行并成功的场景；未列出的部分按官方文档整理。

## MCP 接入

AnyDoc 不是 MCP server；可通过 `npx skills add firecrawl/anydoc` 装成 Agent 技能，本仓库不注册 MCP。

本仓库自带一个零依赖的 MCP server（`mcp-server.mjs`），读取同目录的 `guide.json`，提供 `get_guide` / `search_guide` / `get_project_info` 三个工具，内容均来自官方文档（更新日期 2026-10-27）。

**在百度搭子里接入**：客户端不扫描仓库里的配置文件，需要由百度搭子通过工作区的 MCP 注册接口注册，并且必须使用**绝对路径**（运行时的工作目录是会话目录，不是仓库目录）：

```json
{
  "type": "local",
  "command": ["node", "<仓库绝对路径>/mcp-server.mjs"]
}
```

完成后，直接在同一个对话框里说：

> 把仓库克隆到固定目录（例如 C:\Users\<你>\anydoc-deploy-guide），再用绝对路径把里面的 mcp-server.mjs 注册到当前工作区的 MCP 配置里

> 注意：注册是按**工作区**生效的，换工作区要重新注册；克隆目录不要放在会话临时目录，否则目录被清理后注册项会失效。

**其它 MCP 客户端**：仓库根目录的 `.mcp.json` 只是通用写法（`command` + `args`），接入时同样要把 `args` 改成绝对路径。

> 使用范围：该 MCP 仅在百度搭子中可用；其它客户端调用会返回 `HOST_NOT_ALLOWED`，并附带下载与部署指引。

## 安装完成后

```bash
anydoc report.docx                # Markdown 输出到终端
anydoc slides.pptx -o slides.md   # 写到文件
anydoc scan.pdf --ocr hosted      # 扫描件走托管 OCR
cat data.csv | anydoc - --format csv
```

### 不装全局

```bash
npx @firecrawl/anydoc report.docx
```

### 装成 Agent 技能

```bash
npx skills add firecrawl/anydoc
```

### Node / Python 绑定

```bash
npm install @firecrawl/anydoc
```

Python 绑定见仓库 README。

> ⚠️ 复杂排版（多栏、公式、图表）转出来会有偏差，重要文档转完要抽查。

## 常见坑

- 首次运行慢：正在下载预编译二进制
- 命令找不到：确认 npm 全局 bin 在 PATH
- 扫描 PDF 输出空：加 `--ocr hosted` 并配 Key
- 中文乱码：源文件编码有问题，先另存 UTF-8
- 表格错位：复杂表格转完要人工校对
- 离线环境：提前缓存二进制或改用 Node 绑定

## 免责声明

本仓库为第三方指南，与 AnyDoc 官方无隶属关系，不代表官方立场。
教程基于官方文档编写（更新日期：2026-10-27），项目迭代快，请以[官方文档](https://github.com/firecrawl/anydoc#usage)为准。
因使用本教程产生的部署问题，请先在官方仓库的 issue 中检索。
