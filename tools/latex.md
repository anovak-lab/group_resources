# Latex

Latex is an extremely useful tool for rendering text.

### Some Useful Packages

- `siunitx` for formatting of units; simply type the unit in long form spelling, and it will be rendered with the proper superscripts, e.g. `\si{\kilo\gram\per\second\per\meter}`
- `subcaption` is useful for making subfigures, each with their own caption. It's a good idea for each subfigure to be the same height, which you can control with the size of the subfigure (i.e. instead of doing `width=0.3\linewidth`, you can also use heights like `width=3cm`).

### Tips for Making Tables

- When making tables, useful formatting is for any floating point numbers to have their decimal points "line up." This can help readers intuitively grasp magnitudes of numbers. To force numbers to line up in a table, you can use `\phantom{abc}`, which will put a blank space equal to the size that `abc` would normally take up in the text. For numbers, you can use `\phantom{000}` for however many zeros you need.
- Do not mix scientific notation with non-scientific notation.
- The `booktabs` package is useful for making pretty tables. It comes with the commands `\toprule`, `\midrule`, and `\bottomrule` to create horizontal lines in tables. These comamnds have extra spacing around them, so they look better than `\hline`.

### Miscellaneous Tips

- To put a subscript on text (like to write UO2), you do not need to put the entire expression in math mode. Try `UO$_2$`.
