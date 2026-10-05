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
- The `*` is a wildcard and will catch all possible matches.
- You can use braces to duplicate text to reduce your typing. For instance, the following two commands are the same.

```
mv file.txt new_name.txt
mv {file,new_name}.txt
```

- Whenever you read code documentation and you see something in brackets like `<this>`, that `<this>` indicates you
are supposed to replace the entire quantity with whatever is relevant to you (it's like a placeholder used for
illustration). For example, a documentation page describing how to use `cd` may have something like

```
cd <a location>
```

which means that you are to replace the `<a location>` entire thing with where you want to go, like `cd projects`.

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

## Compiled Languages

When working with a project based on a compiled language, you will need to build an executable before you
can run that code - OpenMC, Cardinal, MOOSE, NekRS are all based on C++ and hence you need to generate an
executable before you can run these codes. These codes will all have instructions for how to generate
an executable. For example, for Cardinal [see here](https://cardinal.cels.anl.gov/without_conda.html).
You only need to compile the code one time, unless you change the source code in which case you will need
to recompile if you want to see those changes take effect.

Some code projects (MOOSE and Cardinal) have additional dependencies that you build first before compiling
MOOSE/Cardinal (e.g. libMesh, PETSc, wasp). You do not need to re-compile the entire software stack if you
change a part of a code that builds "on top of" lower-down dependencies. For instance, if you change the source
code in MOOSE, you do not need to re-build libMesh, PETSc, or wasp because MOOSE builds on top of those (you
did not change the source code in libMesh, PETSc, or wasp).

## Finding files with `find`

`find` is an extremely handy program you can use to find files or directories
that match a regular expression. A "regular expression," or "regex" for short, uses
wildcards (and other fancier syntax) to try to find matches. For instance, when typing

```
ls pr*
```

this command will return all files and directories in your current location that begin
with the letters `pr` (and are followed by *anything* else) -- this is the meaning of
the wildcard symbol, `*`. However, `ls` will only show you the contents in your immediate
directory.

To use `find` to find all possible matches in all recursive folders beneath your location,

```
find <where you want to search> -name "pr*"
```

which will list all file names that begin with `pr` and end in anything else. You can use
the wildcard expression in-between pieces of text (with the `find` command or anywhere
else you'd want to use the wildcard). For instance, to find all files which begin with
the letters `pr` and end with the extension `.sample`,

```
find <where you want to search> -name "pr*.sample"
```

## Searching Inside Files with `grep`

Sometimes it is also helpful to search for content inside of files; this is where the
`grep` command comes in handy. To search recursively (`-r` flag) and ignore binary
matches (`-I` flag), all files which contain the phrase `Problem`,

```
grep -rI "Problem" <where you want to search>
```

## Remote Servers and HPC Systems

Accessing a remote server or HPC system is typically done through an ssh connection from
a terminal on your local computer. When you login to one of these remote systems, that
terminal that you ran the `ssh` command from is now a terminal on that remote system. So,
all the shell commands you are typing are being run on that remote computer.

```
ssh ajnovak2@pinchot.npre.illinois.edu
```

Just like your local computer has a `.bashrc`, so does the remote computer - you'll want to
put commands in that file to load modules and perhaps modify your `PATH`.

You have individual home directories on systems like Pinchot (server in our group) or any
other HPC system that you have access to. In general you cannot see things in other home
directories, but you can put shared data in `/shared/data` on Pinchot.

### File Transfers

You may find yourself wanting to transfer files between the remote computer and your local computer.
You will use `scp`, which you always want to call from your local computer. In other words, from a
terminal which is open on your local computer,

```
scp <full path to file you are sending> <full path to where you want to write that file>
```

So, to copy a file from my home directory on Pinchot to wherever I am currently sitting on my local computer,

```
scp ajnovak2@pinchot.npre.illinois.edu:/home/anovak/a_file.txt .
```

where the `.` is your current location. But you could also transfer a file to somewhere non-local on your local
computer by typing out a different destination.

```
scp ajnovak2@pinchot.npre.illinois.edu:/home/anovak/a_file.txt projects/group_resources
```

The above command transfers a file from the remote computer to your local computer. For the other way
around,

```
scp a_different_file.txt ajnovak2@pinchot.npre.illinois.edu:/home/anovak
```

Note that you can recursively copy entire directories with a wildcard symbol and the `-r` recusive symbol,

```
scp -r 'ajnovak2@pinchot.npre.illinois.edu:/home/ajnovak2/tritium-foam/coupling/coupled2/*' .
```

### Loading Modules

Often, a remote server or HPC system is managed by an IT group who handles installation and compilation of common
third-party dependencies that all the users of that system need (such as compilers, MPI, etc.). Many of these
systems use something called Lmod. Read [this documentation](https://lmod.readthedocs.io/en/latest/010_user.html)
to see the basic commands for Lmod.

You can see available modules that character match with some keyword by typing

```
module spider mpi
```

You can then load a specific module by typing

```
module load <module name>
```

When you load a module, its location on the computer gets pre-pended to your `PATH`. Try loading a module
and see how your `PATH` changes before and after you load the module. Be sure to put any module loads into
your `.bashrc` so you don't forget next time you log in to the system!

### ssh Keys

ssh keys are required to clone a git repository using either (i) https cloning or (ii) ssh cloning. The advantage of ssh cloning is that you can often skip entering a password for
your GitHub account. ssh keys can also be used for other automated processes and
function somewhat like passwords that authenticate your account (e.g. for GitHub) when
you are on multiple different systems. [This page](https://www.ssh.com/academy/ssh-keys) provides
an extensive discussion on ssh keys.

We will describe ssh keys in the context of your GitHub account. To see your ssh keys
tied to your GitHub account, go visit: (i) Profile, then (ii) SSH and GPG keys. You will
in general have one ssh key per physical machine that you use; "physical machines" could
include your laptop, Pinchot, Bitterroot, Frontier, Improv, etc.

To generate a new ssh key, follow the "Generate new SSH key" instructions
[here](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent). Then, once you have generated this ssh
key, copy the contents of the generated file, which will be named something like
`id_<number>.pub`, and paste into GitHub where you are adding a new key. I recommend
naming that key to be the name of the computer corresponding to that key.

You will also have ssh keys associated with sites like GitLab, or sometimes for
different account pages associated with HPC accounts. For instance, Argonne's
[CELS accounts](https://accounts.cels.anl.gov/#/login) have ssh keys that are used to
access various ANL resources.

### HPC Systems

On HPC systems, when you login to the system, you will be placed on a "login" node. This is a shared place
where everyone lands when they login to the system. These nodes are *NOT* meant for running simulations - only
for compiling code and basic file manipulations.

Read [this documentation](https://cardinal.cels.anl.gov/hpc_build_run_tips.html) for information about
running some of the software we use in our group on HPC systems, which will go into a bit more detail about
modules and compilation.
