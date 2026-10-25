# 清华大学地球系统科学系 Typst 求职信模版

用于以清华大学地球系统科学系为当前署名单位的个人求职申请，默认提供英文 cover letter，并附中文示例。适合申请博士后、研究岗位、教职及相关行业职位；按招聘启事调整称呼和正文。


## 文件

| 文件 | 用途 |
| --- | --- |
| `main.typ` | 英文求职信入口，日常主要编辑这个文件 |
| `example-zh.typ` | 中文求职信示例 |
| `template.typ` | 共用排版函数，可调整字体、间距、纸张和签名 |
| `assets/thu-dess-letterhead.svg` | 可直接使用的地学系页眉，文字已转为矢量轮廓 |
| `assets/tsinghua-seal.svg`、`assets/tsinghua-wordmark.svg` | 从参考模版中提取的校徽、校名字样 |
| `output/pdf/cover-letter-en.pdf` | 英文示例预览 |
| `output/pdf/cover-letter-zh.pdf` | 中文示例预览 |

## 开始使用

1. 打开 `main.typ`，修改顶部 `applicant` 中的姓名、身份、邮箱，以及 `position`、`institution`。
2. 修改收件人和称呼。联系具体导师时可用 `salutation: [Dear Professor Smith,]`；行业岗位可用 `[Dear Hiring Manager,]`。
3. 将正文中所有 `field("...")` 和其他方括号内容替换为真实信息，也可以直接重写整段正文。示例没有预设你的研究领域、成果、导师或毕业时间。
4. 核对个人身份、联系方式、毕业时间和附件清单，再生成 PDF。


### 本地编译

在本目录运行，使用 Typst 0.15.0 已验证：

```sh
typst compile main.typ output/pdf/cover-letter-en.pdf
typst compile example-zh.typ output/pdf/cover-letter-zh.pdf
```

保存文件后自动更新：

```sh
typst watch main.typ output/pdf/cover-letter-en.pdf
```
