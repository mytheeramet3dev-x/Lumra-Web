// Button component (interactive links styled as buttons)
#import "../theme.typ": active-theme

#let btn(
  url,
  label,
  variant: "primary", // primary, secondary, outline, ghost
  size: 10pt,
) = context {
  let th = active-theme.get()

  let (bg, fg, stroke-val) = if variant == "primary" {
    (th.primary, rgb("ffffff"), none)
  } else if variant == "secondary" {
    (th.surface, th.text, 0.5pt + th.border)
  } else if variant == "outline" {
    (none, th.primary, 1pt + th.primary)
  } else {
    // ghost
    (none, th.text, none)
  }

  link(url)[
    #box(
      fill: bg,
      radius: 6pt,
      inset: (x: 14pt, y: 7pt),
      stroke: stroke-val,
      baseline: -2pt,
      text(size: size, weight: "bold", fill: fg)[#label]
    )
  ]
}
