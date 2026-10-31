// Grid layout helper component
#let grid-layout(
  cols: 3,
  gutter: 16pt,
  align: top + left,
  ..items
) = {
  let col-spec = if type(cols) == int {
    (1fr,) * cols
  } else {
    cols
  }

  grid(
    columns: col-spec,
    column-gutter: gutter,
    row-gutter: gutter,
    align: align,
    ..items
  )
}
