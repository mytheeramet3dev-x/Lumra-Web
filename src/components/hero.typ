// Hero Section component
#import "../theme.typ": active-theme
#import "badge.typ": badge

#let hero(
  tag: none,
  title: [Modern Typst Web],
  subtitle: none,
  actions: (),
  align-mode: center,
  inset-y: 40pt,
) = context {
  let th = active-theme.get()

  align(align-mode)[
    #block(
      inset: (y: inset-y, x: 20pt),
      width: 100%,
      [
        #if tag != none [
          #badge(tag, variant: "primary", size: 9pt)
          #v(14pt)
        ]

        #text(size: 26pt, weight: "bold", fill: th.text)[#title]
        #v(10pt)

        #if subtitle != none [
          #box(width: 80%)[
            #text(size: 13pt, fill: th.text-muted)[#subtitle]
          ]
          #v(20pt)
        ]

        #if actions.len() > 0 [
          #stack(
            dir: ltr,
            spacing: 12pt,
            ..actions
          )
        ]
      ]
    )
  ]
}
