// Footer component
#import "../theme.typ": active-theme

#let footer(
  brand: [Lumra],
  tagline: [A Typst-native web engine and framework for the future of documents.],
  columns: (),
  copyright: [© 2026 Lumra Project. Built with Typst.],
) = context {
  let th = active-theme.get()

  block(
    fill: th.surface,
    stroke: (top: 1pt + th.border),
    inset: (x: 24pt, y: 32pt),
    width: 100%,
    [
      #grid(
        columns: (1.5fr, ..((1fr,) * calc.max(columns.len(), 1))),
        column-gutter: 20pt,
        row-gutter: 16pt,
        [
          #text(size: 14pt, weight: "bold", fill: th.text)[#brand]
          #v(6pt)
          #text(size: 9.5pt, fill: th.text-muted)[#tagline]
        ],
        ..columns.map(col => [
          #text(size: 10.5pt, weight: "bold", fill: th.text)[#col.title]
          #v(8pt)
          #for link-item in col.links [
            #link(link-item.url)[
              #text(size: 9pt, fill: th.text-muted)[#link-item.label]
            ]
            #v(5pt)
          ]
        ])
      )

      #v(24pt)
      #line(length: 100%, stroke: 0.5pt + th.border)
      #v(14pt)

      #align(center)[
        #text(size: 8.5pt, fill: th.text-subtle)[#copyright]
      ]
    ]
  )
}
