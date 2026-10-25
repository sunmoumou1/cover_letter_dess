// 英文求职信入口。先修改下列信息，再按岗位修改正文。
#import "template.typ": cover-letter

// 所有方括号内容均为待替换信息，不代表已经取得的经历或成果。
#let field(s) = "[" + s + "]"
#let applicant = (
  name: "[Your Name]",
  role: "Ph.D. Candidate", // 按实际身份修改，如 Postdoctoral Researcher
  email: "your.name@tsinghua.edu.cn",
  phone: none, // 例如 "+86 138 0000 0000"；none 表示不显示
  website: none, // 例如 "https://your-website.example"
)
#let position = "[Position Title]"
#let institution = "[Institution / Company]"

#show: cover-letter.with(
  name: applicant.name,
  role: applicant.role,
  email: applicant.email,
  phone: applicant.phone,
  website: applicant.website,
  address: [Beijing 100084, China],
  recipient: [
    Search Committee\
    #field("Department / Research Group")\
    #institution
  ],
  date: datetime.today(), // 或固定为 datetime(year: 2026, month: 10, day: 24)
  subject: [Application for #position],
  salutation: [Dear Members of the Search Committee,],
  closing: [Sincerely,],
  // signature: "assets/signature.png", // 可选，使用透明背景的真实签名
  // signature-align: left,             // 默认沿用参考模版的右侧落款
  // enclosures: [Curriculum vitae; research statement; teaching statement.],
)

I am writing to apply for the #position at #institution. xxxxx
