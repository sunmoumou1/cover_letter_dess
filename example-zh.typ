// 中文求职信示例。与英文主文件共用同一套版式。
#import "template.typ": cover-letter
#let field(s) = "【" + s + "】"
#let name = "【姓名】"
#let position = "【应聘岗位】"
#let institution = "【招聘单位】"

#show: cover-letter.with(
  lang: "zh",
  name: name,
  role: "博士研究生", // 按实际身份修改
  department: "地球系统科学系",
  university: "清华大学",
  address: [中国北京市海淀区，100084],
  email: "your.name@tsinghua.edu.cn",
  recipient: [
    #institution\
    #field("院系 / 团队")\
    招聘委员会
  ],
  date: datetime.today(),
  subject: [求职申请：#position],
  salutation: [尊敬的招聘委员会：],
  closing: [此致\ 敬礼！],
  cjk-font: "Songti SC",
  font-size: 10.5pt,
  leading: 0.68em,
  paragraph-spacing: 0.9em,
)

您好！我谨申请贵单位的#position#h(0pt)岗位。