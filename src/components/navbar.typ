// Navbar component
#import "../theme.typ": active-theme
#import "button.typ": btn

#let navbar(
  brand: [Lumra],
  brand-url: "/",
  logo: none,
  links: (),
  cta-label: none,
  cta-url: none,
) = context {
  let th = active-theme.get()

  block(
    fill: th.surface,
    stroke: (bottom: 1pt + th.border),
    inset: (x: 20pt, y: 12pt),
    width: 100%,
    [
      #grid(
        columns: (auto, 1fr, auto),
        align: (left + horizon, center + horizon, right + horizon),
        // Brand
        link(brand-url)[
          #box[
            #if logo != none [
              #logo
              #h(6pt)
            ]
            #text(size: 13pt, weight: "bold", fill: th.text)[#brand]
          ]
        ],
        // Navigation Links
        [
          #for item in links [
            #h(10pt)
            #link(item.url)[
              #text(size: 10pt, weight: "medium", fill: th.text-muted)[#item.label]
            ]
            #h(10pt)
          ]
        ],
        // CTA Action Button
        [
          #if cta-label != none and cta-url != none [
            #btn(cta-url, cta-label, variant: "primary", size: 9.5pt)
          ]
        ]
      )
    ]
  )
}
