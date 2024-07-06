#import "@preview/codly:0.2.0": *

#let rfc(
  project-name: str,
  rfc-number: none,
  rfc-name: str,
  date: datetime,
  authors: (content),
  draft: bool,
  doc,

) = {
  set page("a4")
  set par(justify: true)
  set text(font: "New Computer Modern")
  set raw(tab-size: 4)
  show raw: set text(font: "JetBrainsMono NF", weight: "bold")
  show page: set page(footer: context [#smallcaps([#project-name: RFC #rfc-number --- #rfc-name]) #h(1fr) #counter(page).display("1")])

  show: codly-init.with()
  codly(
    display-icon: false,
    zebra-color: rgb(255, 255, 255),
    fill: rgb(255, 255, 255),
    stroke-width: 0pt,
    display-name: false,
    languages: (
      rust: (name: "Rust", color: rgb("#CE412B")),
  ))

  if draft {
    [\ #text([⚠ *This RFC is a draft!* Do not use this as an implementation guide ⚠], fill: rgb(200, 50, 10)) #linebreak()]
  }

  heading([#project-name: RFC #rfc-number --- #rfc-name], outlined: false)

  text(
    fill: rgb(0, 0, 0, 180),
    [#date.display("[year].[month].[day]")
    #pad(
      y: -3pt,
      table(
            columns: (auto, auto),
            inset: 0pt,
            stroke: 0pt,
            column-gutter: 10pt,
            [Authored by:],
            [#authors],
  ))])

  outline(title: [RFC Outline])
  show heading: set heading(numbering: "1.1")
  show link: underline
  [#doc]
}

#let wip = text([⚠ *This section is TBA!* Continue at your own risk ⚠], fill: rgb(200, 50, 10));