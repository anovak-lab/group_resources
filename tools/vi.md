# Text Editors

A text editor is a program you use to read and write text files; text files are *not*
binary files. They are just plain text.

## vim

Vim is one of the most established text editors; Prof. Novak uses it exclusively - you
don't have to, but with a little bit of practice you can become proficient. The advantage
of vim is that it is available on virtually *every* computer system you will ever access,
and you don't need to set up anything yourself.

### The Basics

To open a file,

```
vi file.txt
```

To start editing in a file, you need to press `i` to enter insert mode. This will show you
a `-- INSERT --` in the lower left. You can now type anywhere in the file. To exit insert
mode, type

```
<escape key>
```

All commands in vim you will run when you are NOT in insert mode. Insert mode is only
for actually typing in the file. So, all the commands that follow are understood to only
be something you type when you are no longer in insert mode.

To save your change, type

```
:w
<enter key>
```

where `w` is shorthand for writing the file (saving). To exit the file, type

```
:q
<enter key>
```

where `q` is shorthand for quitting the file (closing). You can chain commands together,
so if you want to write and quit sequentially one after the other,

```
:wq
<enter key>
```

If you make a change but then try to close the file without having first saved the file,
vim will try to protect you from losing your content by showing you a warning message,
`No write since last change` - to override, and actually discard your unsaved change,

```
:q!
```

If you ever start typing a command and decide you don't want to run that command, just type

```
<escape key>
```

### Moving Around in the File

When you first enter a file, your cursor will be placed at the very beginning of the
file, on the first line and on the first character. If you ever move to a different
place and want to return to the start of the file,

```
:0
```

To move to any generic line in the file, say to line number 45,

```
:45
<enter key>
```

To go to the last line in the file, you can either jump if you know the line number as just shown, or you can use

```
:$
```

To go to the beginning of the line that your cursor is on,

```
<shift key>_
```

To go to the end of the line that your cursor is on and simultaneously enter insert mode,

```
A
```

To search for a phrase in the file,

```
/<phrase you want to search for>
```

If there are matches inside the file, you can tab between them by typing `n` (for next) while in insert mode. Use `n` to go forward in the matches; to go backwards in the matches, type `N`.

### Selecting Content

To select an entire line,

```
V
```

To select a series of lines,

```
V
<tab up or down with the arrow keys to highlight all the lines you want>
```

To select in the vertical direction (not a horizontal line, but instead a vertical selection),

```
<ctrl key>v
<use arrow keys up and down to highlight an "area">
```

### Copying, Deleting, and Inserting

Then, to copy what you have selected, with the line(s) selected you will type

```
<make a line(s) selection>
y
```

To paste the contents of what you copied, move your cursor to where you want the content
and then do

```
P
```

To delete the line(s) that you have selected, you first need to select it and then delete them with

```
<make a line(s) selection>
d
```

You can also simply delete the line that your cursor is on, without selecting it first,
by doing

```
dd
```

To delete the entire content on your cursor's line, all the way to the end of the file,

```
dG
```

To insert text in the vertical direction, after you have made a vertical selection,
enter insert mode

```
<control key>v
<make a selection>
I
<type the text you want to appear>
<escape key>
<escape key>
```

Or, if you want to instead delete in the vertical selection you have made,

```
<control key>v
<make a selection>
d
```

### Helpful vim Commands

To find and replace every occurrence of `foo` by `bar` throughout the entire file,

```
:%s/foo/bar/g
```

To find and replace every occurrence of `foo` by `bar` just on the single line on which
your cursor is sitting, don't use the percent sign in the above.

```
:%s/foo/bar/g
```

To ever undo whatever last amount of text that you wrote in the last insert mode session
(the entire session), type

```
u
```

To undo a delete,

```
redo
```

If you use a long command, and want to save yourself some typing, you can revisit your command history by

```
q:
<use up and down arrow keys to move through the command history>
<press i to enter insert mode, if you want to modify the command, then escape>
<enter key to run command>
```

### `~/.vimrc` Configuration File

A `~/.vimrc` is a configuration file, in your home directory, that you can use to customize
how vim will be used, such as

- how to color different keywords
- whether to highlight blank spaces in red (recommended because many software projects forbid the user of blank spaces at the ends of lines or blank lines at the ends of files, so that you don't end up with false positive line diffs when using git)
- what color scheme to use, etc.

Here is Professor Novak's `~/.vimrc`. You
may want to uncomment the `set number` line (all comments in this file begin with `"`),
which will show a line number to the left of each line for context.

```
"set number

set mouse=a
set cursorline

set incsearch

syntax on

set tabstop=2 shiftwidth=2 expandtab

set hlsearch

set autoindent

colorscheme desert

highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

set laststatus=2
set statusline=%f       "tail of the filename
set statusline+=\ \%y
set statusline+=%=      "right align
set statusline+=Lines:\ \%L
"set list
"set listchars=tab:>-

match ErrorMsg '\s\+$'
set clipboard=unnamed
```

There are also other vim configuration files inside the `~/.vim` directory. For instance,
you can configure vim to use syntax highlighting for files where vim doesn't know what
programming language it is (this is helpful for NekRS, where vim may not recognized that e.g.
files ending in `.oudf` are C++ code). To set this up, create (or edit, if you already have one), a `filetype.vim` file, to indicate a bunch of file extensions that vim should highlight
as fortran vs. C++ (`cpp`), etc. This file would be named `~/.vim/filetype.vim`.

```
" highlight .usr file in fortran
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.usr          setfiletype fortran
  au! BufRead,BufNewFile SIZE           setfiletype fortran
  au! BufRead,BufNewFile SIZE.inc       setfiletype fortran
  au! BufRead,BufNewFile NEKNEK         setfiletype fortran
  au! BufRead,BufNewFile TOTAL          setfiletype fortran
  au! BufRead,BufNewFile INPUT          setfiletype fortran
  au! BufRead,BufNewFile GEOM           setfiletype fortran
  au! BufRead,BufNewFile PARALLEL       setfiletype fortran
  au! bufread,bufnewfile *.oud          setfiletype cpp
  au! bufread,bufnewfile *.okl          setfiletype cpp
  au! bufread,bufnewfile *.udf          setfiletype cpp
  au! bufread,bufnewfile *.oudf         setfiletype cpp
augroup END
```
