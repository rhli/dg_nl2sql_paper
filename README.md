# NL2SQL Paper

SIGMOD 研究论文的 LaTeX 写作仓库。默认使用官方 ACM `acmart` **2.21（2026-11-01）**，配置为 `sigconf,review,anonymous`，即双栏匿名审稿格式。标题、关键词和正文均为占位内容。

## 编译

macOS 可以先安装轻量编译器 Tectonic：

```sh
brew install tectonic
```

也可以安装完整的 TeX Live 或 MacTeX（包含 `latexmk`、pdfLaTeX 和 BibTeX）。之后运行：

```sh
make
```

输出文件：`build/main.pdf`。

```sh
make watch      # 修改后自动重新编译，需要 TeX Live/MacTeX
make clean      # 清理中间文件，保留 PDF
make distclean  # 同时清理 PDF
```

`make` 优先使用 `latexmk` 和 pdfLaTeX，缺少时自动使用 Tectonic。也可以运行 `make tectonic` 显式选择 Tectonic；首次运行需要联网下载 TeX 依赖。

Overleaf：上传仓库文件，将主文件设为 `main.tex`，选择 pdfLaTeX 和最新可用的 TeX Live。无需上传 `.git` 或 `build`。

### Windows

仓库提供原生 `build.cmd`，可在 PowerShell 或 CMD 中使用，无需安装 `make`、WSL 或 Git Bash。它与 macOS 共用 `.latexmkrc`，使用 `latexmk + pdfLaTeX + BibTeX`。

首次使用推荐安装 [MiKTeX](https://miktex.org/howto/install-miktex) 和 [Strawberry Perl](https://strawberryperl.com/)（MiKTeX 的 `latexmk` 需要 Perl）。如果已经安装包含 `latexmk` 的 TeX Live，可以直接使用现有安装。

支持 `winget` 的电脑可以在 PowerShell 中运行：

```powershell
winget install --id MiKTeX.MiKTeX --exact --source winget
winget install --id StrawberryPerl.StrawberryPerl --exact --source winget
```

安装标识来源：[MiKTeX](https://github.com/microsoft/winget-pkgs/tree/master/manifests/m/MiKTeX/MiKTeX)、[Strawberry Perl](https://github.com/microsoft/winget-pkgs/tree/master/manifests/s/StrawberryPerl/StrawberryPerl)。没有 `winget` 时可从上面的官网下载安装。

安装完成后：

1. 打开 **MiKTeX Console**，在 **Updates** 中检查并安装更新。
2. 在 **Settings → General** 中选择 **Always install missing packages on-the-fly**，让论文所需宏包和字体按需安装。首次编译需要联网；[官方设置说明](https://miktex.org/howto/miktex-console)。
3. 在 **Packages** 中搜索并安装 `latexmk`。
4. 重新打开 PowerShell 或 CMD，使安装后的 PATH 生效。

在仓库目录运行：

```powershell
.\build.cmd              # 编译，输出 build\main.pdf
.\build.cmd watch        # 保存已引用的章节后自动编译，Ctrl+C 停止
.\build.cmd rebuild      # 强制重编译
.\build.cmd clean        # 清理中间文件，保留 PDF
.\build.cmd distclean    # 清理中间文件和 PDF
```

脚本会自动切换到所在的仓库目录，也支持包含空格的仓库路径。`watch` 不自动打开阅读器，可以手动打开 `build\main.pdf`；建议使用能自动刷新、不会锁住 PDF 的阅读器。

修改的是 `main.tex` 中通过 `\input{sections/...}` 引用的文件时，`latexmk` 会自动追踪依赖。新建章节文件后需要在 `main.tex` 增加相应 `\input`。如果编译成功但阅读器仍显示旧内容，先确认打开的是 `build\main.pdf`，再重新加载阅读器。

如果出现 “could not find the script engine 'perl'”，检查 Strawberry Perl 是否安装，并重新打开终端；可以运行 `perl --version`、`latexmk -v`、`pdflatex --version` 检查环境。

## 文件组织

- `main.tex`：文档格式、标题和章节入口。
- `preamble.tex`：共享宏和额外宏包。
- `sections/`：摘要、引言、背景与问题定义、方法、实验、相关工作、结论。
- `references.bib`：BibTeX 文献；当前只有一条明确标注的模板示例。
- `figures/`：论文插图。
- `build.cmd`：Windows 编译、监控与清理入口。
- `acmart.cls`、`ACM-Reference-Format.bst`：未经修改的官方模板和参考文献样式。
- `vendor/acmart/`：模板源文件、许可证说明和下载来源。

## 投稿格式

初始化时参考 [SIGMOD 2027 Research CFP](https://2027.sigmod.org/calls_papers_sigmod_research.shtml)：正文至多 12 页，参考文献不限页，US Letter，匿名投稿；需要附录时单独提交 PDF。年份尚未指定，最终以目标年份和 track 的 CFP 为准。

当前关闭 ACM 版权块和 ACM Reference Format 引用块，未填入虚构 DOI、ISBN 或会议元数据。正式投稿前填写真实 CCS 分类并替换所有占位内容；录用后移除投稿专用设置（包括 `footnotetextcopyrightpermission` 重定义），按 ACM 提供的信息恢复出版元数据、作者和单位，并转换为要求的 PACMMOD 格式。投稿及修订阶段保留 `sigconf`，不使用 PACMMOD 排版。

官方入口：[ACM 模板](https://www.acm.org/publications/proceedings-template)、[CTAN acmart](https://ctan.org/pkg/acmart)。
# dg_nl2sql_paper
