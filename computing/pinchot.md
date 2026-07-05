# Pinchot

Pinchot is a server owned by Prof. Novak which students are free to use for running simulations, building code, etc. To access, first ask Prof. Novak to be added to the list of users. Once you have been granted access, to login use
your NetID (replace for `ajnovak2`):

```
ssh ajnovak2@pinchot.npre.illinois.edu
```

If you are not on campus internet, you will need to be on the UIUC VPN. Instructions are
[here](https://answers.uillinois.edu/illinois/page.php?id=47629). If you already have a VPN
client, simply enter `vpn.illinois.edu` and "Connect."

Once you are logged in, you will be in your home directory. Prof. Novak compiles various code projects in a shared location at `/shared/data`. If you want to use these pre-built codes, it is recommended to [add the corresponding executables to your `PATH`](https://phoenixnap.com/kb/linux-add-to-path).

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

To setup jupyter-lab first start by installing jupyter-lab in your main conda environment,

```
conda install main::jupyter
```

### Connecting

Pinchot does not have a GUI, so we will need to forward the jupyter-lab instance to local port. By default jupyter-lab is active on port 8888. This can be done by using the -L ssh option.

If you are using the vpn or are on campus wifi:

```
ssh -L 8888:localhost:8888 <username>@pinchot.npre.illinois.edu
```

If you are not using the vpn, it is possible to proxy jump through the universities linux.ews.illinois.edu server, provided you have a netid account.

```
ssh -J <username>@linux.ews.illinois.edu -L 8888:localhost:8888 <username>@pinchot.npre.illinois.edu
```

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

## Getting Help

If you need any assistance with this machine, send an email to: engrit-help@illinois.edu. For any help with the codes in `/shared/data`, please post in the group Slack channel.
