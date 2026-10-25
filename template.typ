// 清华大学地球系统科学系个人求职信模版。
// 日常只需修改 main.typ。该模版不需要第三方 Typst 包或网络连接。

#let thu-purple = rgb("660874")
#let default-letterhead = image("assets/thu-dess-letterhead.svg", width: 100%)

#let cover-letter(
  name: "[Your Name]",
  role: "Ph.D. Candidate",
  department: "Department of Earth System Science",
  university: "Tsinghua University",
  address: [Beijing 100084, China],
  email: none,
  phone: none,
  website: none,
  website-label: none,
  recipient: none,
  date: datetime.today(),
  subject: none,
  salutation: [Dear Members of the Search Committee,],
  closing: [Sincerely,],
  signature: none,
  signature-width: 30mm,
  signature-align: right,
  enclosures: none,
  lang: "en",
  body-font: "Libertinus Serif",
  cjk-font: "Songti SC",
  font-size: 11pt,
  leading: 0.56em,
  paragraph-spacing: 0.78em,
  paper: "a4",
  margin: (left: 25.4mm, right: 25.4mm, top: 49mm, bottom: 23mm),
  accent: thu-purple,
  letterhead: default-letterhead,
  body,
) = {
  assert(lang in ("en", "zh"), message: "lang must be en or zh")
  set document(
    title: if subject == none { [Cover letter] } else { subject },
    author: name,
  )
  set text(
    font: if lang == "zh" { (body-font, cjk-font) } else { body-font },
    size: font-size,
    fill: rgb("202020"),
    lang: lang,
    hyphenate: false,
  )
  set par(
    justify: true,
    first-line-indent: 0pt,
    leading: leading,
    spacing: paragraph-spacing,
  )
  show link: it => text(fill: rgb("202020"), it)

  set page(
    paper: paper,
    margin: margin,
    header-ascent: 9mm,
    footer-descent: 8mm,
    header: [
      #letterhead
      #v(2.5mm)
      #line(length: 100%, stroke: 0.65pt + accent)
    ],
    footer: context {
      set text(size: 8pt, fill: rgb("777777"))
      set par(justify: false)
      if counter(page).final().first() > 1 {
        grid(
          columns: (1fr, auto),
          align: (left, right),
          [#name],
          counter(page).display("1 / 1", both: true),
        )
      }
    },
  )

  // 发件人信息与收件人信息分列，避免长邮箱或机构名称挤到一起。
  grid(
    columns: (1fr, 75mm),
    column-gutter: 7mm,
    align: (left + top, right + top),
    [
      #set par(justify: false, leading: 0.45em, spacing: 0pt)
      #text(size: 10pt)[
        #if type(date) == datetime {
          date.display(if lang == "zh" { "[year]年[month]月[day]日" } else { "[day] [month repr:long] [year]" })
        } else { date }
      ]
      #if recipient != none [
        #v(4mm)
        #text(size: 10pt, recipient)
      ]
    ],
    [
      #set par(justify: false, leading: 0.4em, spacing: 0pt)
      #set text(size: 9.5pt)
      #text(size: 11pt, weight: "bold", name)\
      #if role != none [#role\ ]
      #department\
      #university\
      #if address != none [#address\ ]
      #if email != none [#link("mailto:" + email, email)\ ]
      #if phone != none [#phone\ ]
      #if website != none {
        link(website, if website-label == none { website } else { website-label })
      }
    ],
  )
  v(5mm)

  // 标题、称呼和首段相邻，避免分页后留下孤立的称呼。
  if subject != none {
    block(below: 3mm, sticky: true)[
      #set par(justify: false)
      #text(weight: "bold", subject)
    ]
  }
  block(below: 3mm, sticky: true)[#salutation]

  body

  // 保持结束语、手写签名和姓名在同一页。
  block(width: 100%, breakable: false, above: 5mm)[
    #align(signature-align)[
      #block(width: 68mm)[
        #set par(justify: false, leading: 0.45em, spacing: 0pt)
        #closing
        #if signature == none {
          v(5mm)
        } else {
          v(2mm)
          image(signature, width: signature-width, height: 13mm, fit: "contain")
          v(1mm)
        }
        #text(weight: "bold", name)
      ]
    ]
    #if enclosures != none [
      #v(5mm)
      #text(size: 9pt, fill: rgb("555555"))[
        #if lang == "zh" { [附件：] } else { [Enclosures: ] }
        #enclosures
      ]
    ]
  ]
}
