// Example: Lumra-Web Landing Page Showcase
#import "../lib.typ": *

#let nav = navbar(
  brand: [Lumra *Web*],
  brand-url: "lumra://home",
  links: (
    (label: "หน้าแรก", url: "#home"),
    (label: "จุดเด่น", url: "#features"),
    (label: "ส่วนประกอบ", url: "#components"),
    (label: "ตัวอย่างโค้ด", url: "#code"),
  ),
  cta-label: "เริ่มต้นใช้งาน",
  cta-url: "https://github.com/mytheeramet3dev-x/Lumra-Web",
)

#let foot = footer(
  brand: [Lumra Web Framework],
  tagline: [สร้างเว็บไซต์ยุคใหม่ด้วย Typst — สวยงาม ยืดหยุ่น ไร้ความซับซ้อนของ HTML/CSS],
  columns: (
    (
      title: "ผลิตภัณฑ์",
      links: (
        (label: "MyLumra Browser", url: "https://github.com/mytheeramet3dev-x/MyLumra"),
        (label: "Lumra-Web Framework", url: "https://github.com/mytheeramet3dev-x/Lumra-Web"),
        (label: "Typst Documentation", url: "https://typst.app/docs"),
      ),
    ),
    (
      title: "แหล่งเรียนรู้",
      links: (
        (label: "คู่มือการติดตั้ง", url: "#docs"),
        (label: "ตัวอย่าง Components", url: "#components"),
        (label: "Release Notes", url: "#releases"),
      ),
    ),
  ),
  copyright: [© 2026 Lumra Project. Open source under MIT License.],
)

#show: web-page.with(
  title: "Lumra Web — เว็บไซต์ยุคใหม่ด้วย Typst",
  theme: "ocean",
  header: nav,
  footer: foot,
)

// Hero Section
#hero(
  tag: "✨ Lumra-Web v0.1.0 เปิดตัวแล้ว",
  title: [ปฏิวัติการสร้างเว็บด้วย Typst],
  subtitle: [ก้าวข้ามขีดจำกัดเดิมของ HTML/CSS สู่มาตรฐานเว็บเอกสารที่ทรงพลัง จัดหน้าสมบูรณ์แบบระดับนิตยสาร เรนเดอร์ลื่นไหลด้วย Rust Engine],
  actions: (
    btn("https://github.com/mytheeramet3dev-x/Lumra-Web", "🚀 เริ่มสร้างโปรเจกต์", variant: "primary"),
    btn("https://github.com/mytheeramet3dev-x/MyLumra", "🌐 ดาวน์โหลด MyLumra", variant: "secondary"),
  ),
)

#v(20pt)

// Callout announcement
#callout(type: "tip", title: "ทำไมต้อง Typst สำหรับเว็บ?")[
  Typst รวมระบบ Layout ระดับมืออาชีพ (Typography, Math, Tables, Vectors) เข้ากับภาษาเขียนโค้ดที่เรียบง่ายและปลอดภัย คุณสามารถเขียนเว็บไซต์ทั้งหน้าได้ในไฟล์ `.typ` ไฟล์เดียว ไม่ต้องพึ่ง Node.js, Webpack, หรือ CSS Preprocessors ให้ปวดหัว!
]

#v(24pt)

== จุดเด่นสำคัญ (Core Features)

#v(10pt)

#grid-layout(
  cols: 3,
  gutter: 14pt,
  card(
    title: "Native Layout",
    subtitle: "จัดวางสวยงามดั่งนิตยสาร",
    icon: "📐",
    badge-label: "Core",
  )[
    จัดวางเนื้อหา คอลัมน์ กริด และระยะห่างอย่างแม่นยำด้วย Typst Layout Engine ปราศจากปัญหา CSS Layout Shifting.
  ],
  card(
    title: "Math & Science",
    subtitle: "สมการคณิตศาสตร์ระดับโลก",
    icon: "🧮",
    badge-label: "Built-in",
  )[
    เรนเดอร์สมการคณิตศาสตร์ สัญลักษณ์วิทยาศาสตร์ และกราฟฟิกิกอย่างคมชัด รองรับ OpenType Math ในตัว:
    $ E = m c^2 quad "และ" quad integral_(-infinity)^infinity e^(-x^2) dif x = sqrt(pi) $
  ],
  card(
    title: "Rust Engine",
    subtitle: "ความเร็วสูงพิเศษ",
    icon: "⚡",
    badge-label: "Fast",
  )[
    ทำงานร่วมกับ Lumra Native Browser คอมไพล์ Typst สดๆ ในหน่วยความจำ พร้อมเรนเดอร์ Retina 2x ลื่นไหล 60 FPS.
  ],
  card(
    title: "Theming System",
    subtitle: "ปรับแต่งธีมได้ดั่งใจ",
    icon: "🎨",
    badge-label: "Themes",
  )[
    มาพร้อม 5 ธีมสำเร็จรูป: Ocean, Dark, Emerald, Purple และ Minimal หรือจะกำหนดสี Palette ของตนเองได้ง่ายดาย.
  ],
  card(
    title: "Ready Components",
    subtitle: "คอมโพเนนต์พร้อมใช้",
    icon: "🧩",
    badge-label: "UI Kit",
  )[
    รวม Navbar, Hero, Button, Badge, Callout, Card, Grid Layout และ Footer ที่พร้อมหยิบมาวางได้ทันที.
  ],
  card(
    title: "Thai Language",
    subtitle: "รองรับภาษาไทย 100%",
    icon: "🇹🇭",
    badge-label: "Native",
  )[
    ตัดคำและแสดงผลฟอนต์ภาษาไทยสมบูรณ์แบบ วรรณยุกต์ไม่ลอย เข้ากันได้กับฟอนต์ระบบบน macOS, Windows และ Linux.
  ],
)

#v(24pt)

== ตัวอย่างการเขียนโค้ด (Quick Start)

#v(6pt)

คุณสามารถสร้างเว็บเพจที่สมบูรณ์ได้ในไม่กี่บรรทัด:

```typst
#import "@preview/lumra-web:0.1.0": *

#show: web-page.with(
  title: "เว็บไซต์ของฉัน",
  theme: "ocean",
  header: navbar(brand: [My Company]),
)

#hero(
  tag: "ยินดีต้อนรับ",
  title: [สร้างเว็บง่ายๆ ด้วย Typst],
  subtitle: [ไม่ต้องเขียน HTML และ CSS อีกต่อไป],
  actions: (
    btn("https://lumra.dev", "เริ่มต้นเลย"),
  ),
)

#card(title: "สวัสดีชาวโลก")[
  นี่คือเนื้อหาการ์ดแรกของคุณ!
]
```

#v(20pt)

#callout(type: "info", title: "การทดสอบบน MyLumra Browser")[
  เพียงเปิดแอป **MyLumra** แล้วพิมพ์ URL ของไฟล์ Typst เช่น `file:///path/to/landing.typ` หรือเปิดผ่านเซิร์ฟเวอร์ `https://...` บราวเซอร์จะเรนเดอร์หน้าเว็บและอัปเดตแบบเรียลไทม์ทันทีที่คุณกดบันทึกไฟล์!
]
