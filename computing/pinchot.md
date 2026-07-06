# Pinchot

Pinchot is a server owned by Prof. Novak which students are free to use for running simulations, building code, etc. To access, first ask Prof. Novak to be added to the list of users. Once you have been granted access, to login use
your NetID (replace for `ajnovak2`):

```
ssh ajnovak2@pinchot.npre.illinois.edu
```

If you are not on campus internet, you will need to connect to the UIUC VPN or Use an ssh ProxyJump. VPN setup instructions are [here](https://answers.uillinois.edu/illinois/page.php?id=47629), and setting up an ssh ProxyJump is discussed later in this document. If you already have a VPN client, simply enter `vpn.illinois.edu` and "Connect."

Once you are logged in, you will be in your home directory. Prof. Novak compiles various code projects in a shared location at `/shared/data`. If you want to use these pre-built codes, it is recommended to [add the corresponding executables to your `PATH`](https://phoenixnap.com/kb/linux-add-to-path).

## ssh

### ssh keys

ssh keys allow you to securely login to a remote machine without typing a password. ssh keys are also needed if you want to push/pull with a remote repository via the ssh protocol ([github ssh-key guide]( https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)). It's best practice to create separate ssh keys for each remote machine, so we'll create a new ssh key with the following (run this on Pinchot, for instance):

```bash
# MacOS, Linux, & Windows
ssh-keygen -t ed25519 -N '' -f ~/.ssh/pinchot_ed25519
```

This will create the files `~/.ssh/pinchot_ed25519` (your new private key) and `~/.ssh/pinchot_ed25519.pub` (your new public key). Your private ssh key is a lot like a password and should be treated as such.

In order to use this ssh key you need to add the public ssh key to the remote machine:

```bash
# MacOS \& Linux
ssh-copy-id -i ~/.ssh/pinchot_ed25519 <NetID>@pinchot.npre.illinois.edu

# Windows (PowerShell)
Get-Content \~\\.ssh\\pinchot_ed25519.pub | ssh <NetID>@pinchot.npre.illinois.edu "cat >> \~/.ssh/authorized_keys"
```

Now you should be able to connect to pinchot without typing in your password by connecting with:

```
ssh -i ~/.ssh/pinchot_ed25519 <NetID>@pinchot.npre.illinois.edu
```

### ssh ProxyJump

ssh ProxyJumps can provide an alternative to the UIUC VPN which can allow you to connect without using the VPN (or even typing in any passwords, if setup correctly) at the cost of slightly increased latency. This works by first connecting to the campus EWS service, and then to pinchot.

In its simplest form you simply add the `-J` option with the ProxyJump target:

```
ssh -J <NetID>@linux.ews.illinois.edu <NetID>@pinchot.npre.illinois.edu
```

By default this will prompt you for a password (your NetID password) to connect to `linux.ews.illinois.edu` and then a password to connect to `pinchot.npre.illinois.edu`. However both of these prompts can be skipped by setting up ssh keys as described above. If you've already setup an ssh key for `pinchot.npre.illinois.edu`, simply repeat the copy step but replace `pinchot.npre.illinois.edu` with `linux.ews.illinois.edu`, however since the `-i` effects the target server and not the jump server, you'll need to specify the ssh key in the ssh config file, as described in the next section.

### ssh config

Almost all the parameters specified on the command line we can specify in a config file: `~/.ssh/config`. This file may not exist yet, and especially on windows, if you create it, make sure it doesn't end in `.txt`, since file explorer may hide the extension from you. Complete (albeit very technical) documentation for ssh config can be found [here](https://man7.org/linux/man-pages/man5/ssh_config.5.html). However below are the two expected use cases:

If you're using ProxyJump:

```
Host pinchot
  HostName pinchot.npre.illinois.edu
  User <Your NetID> 
  IdentityFile ~/.ssh/pinchot_ed25519
  ProxyJump ews

Host ews
  HostName linux.ews.illinois.edu
  User <Your NetID>
  IdentityFile ~/.ssh/pinchot_ed25519
```

If you're **not** using ProxyJump:

```
Host pinchot
  HostName pinchot.npre.illinois.edu
  User <Your NetID> 
  IdentityFile ~/.ssh/pinchot_ed25519
```

Then you can connect by simply running:

```
ssh pinchot
```

### Persistent ssh Sessions with tmux

Due to the design of the ssh protocol, if your network connection gets interrupted (laptop lid closed, switched wifi, solar flare, etc.) your ssh connection will drop and anything you were running on the server will be terminated. If you want to avoid this, you can run `tmux` to create a **t**erminal **mu**ltiple**x**er session. This will let you run programs in an environment separate from the ssh connection. You can detach from a session by pressing `ctrl-b` and then `d`, and reattach to a session after detaching or a broken ssh connection with `tmux attach`. You can also list existing sessions (if any) with `tmux ls`.

Tmux is a powerful tool with lots of other features, but it's also very complicated, if you're curious, here's the [tmux getting started guide](https://github.com/tmux/tmux/wiki/Getting-Started) and here's a [cheatsheet of keybinds/commands](https://tmuxcheatsheet.com/).

Alternatively, you can use the command ```nohup``` to start programs in the background so that they don't end if you lose connection, similarly to tmux. Be aware that nohup does not read from standard input and redirects standard out to nohup.out. To specify that you'd like to run your program in the background, use this syntax to launch:

```
nohup <command> <options> &
```

You can select which file you'd like the output to be in by redirecting the output like so:

```
nohup <command> > <myfile.txt> &
```

Remeber to ```kill``` your nohup processes when you are done with them. You can use ```pgrep <command>``` to search for the process id. 

## Cubit

Prof. Novak's group has a Cubit license, which can be accessed from Pinchot. In order to get a "screen" in order to interact with the Cubit GUI, first download the [fastx client](https://www.starnet.com/download/fastx-client) for whatever desktop operating system you have. As a reference, [this article](https://answers.illinois.edu/page.php?id=81727), in the "Connect with the desktop client" section, shows the buttons and steps needed to complete the remaining instructions. You'll use `pinchot.npre.illinois.edu` as the `Host` in the GUI.

Once installed, add a new a connection by clicking the 'plus' sign and using `pinchot.npre.illinois.edu` as the Host and `22` as the Port. Then, launch a session using "Default Desktop." Once it is launched, you can use it like a regular GUI system. The hostname and port number you should use when opening Cubit for the first time are:

```
rs-license-01.engrit.illinois.edu
5053

```

You can launch Cubit via the ubuntu shortcuts in "Activities" or by using the command:

```
coreform_cubit
```

When you're done using Cubit, please ensure you've closed Cubit (and all of it's sub-processes) before logging out of the fastx client. This stops processes from hanging and blocking other people from using Cubit due to the limited number of license seats.


## Jupyter-Lab

### Setup

To setup jupyter-lab first start by installing jupyter-lab in your main conda environment:

```
conda install main::jupyter
```

### Connecting

Pinchot does not have a GUI, but we can connect to jupyter-lab's web interface over ssh using a port forward:

```
ssh -L 8888:localhost:8888 <NetID>@pinchot.npre.illinois.edu
```

If you're using an ssh config (recommended and detailed in the ssh section), simply add the line:

```
  LocalForward 8888 localhost:8888
```

to the pinchot host's configuration, and continue to connect as normal



### Running

Then run jupyter-lab. It is recommended to run it with the local browser disabled like so:

```
jupyter-lab --no-browser
```

Assuming you do not have a password set on jupyter-lab, the first time you connect to jupyter-lab remotely you will need it's associated token, this is generated when you run the above command and should looks something like:

```
http://localhost:8888/lab?token=<your token>
http://127.0.0.1:8888/lab?token=<your token>
```

With the connection established, you can acces the jupyter-lab instance by openning up either of those links in your browser. Once that browser has the token, you can access the instance by simpling connecting to the associated port:

```
http://localhost:8888
http://127.0.0.1:888
```

You may want to run `jupyter-lab` in a `tmux` session, as detailed above in the ssh section.

## Getting Help

If you need any assistance with this machine, send an email to: engrit-help@illinois.edu. For any help with the codes in `/shared/data`, please post in the group Slack channel.

