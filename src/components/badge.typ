// Badge / Tag component
#import "../theme.typ": active-theme

#let badge(
  text,
  variant: "primary", // primary, secondary, success, warning, danger, outline
  size: 8.5pt,
) = context {
  let th = active-theme.get()

  let (bg, fg, stroke-val) = if variant == "primary" {
    (th.badge-bg, th.badge-text, none)
  } else if variant == "success" {
    (rgb("ecfdf5"), rgb("047857"), none)
  } else if variant == "warning" {
    (rgb("fffbeb"), rgb("b45309"), none)
  } else if variant == "danger" {
    (rgb("fef2f2"), rgb("b91c1c"), none)
  } else if variant == "outline" {
    (none, th.text-muted, 0.5pt + th.border)
  } else {
    (th.border-light, th.text-muted, none)
  }

  box(
    fill: bg,
    radius: 99pt,
    inset: (x: 8pt, y: 3.5pt),
    stroke: stroke-val,
    baseline: -1pt,
    outset: 0pt,
    text(size: size, weight: "medium", fill: fg)[#text]
  )
}
