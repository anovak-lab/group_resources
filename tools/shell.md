# The Shell

The bash shell is a programming language for Unix-like operating systems (Linux, MacOS).
There are other, minor, variants which include the Z shell which come as default on
newer MacOS operating systems. These programming languages allow you to interact with
a computer through a terminal.

## Shell Commands and Scripts

Read through this [overview of bash commands](https://www.w3schools.com/bash/index.php).
Many of these commands you simply run from the command line. But you can also use those
commands inside bash programs, which will end in the `.sh` extension. For example, you
can list the content of your current location by writing

```
ls
```

You could also put that command inside a bash script by creating a file named
`my_script.sh` and then executing it (you need to change the file type to an executable
first in order to do this).

```
vi my_script.sh
```

Put the command `ls` into that script. Then, make it an executable and then run it.

```
chmod +x my_script.sh
./my_script.sh
```

There are other important aspects of using shell commands that will help you be more efficient.

- File names (and directory names) can be written as relative or absolute paths. An absolute path is the name of the file starting at the "root" directory of the computer (`/`). A relative path is the name of the file relative to where you are currently located (to go "upwards" in the file tree, you wil use `..` to indicate one directory "up").
- When you are typing out something, you can use tab completion to fill out the rest of the content - your terminal will try to match the letters you've typed against possible fits in the location where you are searching.
- You can tab up/down in order to get back commands you've already entered on the command line.
- Your home directory can be written as `~`.
- You can use braces to duplicate text to reduce your typing. For instance, the following two commands are the same.

```
mv file.txt new_name.txt
mv {file,new_name}.txt
```

## Environment Variables

To configure a computer, there is a notion of "environment variables." Read
[this page](https://www.geeksforgeeks.org/linux-unix/environment-variables-in-linux-unix/) to learn about environment variables.

Environment variables are, by convention, written in all capital letters. There are some
environment variables that exist by default, and you can also create your own. For instance,
one environment variable which will always exist is your home directory. You can see the
value it is set to using the `echo` command.

```
echo $HOME
```

To see a list of all environment variables you currently have set,

```
env | sort
```

To set an environment variable named NPRE,

```
export NPRE=123
```

Note that there cannot be a space between the environment variable name and the value it is set to! Now, if you do `env | sort` you will see that environment variable again.

A very important environment variable is the `PATH`. This variable is a list of locations
on your computer, separated by colons `:`, of where your computer will look to find programs
when you try to run a program. Let's look at the contents of your path.

```
echo $PATH
```

When running a program, you either need to (i) provide the *full* path to the executable or (ii) provide a shortened path which is inside your `PATH` environment variable. The `which` command will ask your computer to show you where a particular program is housed.

```
which cardinal-opt
```

If `which` returns something, this means that this program either (i) does not exist anywhere on your computer or (ii) it does exist somewhere on your computer, but that location is not on your `PATH` environment variable. If you
know that this program does exist on your computer, all this means is that you need to tell your computer explicitly
where that program is when you run it. For instance, if my `PATH` does not have the location `/Users/anovak/projects/cardinal` on it, but I know there is a program in there that I want to run, I can simply provide the full path to it:

```
/Users/anovak/projects/cardinal/cardinal-opt -i input.i
```

Alternatively, if you're going to be typing that a lot, it's much easier if you just add that location to your `PATH`.

```
export PATH=/Users/anovak/projects/cardinal:${PATH}
```

Now, the first directory on the `PATH` variable points to that folder with my `cardinal-opt` program. So if you
were to do

```
which cardinal-opt
```

this should now return `/Users/anovak/projects/cardinal` because this is where my computer found it on my `PATH`. Now
I can simply type the shorter name of the program (not the full path) and my computer will know how to find it's
full path.

```
cardinal-opt -i input.i
```

Your computer will search for a program on your `PATH` environment variable from the start to the back; so, if
you have multiple programs by the same name, then the ordering of the directories in your `PATH` can matter.

A very important aspect to know about environment variables is that any variables which *you* set are not maintained when you open a new terminal. Try opening a new terminal and write

```
echo $NPRE
```

You will get a blank value, because in this new terminal it has erased the "work" you did in the other terminal.

## `.bashrc` or `.zshrc` and Hidden Files

When you type `ls`, you will see a list of all the files and directories in your current
location. There are also "hidden" files which will not be displayed to you when simply typing
`ls`. Those hidden files begin with a period in their name.

Whenever you open a terminal, there is a file (named `.bashrc` for bash shells or `.zshrc` for Z shells) that is a bash program that will run every time you open a new terminal. If you
want some custom environment variables to exist any time you open a new terminal, you're
going to want to assign them in the `.bashrc` or `.zshrc`. For example, let's set the
value of our `NPRE` environment variable in our `.bashrc`. These files are in your home
directory, so let's do

```
cd $HOME
vi .bashrc
```

and then add this line at the bottom

```
export NPRE=123
```

Then save and close the file. Now, when you open a second terminal and print `env | sort`, you will see that `NPRE` is an environment variable.

You're going to extensively use the `.bashrc` and `.zshrc` to set environment variables - these variables are important for configuring a system, especially for adding locations to your `PATH` or loading modules.

## Remote Servers and HPC Systems

Accessing a remote server or HPC system is typically done through an ssh connection from
a terminal on your local computer. When you login to one of these remote systems, that
terminal that you ran the `ssh` command from is now a terminal on that remote system. So,
all the shell commands you are typing are being run on that remote computer.
