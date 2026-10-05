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

### `~/.vimrc` Configuration File


