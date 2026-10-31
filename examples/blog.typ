// Example: Technical Article & Blog Post
#import "../lib.typ": *

#let nav = navbar(
  brand: [Lumra *Blog*],
  brand-url: "lumra://home",
  links: (
    (label: "บทความทั้งหมด", url: "#articles"),
    (label: "เกี่ยวกับเรา", url: "#about"),
  ),
  cta-label: "ติดตาม",
  cta-url: "#subscribe",
)

#show: web-page.with(
  title: "ทำไม Typst ถึงเป็นอนาคตของการเผยแพร่เนื้อหาบนเว็บ",
  theme: "dark",
  max-width: 820pt,
  header: nav,
)

#badge("เทคโนโลยีเว็บ & วิทยาศาสตร์", variant: "primary")
#h(8pt)
#text(size: 9pt, fill: rgb("94a3b8"))[31 ตุลาคม 2026 • อ่าน 5 นาที • โดย Theeramet]

#v(8pt)

= ทำไม Typst ถึงเป็นอนาคตของการเผยแพร่เนื้อหาบนเว็บ

#text(size: 13pt, fill: rgb("94a3b8"))[
  การสำรวจว่าเหตุใดระบบเรียงพิมพ์เอกสารยุคใหม่อย่าง Typst จึงสามารถเข้ามาแทนที่ความซับซ้อนของ HTML DOM และ CSS Layout ได้อย่างลงตัว
]

#v(14pt)
#line(length: 100%, stroke: 0.5pt + rgb("334155"))
#v(14pt)

== 1. ปัญหาของ Web Stack แบบดั้งเดิม

ตลอดระยะเวลา 30 ปีที่ผ่านมา HTML และ CSS ถูกพัฒนาขึ้นมาเพื่อวัตถุประสงค์ของการเชื่อมโยงเอกสารแบบง่ายๆ (Hypertext) แต่เมื่อกาลเวลาผ่านไป เรานำมันมาใช้สร้าง Web Application และนิตยสารออนไลน์ระดับสูง ส่งผลให้เกิดความซับซ้อนมหาศาล:

- *Box Model Chaos:* การจัด Flexbox, CSS Grid, Floats, และ Absolute positioning ที่มักแสดงผลผิดเพี้ยนข้ามเบราว์เซอร์
- *Tooling Fatigue:* Node.js, Webpack, Vite, PostCSS, Sass, Tailwind ล้วนเพิ่มภาระในการบำรุงรักษา
- *Typography Limping:* การแสดงผลสูตรคณิตศาสตร์ต้องพึ่ง JavaScript libraries ขนาดใหญ่เช่น MathJax หรือ KaTeX ซึ่งทำให้เว็บโหลดช้า

#callout(type: "tip", title: "ข้อสังเกต")[
  หน้าเว็บส่วนใหญ่บนอินเทอร์เน็ตยังคงเป็น "การนำเสนอข้อมูล" (Content Presentation) ซึ่ง Typst ถูกสร้างมาเพื่อการนี้โดยเฉพาะตั้งแต่ต้นกำเนิด!
]

#v(16pt)

== 2. พลังของ Typst Typesetting Engine

Typst นำข้อดีของ LaTeX ในด้านการจัดรูปแบบตัวพิมพ์ชั้นสูง มารวมเข้ากับความเร็วและการใช้งานที่ง่ายเหมือน Markdown

ลองพิจารณาสมการ Schrödinger ด้านล่างนี้:

$ i hbar frac(partial, partial t) Psi(bold(r), t) = [ - frac(hbar^2, 2m) nabla^2 + V(bold(r), t) ] Psi(bold(r), t) $

ใน Typst สมการข้างต้นถูกคอมไพล์เป็น Vector Path ด้วย OpenType Math ภายในหน่วยความจำระดับไมโครวินาที (Microseconds) ไม่ต้องโหลด JavaScript ขนาด 2MB มาเรนเดอร์ในบราวเซอร์อีกต่อไป

#v(14pt)

== 3. การใช้งาน Component UI

ด้วย `lumra-web` คุณสามารถสร้าง UI components ที่ดูทันสมัยและสะอาดตาได้ง่ายๆ:

```typst
#grid-layout(cols: 2,
  card(title: "ฝั่ง Client")[
    เรนเดอร์ด้วย MyLumra Engine
  ],
  card(title: "ฝั่ง Server")[
    คอมไพล์และเสิร์ฟไฟล์ .typ บริสุทธิ์
  ]
)
```

#v(16pt)

== บทสรุป

วิสัยทัศน์ของ **Lumra Project** ไม่ใช่แค่การสร้างเบราว์เซอร์ทางเลือกใหม่ แต่คือการนำเสนอ "มาตรฐานใหม่ของเว็บเอกสาร" ที่มี Typst เป็นแกนหลัก ทั้งเรียบง่าย สวยงาม และทรงประสิทธิภาพอย่างแท้จริง

#v(24pt)

#align(center)[
  #btn("examples/landing.typ", "← กลับสู่หน้าหลัก", variant: "secondary")
]
