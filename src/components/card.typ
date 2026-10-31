// Card component
#import "../theme.typ": active-theme

#let card(
  title: none,
  subtitle: none,
  badge-label: none,
  badge-variant: "primary",
  icon: none,
  border: true,
  fill-override: none,
  footer: none,
  body,
) = context {
  let th = active-theme.get()

  let bg = if fill-override != none {
    fill-override
  } else {
    th.surface-card
  }

  let stroke-val = if border {
    0.75pt + th.border
  } else {
    none
  }

  block(
    fill: bg,
    stroke: stroke-val,
    radius: 10pt,
    inset: 16pt,
    width: 100%,
    [
      #if title != none or icon != none [
        #grid(
          columns: (1fr, auto),
          align: (left + horizon, right + horizon),
          [
            #if icon != none [
              #text(size: 14pt)[#icon]
              #h(6pt)
            ]
            #if title != none [
              #text(size: 13pt, weight: "bold", fill: th.text)[#title]
            ]
            #if subtitle != none [
              #v(2pt)
              #text(size: 9.5pt, fill: th.text-muted)[#subtitle]
            ]
          ],
          [
            #if badge-label != none [
              #box(
                fill: th.badge-bg,
                radius: 99pt,
                inset: (x: 8pt, y: 3pt),
                text(size: 8pt, weight: "medium", fill: th.badge-text)[#badge-label]
              )
            ]
          ]
        )
        #v(8pt)
      ]

      #text(fill: th.text)[#body]

      #if footer != none [
        #v(10pt)
        #line(length: 100%, stroke: 0.5pt + th.border-light)
        #v(6pt)
        #text(size: 9pt, fill: th.text-muted)[#footer]
      ]
    ]
  )
}
