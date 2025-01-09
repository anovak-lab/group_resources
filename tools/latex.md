# Latex

Latex is an extremely useful tool for rendering text.

### SI units

- `siunitx` for formatting of units; simply type the unit in long form spelling, and it will be rendered with the proper superscripts, e.g. `\si{\kilo\gram\per\second\per\meter}`

### Subfigures

- `subcaption` is useful for making subfigures, each with their own caption. It's a good idea for each subfigure to be the same height, which you can control with the size of the subfigure (i.e. instead of doing `width=0.3\linewidth`, you can also use heights like `width=3cm`). Below is an example for a subfigure with two images.

```
\begin{figure}[H]
    \centering
    \begin{subfigure}{0.35\textwidth}
    \includegraphics[width=\textwidth]{figures/radial_comparison_1.png}
    \caption{Relative difference, nominal power}
    \end{subfigure}
    \hspace{1cm}
    \begin{subfigure}{0.35\textwidth}
    \includegraphics[width=\textwidth]{figures/radial_comparison_2.png}
    \caption{Relative difference, overpower}
    \end{subfigure}
    \caption{Relative difference ($(P_O-P_G)/P_O$) in pinwise axially-averaged power.}
    \label{fig:radial_comparison}
\end{figure}
```

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

Citations are easy to include with a `.bib` file. This file should contain any entries you wish to cite. Some example formats are included below. Tips when writing the `.bib` file:

- If the same information is present in both conference papers and journal articles, it is preferable to cite the journal article. Oftentimes, only the attendees to a conference can easily obtain the conference papers, whereas journal articles also have undergone more rigorous peer review.
- Always try to cite the "root" reference. For example, if you want to cite the BEAVRS benchmark specifications, you should not cite a paper which _models_ the BEAVRS benchmark. You should cite the actual specifications.
- You should list the author names with first/middle names abbreviated
- Use " and " to separate each author in the list, like

```
author = {A.J. Novak and A. Hegazy}
```

- Any words which must have capital letters in the title should be enclosed in curly braces, like

```
title = {The {OpenMC} Radiation Transport Code}
```

- To have "et al." show up rendered in your PDF, you need to type "and others", like

```
author = {A.J. Novak and others}
```

To then include the references in your document, include the following in your document where you want the citations to be listed:

```
\bibliographystyle{unsrt}
{\bibliography{biblio}}
```

where your citation file would be named `biblio.bib`, for example. Some tips for then citing within your document:

- When you write multiple citations together, be sure to just separate them via commas in a single `\cite` command, like `\cite{novak1,novak2}`.
- Try to put citations at the ends of sentences, unless it might be confusing exactly what the citation is referring to. For example, in the following sentence, one citation is given for Cardinal and one for MOOSE. But, by putting them both at the end of the sentence, it's not foolproof obvious that one citation is for Cardinal and the other for MOOSE -- how would the reader distinguish this from, say, two citations for MOOSE, or maybe two citations about physics? In this case, it's best to put the citations immediately after each code.

```
Cardinal and MOOSE are two applications for solving physics \cite{cardinal, moose}.

# better
Cardinal \cite{cardinal} and MOOSE \cite{moose} are two applications for solving physics.
```

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

#### Technical Report

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
- Do not mix scientific notation with non-scientific notation. For instance, a column in a table should NOT have `0.0001` in one row and `2e-5` in another row. Use scientific notation everywhere otherwise.
- The `booktabs` package is useful for making pretty tables. It comes with the commands `\toprule`, `\midrule`, and `\bottomrule` to create horizontal lines in tables. These comamnds have extra spacing around them, so they look better than `\hline`.

### Miscellaneous Tips

- To put a subscript on text (like to write UO2), you do not need to put the entire expression in math mode. Try `UO$_2$`.
- Write math norms as `L$^2$`, not `L2`.
- Prevent figures and tables from showing up in the middle of a sentence/paragraph by (i) making sure there is a blank line before and after the object, and also adding the `[htb!]` option.

```

\begin{figure}[htb!]
\end{figure}

```

- You can force text to appear on the next page with `\clearpage`. This is useful for formatting.
- Double quotes must be typed as two back-ticks! The double quote (") will not render the proper orientation.
- Use Courier font or italics to refer to class names/function names/etc. in code. `{\tt Courier font}` or `{\it italics}`.
- Footnotes can be written as `\footnote{your text}`, and this will automatically create the symbol and put the text in the footer of the page.
- If you are really tight on page limits, you can compress text around things like figures by adding `\vspace{-0.5em}`, to shrink white space by half a life (or, change the 0.5 to another number). To add white space, use a positive number like `\vspace{0.75em}`.

### Writing Tips

- Do not begin sentences with "It" or "This," as it can easily be unclear what the subject of the sentence is.
- Only capitalize names and proper titles
- Do not capitalize elements on the periodic table (e.g., tritium not Tritium)
- A common grammar mistake is improperly using plural vs. singular verbs. Consider the following sentence: "The demand for new space technologies have been growing." This is WRONG grammar -- the subject of the sentence is "The demand," but I often see students pick the plural vs. singular verb based on some intermediate word ("technologies"). To find out whether a verb should be singular or plural, try removing any intermediate words and putting the subject of the sentence adjacent to the verb you want to use, and see if it makes sense.

```
The demand ... have been growing --> clearly wrong
```

- Be VERY careful about the difference between "validation" and "verification." Verification is anything where a comparison is made to another code, to an analytic solution, etc. ONLY validation refers to comparison against real-world, physical data like from an experiment. You are NOT validating code A if the results match code B.
