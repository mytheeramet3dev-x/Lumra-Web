// Main Page Layout for Lumra Web
#import "theme.typ": themes, default-theme, active-theme

#let web-page(
  title: "Lumra Web",
  theme: "ocean",
  max-width: 1040pt,
  margin: (x: 20pt, top: 0pt, bottom: 32pt),
  header: none,
  footer: none,
  body,
) = {
  // Resolve theme
  let th = if type(theme) == str {
    themes.at(theme, default: default-theme)
  } else if type(theme) == dictionary {
    theme
  } else {
    default-theme
  }

  // Resolve responsive page width from Lumra browser viewport input or default
  let page-width = if "viewport-width" in sys.inputs {
    float(sys.inputs.at("viewport-width")) * 1pt
  } else {
    960pt
  }

  // Margin horizontal padding
  let margin-x = if type(margin) == dictionary and "x" in margin {
    margin.x
  } else {
    20pt
  }

  let content-width = calc.min(page-width - (margin-x * 2), max-width)

  // Page setup: continuous scroll height (height: auto)
  set page(
    width: page-width,
    height: auto,
    margin: margin,
    fill: th.background,
  )

  // Typography & Document Metadata
  set document(title: title)
  set text(
    font: ("Inter", "SF Pro Text", "Thonburi", "Sukhumvit Set", "Arial", "sans-serif"),
    size: 11pt,
    fill: th.text,
    spacing: 120%,
  )
  show math.equation: set text(font: "New Computer Modern Math")
  show link: set text(fill: th.primary)

  // Set headings
  show heading.where(level: 1): it => block(
    above: 24pt,
    below: 14pt,
    text(size: 22pt, weight: "bold", fill: th.text)[#it.body]
  )
  show heading.where(level: 2): it => block(
    above: 20pt,
    below: 12pt,
    text(size: 17pt, weight: "bold", fill: th.text)[#it.body]
  )
  show heading.where(level: 3): it => block(
    above: 16pt,
    below: 10pt,
    text(size: 13pt, weight: "bold", fill: th.text)[#it.body]
  )

  // Code block styling
  show raw: set text(font: ("Fira Code", "Menlo", "Courier New", "monospace"), size: 9.5pt)
  show raw.where(block: true): it => block(
    fill: th.code-bg,
    radius: 6pt,
    stroke: 0.5pt + th.border,
    inset: 12pt,
    width: 100%,
    it
  )

  // Theme state injection
  active-theme.update(th)

  // Header full-width
  if header != none [
    #header
    #v(16pt)
  ]

  // Main centered content container
  align(center)[
    #box(
      width: content-width,
      align(left)[
        #body
      ]
    )
  ]

  // Footer full-width
  if footer != none [
    #v(32pt)
    #footer
  ]
}
