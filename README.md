# NL2SQL Paper

SIGMOD 研究论文的 LaTeX 写作仓库。默认使用官方 ACM `acmart` **2.21（2026-11-01）**，配置为 `sigconf,review,anonymous`，即双栏匿名审稿格式。标题、关键词和正文均为占位内容。

## 编译

本地安装完整的 TeX Live 或 MacTeX（包含 `latexmk`、pdfLaTeX 和 BibTeX），然后运行：

```sh
make
```

输出文件：`build/main.pdf`。

```sh
make watch      # 修改后自动重新编译
make clean      # 清理中间文件，保留 PDF
make distclean  # 同时清理 PDF
```

也可以安装 Tectonic 后运行 `make tectonic`；首次运行需要联网下载 TeX 依赖。

Overleaf：上传仓库文件，将主文件设为 `main.tex`，选择 pdfLaTeX 和最新可用的 TeX Live。无需上传 `.git` 或 `build`。

## 文件组织

- `main.tex`：文档格式、标题和章节入口。
- `preamble.tex`：共享宏和额外宏包。
- `sections/`：摘要、引言、背景与问题定义、方法、实验、相关工作、结论。
- `references.bib`：BibTeX 文献；当前只有一条明确标注的模板示例。
- `figures/`：论文插图。
- `acmart.cls`、`ACM-Reference-Format.bst`：未经修改的官方模板和参考文献样式。
- `vendor/acmart/`：模板源文件、许可证说明和下载来源。

## 投稿格式

初始化时参考 [SIGMOD 2027 Research CFP](https://2027.sigmod.org/calls_papers_sigmod_research.shtml)：正文至多 12 页，参考文献不限页，US Letter，匿名投稿；需要附录时单独提交 PDF。年份尚未指定，最终以目标年份和 track 的 CFP 为准。

当前关闭 ACM 版权块和 ACM Reference Format 引用块，未填入虚构 DOI、ISBN 或会议元数据。正式投稿前填写真实 CCS 分类并替换所有占位内容；录用后移除投稿专用设置（包括 `footnotetextcopyrightpermission` 重定义），按 ACM 提供的信息恢复出版元数据、作者和单位，并转换为要求的 PACMMOD 格式。投稿及修订阶段保留 `sigconf`，不使用 PACMMOD 排版。

官方入口：[ACM 模板](https://www.acm.org/publications/proceedings-template)、[CTAN acmart](https://ctan.org/pkg/acmart)。
# dg_nl2sql_paper
