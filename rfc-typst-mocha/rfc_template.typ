#import "@preview/typpuccino:0.1.0": mocha
#import "@preview/codly:0.2.0": *

#let rfc(
  project-name: none,
  rfc-number: none,
  rfc-name: none,
  date: datetime,
  authors: (content),
  doc,

) = {
  set page("a4", fill: mocha.base)
  set par(justify: true)
  set text(font: "New Computer Modern", fill: mocha.text)
  set raw(tab-size: 4, theme: "Catppuccin.tmTheme")
  show raw: set text(font: "JetBrainsMono NF", weight: "bold")
  show page: set page(footer: context [#smallcaps([#project-name: RFC #rfc-number --- #rfc-name]) #h(1fr) #counter(page).display("1")])

  show: codly-init.with()
  codly(
    display-icon: false,
    zebra-color: mocha.mantle,
    fill: mocha.mantle,
    stroke-width: 0pt,
    display-name: false,
    languages: (
      rust: (name: "Rust", color: rgb("#CE412B")),
  ))

  heading([#project-name: RFC #rfc-number --- #rfc-name], outlined: false)

  text(
    fill: mocha.surface2,
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

  [#doc]
}

#let wip = text([*This section is TBA!* Continue at your own risk], fill: mocha.red);