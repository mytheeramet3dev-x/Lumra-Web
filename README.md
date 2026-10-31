# Lumra-Web 🌐

> **Modern Web Component & Layout Framework for Typst-Native Websites**  
> ปฏิวัติการสร้างเว็บไซต์ด้วยภาษา Typst สวยงาม ทรงพลัง ไร้ความซับซ้อนของ HTML/CSS

[![Typst](https://img.shields.io/badge/Typst-0.13-blue.svg)](https://typst.app)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Lumra Ecosystem](https://img.shields.io/badge/Lumra-Native%20Web-purple.svg)](https://github.com/mytheeramet3dev-x/MyLumra)

---

## 📖 สารบัญ (Table of Contents)
- [วิสัยทัศน์ (Vision)](#-วิสัยทัศน์-vision)
- [จุดเด่น (Key Features)](#-จุดเด่น-key-features)
- [โครงสร้างโฟลเดอร์ (Project Structure)](#-โครงสร้างโฟลเดอร์-project-structure)
- [เริ่มต้นใช้งาน (Quick Start)](#-เริ่มต้นใช้งาน-quick-start)
- [คอมโพเนนต์พร้อมใช้ (Component Catalog)](#-คอมโพเนนต์พร้อมใช้-component-catalog)
  - [Web Page Layout (`web-page`)](#1-web-page-layout-web-page)
  - [Navbar (`navbar`)](#2-navigation-bar-navbar)
  - [Hero Section (`hero`)](#3-hero-section-hero)
  - [Buttons (`btn`)](#4-buttons-btn)
  - [Badges & Tags (`badge`)](#5-badges--tags-badge)
  - [Cards (`card`)](#6-cards-card)
  - [Callouts (`callout`)](#7-callouts--alerts-callout)
  - [Responsive Grid (`grid-layout`)](#8-grid-layout-grid-layout)
  - [Footer (`footer`)](#9-footer-footer)
- [ระบบธีม (Theming System)](#-ระบบธีม-theming-system)
- [การทำงานร่วมกับ MyLumra Browser](#-การทำงานร่วมกับ-mylumra-browser)
- [License](#-license)

---

## 💡 วิสัยทัศน์ (Vision)

อินเทอร์เน็ตในปัจจุบันเต็มไปด้วยความซับซ้อนของ Web Stack แบบดั้งเดิม (HTML DOM, CSS Box Model, JavaScript Frameworks) ที่มักเกิดปัญหา Layout Shift, Dependency หนัก และสูญเสียคุณภาพในการจัดพิมพ์เอกสารทางวิชาการ

**Lumra-Web** ถูกพัฒนาขึ้นเพื่อให้คุณสร้างเว็บไซต์หรือเอกสารออนไลน์ทั้งหน้าได้ด้วย **Typst** ภาษาเดียว:
- ✅ **จัดหน้าแม่นยำ:** ใช้พลังของ Typst Typesetting Engine ลบปัญหา CSS bugs
- ✅ **เรนเดอร์สมการคณิตศาสตร์ระดับโลก:** รองรับสูตรคณิตศาสตร์ในตัว คมชัดทุกความละเอียด
- ✅ **ไม่ต้องมี Node.js หรือ Webpack:** เขียนไฟล์ `.typ` ไฟล์เดียว พร้อมเปิดดูได้ทันที
- ✅ **ออกแบบเพื่อเบราว์เซอร์ Lumra:** รองรับ Responsive Viewport และ Continuous Scrolling เต็มรูปแบบ

---

## ⚡ จุดเด่น (Key Features)

1. **Continuous Scroll Layout:** ปรับขนาดหน้ากระดาษแบบเว็บ (`height: auto`) เลื่อนหน้าเพจลื่นไหลเหมือนเว็บไซต์จริง
2. **Dynamic Viewport Integration:** ดึงค่าความกว้างหน้าจอจากบราวเซอร์ผ่าน `sys.inputs.at("viewport-width")` โดยอัตโนมัติ
3. **5 ธีมสำเร็จรูป:** รองรับ Ocean (Light), Dark, Emerald, Purple, Minimal และสามารถปรับ Custom Palette ได้
4. **UI Components ครบชุด:** มาพร้อมคอมโพเนนต์มาตรฐานระดับมืออาชีพ
5. **รองรับภาษาไทย 100%:** สระ-วรรณยุกต์ไม่ลอย ตัดคำถูกต้องด้วยระบบฟอนต์มาตรฐาน

---

## 📁 โครงสร้างโฟลเดอร์ (Project Structure)

```text
lumra-web/
├── typst.toml               # นิยามแพ็กเกจ Typst v0.1.0
├── lib.typ                  # ทางเข้าหลักของ Framework (Root Entrypoint)
├── src/
│   ├── lib.typ              # Re-exports รวมทั้งหมด
│   ├── layout.typ           # Main Web Page Layout & Typography Engine
│   ├── theme.typ            # Theming System (Ocean, Dark, Emerald, etc.)
│   └── components/          # คลัง UI Components
│       ├── mod.typ          # Module re-exports
│       ├── navbar.typ       # Navigation Header
│       ├── hero.typ         # Hero Banner & Call-to-action
│       ├── button.typ       # Interactive Buttons & Links
│       ├── badge.typ        # Status Badges & Category Tags
│       ├── card.typ         # Content & Feature Cards
│       ├── callout.typ      # Alert Boxes (Info, Tip, Warning, Danger)
│       ├── grid.typ         # Multi-column Grid Helper
│       └── footer.typ       # Multi-column Footer
└── examples/                # เว็บไซต์ตัวอย่าง
    ├── landing.typ          # หน้า Landing Page เต็มรูปแบบ
    ├── blog.typ             # หน้าบทความพร้อมสมการคณิตศาสตร์
    └── components_gallery.typ # แคตตาล็อกแสดงคอมโพเนนต์ทั้งหมด
```

---

## 🚀 เริ่มต้นใช้งาน (Quick Start)

สร้างไฟล์ `index.typ` และนำเข้า `lumra-web`:

```typst
#import "@preview/lumra-web:0.1.0": *

// ครอบหน้าเว็บด้วย web-page
#show: web-page.with(
  title: "เว็บไซต์แรกของฉัน",
  theme: "ocean", // "ocean", "dark", "emerald", "purple", "minimal"
  header: navbar(
    brand: [My Company],
    links: (
      (label: "หน้าแรก", url: "#home"),
      (label: "เกี่ยวกับเรา", url: "#about"),
    ),
    cta-label: "ติดต่อเรา",
    cta-url: "mailto:contact@example.com",
  ),
  footer: footer(
    brand: [My Company],
    copyright: [© 2026 My Company. All rights reserved.],
  ),
)

// Hero Section
#hero(
  tag: "ยินดีต้อนรับ",
  title: [สร้างเว็บไซต์ด้วย Typst ได้แล้ววันนี้],
  subtitle: [เรียบง่าย รวดเร็ว สวยงาม และปราศจากความวุ่นวายของ HTML/CSS],
  actions: (
    btn("#start", "เริ่มต้นใช้งาน", variant: "primary"),
    btn("#docs", "ดูเอกสารประกอบ", variant: "secondary"),
  ),
)

// Content Grid
#grid-layout(cols: 2,
  card(title: "เร็วและเบา", icon: "⚡")[
    ไม่จำเป็นต้องรัน Node.js หรือติดตั้ง node_modules หลายร้อยเมกะไบต์
  ],
  card(title: "สมการคณิตศาสตร์", icon: "🧮")[
    รองรับสูตรในตัว: $f(x) = integral_0^x e^(-t^2) dif t$
  ],
)
```

---

## 🎨 ระบบธีม (Theming System)

`lumra-web` มาพร้อม 5 โทนสีมาตรฐาน:

| ธีม (Theme) | คำอธิบาย | ตัวอย่างโทนสี |
|---|---|---|
| `ocean` | ค่าเริ่มต้น สไตล์ Modern SaaS สะอาดตา | ฟ้า Sapphire + ขาว Slate |
| `dark` | สไตล์ Dark Mode ทันสมัย ลดอาการเมื่อยล้าสายตา | น้ำเงินเข้ม Midnight + Slate 900 |
| `emerald` | สไตล์ธรรมชาติ เทคโนโลยีสีเขียว หรือ FinTech | เขียวมรกต Emerald + ขาว |
| `purple` | สไตล์ครีเอทีฟ AI หรือผลิตภัณฑ์นวัตกรรม | ม่วง Violet + ม่วงเข้ม |
| `minimal` | สไตล์ขาวดำ เรียบหรู เหมาะสำหรับเอกสารทางการ | เทา Zinc 900 + Monochrome |

เลือกธีมได้ง่ายๆ ผ่านพารามิเตอร์ `theme` ใน `#web-page.with(theme: "dark")`.

---

## 🌐 การทำงานร่วมกับ MyLumra Browser

เมื่อเปิดไฟล์ `.typ` บน [MyLumra Browser](https://github.com/mytheeramet3dev-x/MyLumra):
1. MyLumra จะส่งค่า Viewport Width ปัจจุบันผ่าน `#sys.inputs.at("viewport-width")` เข้าสู่ Typst Engine
2. `web-page` layout จะปรับขนาด Container ความกว้างของหน้าให้พอดีกับหน้าต่างเบราว์เซอร์อัตโนมัติ
3. เมื่อหน้าต่างบราวเซอร์ถูกย่อหรือขยาย ระบบจะ Re-compile และ Render ใหม่อย่างลื่นไหลในหน่วยความจำ

---

## 📄 License

โครงการนี้เผยแพร่ภายใต้ใบอนุญาต **MIT License** — สามารถนำไปใช้งานเชิงพาณิชย์และดัดแปลงได้อย่างเสรี
