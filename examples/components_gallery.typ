// Example: All Components Gallery
#import "../lib.typ": *

#let nav = navbar(
  brand: [Lumra *Components Gallery*],
  brand-url: "lumra://home",
  links: (
    (label: "Buttons", url: "#buttons"),
    (label: "Badges", url: "#badges"),
    (label: "Cards", url: "#cards"),
    (label: "Callouts", url: "#callouts"),
  ),
  cta-label: "GitHub",
  cta-url: "https://github.com/mytheeramet3dev-x/Lumra-Web",
)

#show: web-page.with(
  title: "Lumra-Web UI Gallery & Documentation",
  theme: "ocean",
  header: nav,
)

= คลังคอมโพเนนต์ Lumra-Web (Component Gallery)

หน้านี้แสดงรายการคอมโพเนนต์ทั้งหมดของ `lumra-web` พร้อมตัวเลือกและรูปแบบต่างๆ

#v(14pt)

== 1. ปุ่มกด (Buttons)

#stack(
  dir: ltr,
  spacing: 12pt,
  btn("#", "ปุ่มหลัก (Primary)", variant: "primary"),
  btn("#", "ปุ่มรอง (Secondary)", variant: "secondary"),
  btn("#", "ปุ่มขอบเส้น (Outline)", variant: "outline"),
  btn("#", "ปุ่มโปร่งใส (Ghost)", variant: "ghost"),
)

#v(20pt)

== 2. ป้ายกำกับ (Badges & Tags)

#stack(
  dir: ltr,
  spacing: 8pt,
  badge("Primary", variant: "primary"),
  badge("Success", variant: "success"),
  badge("Warning", variant: "warning"),
  badge("Danger", variant: "danger"),
  badge("Outline", variant: "outline"),
  badge("Default", variant: "default"),
)

#v(20pt)

== 3. กล่องแจ้งเตือน (Callouts / Alerts)

#callout(type: "info", title: "ข้อมูลทั่วไป (Info)")[
  นี่คือกล่องข้อความแจ้งเตือนข้อมูลทั่วไป ใช้สีน้ำเงินเพื่อดึงดูดสายตาอย่างนุ่มนวล
]

#v(8pt)

#callout(type: "tip", title: "ข้อแนะนำ (Tip)")[
  นี่คือกล่องเคล็ดลับหรือข้อแนะนำ ใช้สีเขียวบ่งบอกถึงความสำเร็จหรือแนวทางปฏิบัติที่ดี
]

#v(8pt)

#callout(type: "warning", title: "ข้อควรระวัง (Warning)")[
  นี่คือกล่องเตือนความจำ ใช้สีส้มเพื่อเตือนให้ระมัดระวังก่อนดำเนินการ
]

#v(8pt)

#callout(type: "danger", title: "ข้อผิดพลาด / สำคัญ (Danger)")[
  นี่คือกล่องแจ้งเตือนเรื่องสำคัญมาก ใช้สีแดงเพื่อป้องกันความผิดพลาดที่อาจเกิดขึ้น
]

#v(20pt)

== 4. การ์ดเนื้อหา (Cards)

#grid-layout(
  cols: 2,
  gutter: 16pt,
  card(
    title: "การ์ดแบบมีป้ายกำกับ",
    subtitle: "Card with badge and footer",
    badge-label: "แนะนำ",
    icon: "⭐",
    footer: [อัปเดตล่าสุด: เมื่อสักครู่],
  )[
    เนื้อหาภายในการ์ด รองรับการจัดรูปแบบตัวอักษร ลิงก์ และบล็อกโค้ดได้ตามปกติ
  ],
  card(
    title: "การ์ดแบบเรียบง่าย",
    subtitle: "Minimal Card",
    icon: "📦",
  )[
    เหมาะสำหรับแสดงสรุปข้อมูล สถิติ หรือฟีเจอร์ย่อยของระบบ
  ],
)
