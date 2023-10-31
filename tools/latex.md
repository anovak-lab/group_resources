# Latex

Latex is an extremely useful tool for rendering text.

### Some Useful Packages

- `siunitx` for formatting of units; simply type the unit in long form spelling, and it will be rendered with the proper superscripts, e.g. `\si{\kilo\gram\per\second\per\meter}`
- `subcaption` is useful for making subfigures, each with their own caption. It's a good idea for each subfigure to be the same height, which you can control with the size of the subfigure (i.e. instead of doing `width=0.3\linewidth`, you can also use heights like `width=3cm`).

### Glossaries

The `glossaries` package allows you to auto-expand acronyms in text (full expansion for the first appearance, acroynm for all subsequent usages). This is especially helpful when working on collaborative projects where individual writers may not be aware of when the first time an acronym is being used, and needs to be spelled out. To use, include the following in the preamble:

```
\usepackage[acronym,nomain,nonumberlist,nogroupskip,nopostdot]{glossaries}
\setacronymstyle{long-short}
\loadglsentries{glossary}
\makeglossaries
```

This will load glossary entries defined in a file named `glossary.tex`. In this file, you will in general have lines like

```
\newacronym[plural=APIs]{api}{API}{Application Programming Interface}
\newacronym{ardp}{ARDP}{Advanced Reactor Demonstration Program}
```

To use, write `\gls{ardp}`, which will get expanded the first usage. For plural acronyms, you can have Latex automatically add a trailing "s" using `\glspl{api}`. This will add an "s" to the acronym expansion, but not require you to have duplicate entries in your `glossary.tex` for the singular and plural forms of all the different acronyms.

### Citations

Citations are easy to include with a `.bib` file. This file should contain any entries you wish to cite. Some example formats are included below.
You should list the author names with first/middle names abbreviated, and with " and " separating each author in the list. Any words which must have capital letters in the title should be enclosed in curly braces. To then include the references in your document, include the following in your document where you want the citations to be listed:

```
\bibliographystyle{unsrt}
{\bibliography{biblio}}
```

where your citation file would be named `biblio.bib`, for example.

#### Journal Article

```
@Article{grobe,
   author = {D. Gro{\ss}e and U. Fischer and K. Kondo and D. Leichtle and P. Pereslavtsev and A. Serikov},
    title = {{Status of the {McCad} Geometry Conversion Tool and Related Visualization Capabilities for {3D} Fusion Neutronics Calculations}},
  journal = {Fusion Engineering and Design},
     year = 2013,
   volume = 88,
    pages = {2210--2214},
      DOI = {10.1016/j.fusengdes.2013.02.146}
}
```

For journal articles, please include the DOI field. Any special characters in people's names, or math symbols, can be written using math syntax (e.g., `$\sqrt{}$`) or for special characters, inside curly braces. A list of Latex special characters can be found [here](https://en.wikibooks.org/wiki/LaTeX/Special_Characters).

#### Conference Paper

```
@InProceedings{biondo,
  author     = {E. Biondo and G. Davidson and B. Ade},
  title      = {{Layered {CAD/CSG} Geometry for Neutronics Modeling of Advanced Reactors}},
  booktitle  = {{Proceedings of Physor}},
  year       = 2022
}
```

### Technical Report

```
@techreport{PIRT,
    Author = {J. W. Sterbentz and J. E. Werner and M. G. McKellar and A. J. Hummel and J. C. Kennedy and R. N. Wright and J. M. Biersdorf},
    Title = {Special Purpose Nuclear Reactor (5 {MW}) for Reliable Power at Remote Sites Assessment Report Using Phenomena Identification and Ranking Tables ({PIRTs})},
    Institution = {Idaho National Laboratory},
    Number = {INL/EXT-16-40741},
    Year = {2017}
}
```

#### Website

```
@misc{cardinal_rd100,
     title = {{2023 R\&D 100 Award Winners}},
     institution = {R\&D World},
     year = 2023,
     howpublished = {\url{https://tinyurl.com/4rrfhv7k}}
}
```

### Tips for Making Tables

- When making tables, useful formatting is for any floating point numbers to have their decimal points "line up." This can help readers intuitively grasp magnitudes of numbers. To force numbers to line up in a table, you can use `\phantom{abc}`, which will put a blank space equal to the size that `abc` would normally take up in the text. For numbers, you can use `\phantom{000}` for however many zeros you need.
- Do not mix scientific notation with non-scientific notation.
- The `booktabs` package is useful for making pretty tables. It comes with the commands `\toprule`, `\midrule`, and `\bottomrule` to create horizontal lines in tables. These comamnds have extra spacing around them, so they look better than `\hline`.

### Miscellaneous Tips

- To put a subscript on text (like to write UO2), you do not need to put the entire expression in math mode. Try `UO$_2$`.
