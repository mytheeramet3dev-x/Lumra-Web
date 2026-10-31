// Callout / Alert component
#import "../theme.typ": active-theme

#let callout(
  type: "info", // info, tip, warning, danger
  title: none,
  body,
) = context {
  let th = active-theme.get()

  let (bg, border-color, icon, default-title) = if type == "tip" {
    (rgb("ecfdf5"), rgb("10b981"), "💡", "เคล็ดลับ (Tip)")
  } else if type == "warning" {
    (rgb("fffbeb"), rgb("f59e0b"), "⚠️", "ข้อควรระวัง (Warning)")
  } else if type == "danger" {
    (rgb("fef2f2"), rgb("ef4444"), "🚨", "สำคัญ (Important)")
  } else {
    // info
    (th.primary-light, th.primary, "ℹ️", "ข้อมูลเพิ่มเติม (Info)")
  }

  let final-title = if title != none { title } else { default-title }

  block(
    fill: bg,
    stroke: (left: 3pt + border-color),
    radius: (right: 6pt),
    inset: (x: 14pt, y: 10pt),
    width: 100%,
    [
      #text(weight: "bold", size: 10.5pt, fill: th.text)[#icon #final-title] \
      #v(3pt)
      #text(fill: th.text)[#body]
    ]
  )
}
